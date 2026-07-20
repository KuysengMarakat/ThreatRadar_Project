import 'package:flutter/material.dart';
import 'package:my_app/UI/Screen/Website/AddWebsiteScreen.dart';
import 'package:my_app/UI/Screen/Alert/AlertScreen.dart';
import 'package:my_app/UI/Screen/HomeScreen.dart';
import 'package:my_app/UI/Screen/Profile/ProfileScreen.dart';
import 'package:my_app/UI/Screen/Website/WebsiteScreen.dart';
import 'package:my_app/UI/widgets/Button_Navigaion_Bar.dart';
import 'package:my_app/UI/widgets/app_Bar.dart';
import 'package:my_app/data/repo/UserReposity.dart';

class UserScreen extends StatefulWidget {
  UserScreen({super.key, required this.user});
  UserReposity user;

  @override
  State<UserScreen> createState() => _UserScreenState();
}

enum AsynState { Home, Alert, Website, Profile }

class _UserScreenState extends State<UserScreen> {
  AsynState asynState = AsynState.Home;

  void onHome() {
    setState(() {
      asynState = AsynState.Home;
    });
  }

  void onAlert() {
    setState(() {
      asynState = AsynState.Alert;
    });
  }

  void onWebsite() {
    setState(() {
      asynState = AsynState.Website;
    });
  }

  void onProfile() {
    setState(() {
      asynState = AsynState.Profile;
    });
  }
  

  Widget get Content {
    switch (asynState) {
      case AsynState.Alert:
        if(widget.user.selectedWebsite == null){
          return NoWebsiteScreen(onSelect: onWebsite,);
        }
        return Alertscreen();

      case AsynState.Home:
        return NoWebsiteScreen(onSelect: onWebsite,);

      case AsynState.Website:
        return WebsiteScreen();

      case AsynState.Profile:
        return Profilescreen();
    }
  }
  
  void OnAddWeb(){
    Navigator.push(context,MaterialPageRoute(builder: (context)=> Addwebsitescreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, title: AppBarWidget()),
      floatingActionButton: asynState == AsynState.Website
          ? FloatingActionButton(
              shape: CircleBorder(),
              onPressed: OnAddWeb,
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              child: Icon(Icons.add),
            )
          : null,
      backgroundColor: Color(0xFF260304),
      body: Content,
      bottomNavigationBar: bottomNavigationBarWidget(
        onAlert: onAlert,
        onHome: onHome,
        onProfile: onProfile,
        onWebsite: onWebsite,
      ),
    );
  }
}

