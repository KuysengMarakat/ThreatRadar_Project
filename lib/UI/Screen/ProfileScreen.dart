import 'package:flutter/material.dart';
import 'package:my_app/UI/Screen/ManageUerScreen.dart';

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

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 180,
            color: const Color.fromARGB(255, 112, 14, 5),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  CircleAvatar(backgroundColor: Colors.white, maxRadius: 55),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Kuy SengMarakat",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow),
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Text(
                          "Super Admin",
                          style: TextStyle(color: Colors.yellow),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),

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
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                      maxRadius: 25,
                    ),
                    title: Text(
                      "Profile",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_right, size: 30),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                      maxRadius: 25,
                    ),
                    title: Text(
                      "Change Password",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_right, size: 30),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                      maxRadius: 25,
                    ),
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
    ;
  }
}
