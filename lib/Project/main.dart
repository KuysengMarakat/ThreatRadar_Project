
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Project/UI/AlertScreen.dart';
import 'package:my_app/Project/UI/LoginScreen.dart';
import 'package:my_app/Project/UI/widgets/Button_Navigaion_Bar.dart';
import 'package:my_app/Project/UI/widgets/app_Bar.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppScreen(),
    )
  );
}

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

enum AsynState{
  Home,
  Alert,
  Website,
  Profile
}

class _AppScreenState extends State<AppScreen> {
  AsynState asynState = AsynState.Alert;

  void onHome(){
    setState(() {
      asynState = AsynState.Home;
    });
  }
  void onAlert(){
    setState(() {
      asynState = AsynState.Alert;
    });
  }

  void onWebsite(){
    setState(() {
      asynState = AsynState.Website;
    });
  }

   void onProfile(){
    setState(() {
      asynState = AsynState.Profile;
    });
  }
  

  Widget get Content{
    switch (asynState) {
      case AsynState.Alert:
        return Alertscreen();

      case AsynState.Home:
        return Center(
          child: Text("hello"),
        );
        
      case AsynState.Website:
        return Center(
          child: Text("Wesite")
        );
       
      case AsynState.Profile:
        return Center(
          child: Text("Profile")
        );
       
    }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(backgroundColor: Colors.white, title: AppBarWidget()),
      backgroundColor: Color(0xFF260304),
      body: Content,
      bottomNavigationBar: bottomNavigationBarWidget(onAlert: onAlert, onHome: onHome, onProfile: onProfile, onWebsite: onWebsite),
    );
  }
}
