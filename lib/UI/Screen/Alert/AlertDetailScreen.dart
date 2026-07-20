import 'package:flutter/material.dart';

import 'package:my_app/UI/Card/AlertDetailCard.dart';
import 'package:my_app/data/repo/Resposity_Alert.dart';
import 'package:my_app/model/alert.dart';

// void main() {
//   runApp(
//     MaterialApp(debugShowCheckedModeBanner: false, home: Alertdetailscreen()),
//   );
// }

class Alertdetailscreen extends StatefulWidget {
  Alertdetailscreen({super.key, required this.alert, required this.index});
  final Alert alert;
  final int index;

  @override
  State<Alertdetailscreen> createState() => _AlertdetailscreenState();
}

class _AlertdetailscreenState extends State<Alertdetailscreen> {
  ResposityAlert repo = ResposityAlert.global;
  void onResolve() async {
    await repo.Update(id: widget.index, status: Status.Resolve);
    Navigator.pop(context);
  }

  void onInprogress() async {
    await repo.Update(id: widget.index, status: Status.Inprogress);
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
            Alertdetailcard(alert: widget.alert),
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
