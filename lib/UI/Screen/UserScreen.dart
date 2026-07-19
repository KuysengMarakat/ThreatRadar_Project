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
        return Alertscreen();

      case AsynState.Home:
        return Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No website selected',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),

                Text(
                  'Please select a website to \n start monitoring threats',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54, fontSize: 14),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () => {}, 
                  child: Row(
                  mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: .center,
                    children: [
                      Icon(Icons.add),
                      Text("Select Webiste"),
                    ],
                  )),
              ],
            ),
          ),
        );

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
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: UserScreen()));
}
