import 'package:flutter/material.dart';

class bottomNavigationBarWidget extends StatelessWidget {
  bottomNavigationBarWidget({super.key,required this.onAlert, required this.onHome,required this.onProfile,required this.onWebsite});
  VoidCallback onHome;
  VoidCallback onAlert;
  VoidCallback onWebsite;
  VoidCallback onProfile;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        
        
            GestureDetector(
              onTap: onHome,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home, size: 30),
                      Text("Home", style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ),
              ),
            ),
        
            GestureDetector(
              onTap: onAlert,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.warning, size: 30),
                      Text("Alert", style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ),
              ),
            ),
        
            GestureDetector(
              onTap: onWebsite,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.language, size: 30),
                      Text("Website", style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ),
              ),
            ),
        
            GestureDetector(
              onTap: onProfile,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person, size: 30),
                      Text("Profile", style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ),
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
