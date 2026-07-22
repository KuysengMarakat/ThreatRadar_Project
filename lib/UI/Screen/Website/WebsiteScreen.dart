import 'package:flutter/material.dart';
import 'package:my_app/UI/Card/Websitecard.dart';
import 'package:my_app/data/repo/Responsity_website.dart';
import 'package:my_app/data/repo/UserReposity.dart';
import 'package:my_app/model/web.dart';

class WebsiteScreen extends StatefulWidget {
  WebsiteScreen({super.key,required this.user,required this.onSelect});

  UserReposity user;
  
  VoidCallback onSelect;
  @override
  State<WebsiteScreen> createState() => _WebsiteScreenState();
}

enum Asynstate { Loading, Successful, Error }

class _WebsiteScreenState extends State<WebsiteScreen> {
  ResponsityWebsite responsityWebsite = ResponsityWebsite.instance;
  List<Website> allWeb = [];
  Asynstate state = Asynstate.Loading;

  
  void initState() {
    super.initState();

    fetchData();
  }

  // void fetchData() async {
  //   state = Asynstate.Loading;
  //   setState(() {});

  //   try {
  //     allWeb = await responsityWebsite.getAllWebsite();
  //     setState(() {
  //       state = Asynstate.Successful;
  //     });
  //   } catch (e) {
  //     state = Asynstate.Error;
  //   }
  // }
  void fetchData () async{
    state = Asynstate.Loading;
    setState(() {
      
    });

    responsityWebsite.streamWebsite().listen(
      (Website){
        setState(() {
          allWeb =Website;
          state =Asynstate.Successful;
        });
      },
      onError: (error){
        setState(() {
          state = Asynstate.Error;
        });
      }
    );
  }

  Widget get content {
    switch (state) {
      case Asynstate.Loading:
        return Center(child: CircularProgressIndicator());

      case Asynstate.Successful:
        return Padding(
          padding: EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: allWeb.length,
            itemBuilder: (context, index) => WebsiteCard(website: allWeb[index],user: widget.user,onSelect: widget.onSelect,),
          ),
        );
      case Asynstate.Error:
        return Center(child: Text("Error"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return content;
  }
}

