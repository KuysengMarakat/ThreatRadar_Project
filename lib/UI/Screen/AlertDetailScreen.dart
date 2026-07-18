import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

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
  

  void onResolve(){
    Navigator.pop(context);
  }
   void onInprogress(){
    Navigator.pop(context);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF260304),
      appBar: AppBar(
        title:Text("Alert Detail")
      ),
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
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        "Possible Brute Force",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 64, 64),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "High",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),
                  Container(height: 3, color: Colors.grey),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "TimeLine",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(DateFormat('HH:mm').format(DateTime.now()),style: TextStyle(fontWeight:FontWeight.bold),),
                      
                      Text("Souce IP: 172.100.11.209",style: TextStyle(fontWeight:FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                    
                  ),
                  onPressed: onInprogress, child: Text("In Progress")
                  ),
               
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                   
                  ),
                  onPressed: onResolve, child: Text("Resolve",style: TextStyle(fontWeight: FontWeight.bold),)
                  
                  ),
              ],
            )
          ],
        ),
      ),

      
    );
    
  }
}
