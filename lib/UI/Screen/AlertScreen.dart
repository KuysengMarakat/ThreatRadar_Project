import 'package:flutter/material.dart';
import 'package:my_app/UI/Card/AlertCard.dart';
import 'package:my_app/UI/widgets/filter.dart';
import 'package:my_app/data/Service/alert_filter.dart';
import 'package:my_app/data/repo/Resposity_Alert.dart';
import 'package:my_app/model/alert.dart';


void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Alertscreen()));
}

class Alertscreen extends StatefulWidget {
  const Alertscreen({super.key});

  @override
  State<Alertscreen> createState() => _AlertscreenState();
}

enum FilterType { All, High, Meduim, Critical }

enum Asynstate { Loading, Successful, Error }

class _AlertscreenState extends State<Alertscreen> {

  ResposityAlert resposityAlert = ResposityAlert.global;

  AlertFilter alertFilter = AlertFilter.alertFilterGlobal;

  FilterType filterType = FilterType.All;

  List<Alert> filter = [];

  Asynstate asynState = Asynstate.Loading;

  void onAll() async {
    List<Alert> result = await alertFilter.Allfilter();
    setState(() {
      filterType = FilterType.All;
      filter = result ;
    });
  }

  void onMeduim() async {
    List<Alert> result = await alertFilter.Meduimfilter();
    setState(() {
      filterType = FilterType.Meduim;
      filter = result;
    });
  }

  void onHigh() async{
    List<Alert> result = await alertFilter.Highfilter();
    setState(() {
      filterType = FilterType.High;
      filter = result;
    });
  }

  void onCritical() async {
    List<Alert> result = await alertFilter.Criticalfilter();
    setState(() {
      filterType = FilterType.Critical;
      filter = result;
    });
  }

@override
  void initState() {
  super.initState(); 
  fectData();
}

  void fectData() async{
    asynState =Asynstate.Loading;
    setState(() {
      
    });
    try{
      filter = await resposityAlert.getAllAlert();
      setState(() {
        asynState = Asynstate.Successful;
      });
    }catch (e){
      throw Exception(e);
    }
  }



  Widget get content {
    switch (asynState) {
      case Asynstate.Loading:
        return Center(child: CircularProgressIndicator());

      case Asynstate.Successful:
        return ListView.builder(
          itemCount: filter.length,
          itemBuilder: (context, index) => Alertcard(alert: filter[index]),
        );
      case Asynstate.Error:
        return Center(
          child: Text("Can't Fectch Data"),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            filterWidget(
              onAll: onAll,
              onHigh: onHigh,
              onMeduim: onMeduim,
              onCritical: onCritical,
            ),

            Expanded(
              child: content,
            ),
          ],
        ),
      );

   
    
  }
}



