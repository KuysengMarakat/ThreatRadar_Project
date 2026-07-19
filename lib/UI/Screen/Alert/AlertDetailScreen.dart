import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:my_app/UI/Card/AlertDetailCard.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: Alertdetailscreen()),
  );
}

class Alertdetailscreen extends StatefulWidget {
  const Alertdetailscreen({super.key});

  @override
  State<Alertdetailscreen> createState() => _AlertdetailscreenState();
}

class _AlertdetailscreenState extends State<Alertdetailscreen> {
  void onResolve() {
    Navigator.pop(context);
  }

  void onInprogress() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF260304),
      appBar: AppBar(title: Text("Alert Detail")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Alert Detail",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Alertdetailcard(),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: onInprogress,
                  child: Text("In Progress"),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: onResolve,
                  child: Text(
                    "Resolve",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
