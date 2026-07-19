import 'package:flutter/material.dart';
import 'package:my_app/UI/Screen/AlertScreen.dart';
import 'package:my_app/UI/Screen/ProfileScreen.dart';
import 'package:my_app/UI/Screen/WebsiteScreen.dart';
import 'package:my_app/UI/widgets/Button_Navigaion_Bar.dart';
import 'package:my_app/UI/widgets/app_Bar.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

enum AsynState { Home, Alert, Website, Profile }

class _UserScreenState extends State<UserScreen> {
  AsynState asynState = AsynState.Profile;

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
        return Alertscreen();

      case AsynState.Home:
        return Center(child: Text("hello"));

      case AsynState.Website:
        return WebsiteScreen();

      case AsynState.Profile:
        return Profilescreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: asynState == AsynState.Profile
          ? null
          : AppBar(backgroundColor: Colors.white, title: AppBarWidget()),
      floatingActionButton: asynState == AsynState.Website
          ? FloatingActionButton(
              shape: CircleBorder(),
              onPressed: () => {},
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

void main() {
  runApp(MaterialApp
  
  (debugShowCheckedModeBanner: false,
    home: UserScreen()));
}
