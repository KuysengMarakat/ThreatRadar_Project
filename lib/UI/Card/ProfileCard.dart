
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                color: Color.fromARGB(255, 112, 14, 5),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
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
          );
  }
}