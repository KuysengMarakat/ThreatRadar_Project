import 'package:flutter/material.dart';
import 'package:my_app/UI/Card/ProfileCard.dart';
import 'package:my_app/UI/Screen/Profile/ManageUerScreen.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  @override
  void onManage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Manageuerscreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ProfileCard(),
          SizedBox(height: 10),

          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  ListTile(
                    
                    title: Text(
                      "Profile",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_right, size: 30),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    
                    title: Text(
                      "Change Password",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_right, size: 30),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    
                    title: Text(
                      "Manage Admin",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_right, size: 30),
                    onTap: onManage,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    
  }
}

