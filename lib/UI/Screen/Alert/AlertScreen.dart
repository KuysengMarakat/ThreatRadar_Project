import 'package:flutter/material.dart';
import 'package:my_app/UI/Card/AlertCard.dart';
import 'package:my_app/UI/widgets/filter.dart';
import 'package:my_app/data/Service/alert_filter.dart';
import 'package:my_app/data/repo/Resposity_Alert.dart';
import 'package:my_app/data/repo/UserReposity.dart';
import 'package:my_app/model/alert.dart';

// void main() {
//   runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Alertscreen()));
// }

class Alertscreen extends StatefulWidget {
  Alertscreen({super.key, required this.user});
  UserReposity user;

  @override
  State<Alertscreen> createState() => _AlertscreenState();
}


enum FilterType { All, High, Meduim, Critical }

enum Asynstate { Loading, Successful, Error }


class _AlertscreenState extends State<Alertscreen> {
  ResposityAlert resposityAlert = ResposityAlert.global;
  FilterType filterType = FilterType.All;
  AlertFilter alertFilter = AlertFilter.alertFilterGlobal;
  
  List<Alert> allAlerts = [];  
  List<Alert> filter = [];
  Asynstate asynState = Asynstate.Loading;

  String? get siteId => widget.user.selectedWebsite;

  
  void onAll() {
    setState(() {
      filterType = FilterType.All;

    });
  }

  void onHigh() {
    setState(() {
      filterType = FilterType.High;
    });
  }

  void onMeduim() {
    setState(() {
      filterType = FilterType.Meduim;
   
    });
  }

  void onCritical() {
    setState(() {
      filterType = FilterType.Critical;
    
    });
  }

  @override
  void initState() {
    super.initState();
    fectData();
  }

  void fectData() {
    asynState = Asynstate.Loading;
    setState(() {});
    
    String? siteId = widget.user.selectedWebsite;
    if (siteId == null) {
      setState(() => asynState = Asynstate.Error);
      return;
    }
    
    resposityAlert.streamAlertByWebsite(siteId).listen(
      (alerts) {
        setState(() {
          allAlerts = alerts;  
          
          
          if (filterType == FilterType.All) {
            filter = alerts;
          } else if (filterType == FilterType.High) {
            filter =  alertFilter.filterByRisk(alerts, RiskLevel.High);
          } else if (filterType == FilterType.Meduim) {
            filter = alertFilter.filterByRisk(alerts, RiskLevel.Meduim);
          } else if (filterType == FilterType.Critical) {
            filter = alertFilter.filterByRisk(alerts, RiskLevel.Critical);
          }
          
          asynState = Asynstate.Successful;
        });
      },
      onError: (error) {
        setState(() {
          asynState = Asynstate.Error;
        });
      },
    );
  }

  Widget get content {
    switch (asynState) {
      case Asynstate.Loading:
        return Center(child: CircularProgressIndicator());
      case Asynstate.Successful:
        return ListView.builder(
          itemCount: filter.length,
          itemBuilder: (context, index) => Alertcard(
            alert: filter[index],
            index: index,
          ),
        );
      case Asynstate.Error:
        return Center(child: Text("Can't Fetch Data"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          filterWidget(
            onAll: onAll,
            onHigh: onHigh,
            onMeduim: onMeduim,
            onCritical: onCritical,
          ),
          Expanded(child: content),
        ],
      ),
    );
  }
}