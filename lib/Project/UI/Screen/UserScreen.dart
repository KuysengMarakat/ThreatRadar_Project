import 'package:flutter/material.dart';
import 'package:my_app/Project/UI/Screen/AlertScreen.dart';
import 'package:my_app/Project/UI/widgets/Button_Navigaion_Bar.dart';
import 'package:my_app/Project/UI/widgets/app_Bar.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

enum AsynState { Home, Alert, Website, Profile }

class _UserScreenState extends State<UserScreen> {
  AsynState asynState = AsynState.Alert;

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
        return Center(child: Text("Wesite"));

      case AsynState.Profile:
        return Center(child: Text("Profile"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, title: AppBarWidget()),
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