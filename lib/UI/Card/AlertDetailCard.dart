import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Alertdetailcard extends StatelessWidget {
  const Alertdetailcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  color: Color.fromARGB(255, 255, 64, 64),
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
              Text("TimeLine", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('HH:mm').format(DateTime.now()),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              Text(
                "Souce IP: 172.100.11.209",
                style: TextStyle(fontWeight: FontWeight.bold),
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
                "Analyst Note",

                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "1. Brute force attack may occur\n"
                "2. Try to check user account",

                style: TextStyle(fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
