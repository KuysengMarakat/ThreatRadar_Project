import 'package:flutter/material.dart';
import 'package:my_app/UI/Screen/auth/LoginScreen.dart';
import 'package:my_app/UI/Screen/auth/UserScreen.dart';
import 'package:my_app/data/Service/detector.dart';
import 'package:my_app/data/repo/Responsity_website.dart';
import 'package:my_app/data/repo/UserReposity.dart';

class Appscreen extends StatefulWidget {
  const Appscreen({super.key});

  @override
  State<Appscreen> createState() => _AppscreenState();
}

class _AppscreenState extends State<Appscreen> {
  UserReposity global = UserReposity.instance;
 
  

  void onLogin() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _startDetection();
  }

  void _startDetection() {
    
    Detector.global.streamDetection().listen((_) {
    
    });
  }

  Widget get content {
    bool isLoggin = global.isLoggin;
    if (isLoggin) {
      return UserScreen(user: global);
    } else {
      return Loginscreen(onLogin: onLogin, user: global);
    }
  }

  @override
  Widget build(BuildContext context) {
    return content;
  }
}
