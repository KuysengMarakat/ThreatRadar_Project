import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/model/alert.dart';

class Alertdetailcard extends StatelessWidget {
  Alertdetailcard({super.key, required this.alert});
  Alert alert;

  Color getColor() {
    if (alert.ristLevel == RiskLevel.High)
      return Color.fromARGB(255, 255, 64, 64);

    if (alert.ristLevel == RiskLevel.Meduim) return Colors.amber;

    if (alert.ristLevel == RiskLevel.Critical) return Colors.red[900]!;

    return Colors.grey;
  }

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(alert.title, style: TextStyle(fontWeight: FontWeight.bold)),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: getColor(),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  alert.ristLevel.name,
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
                DateFormat('HH:mm').format(alert.detectAt),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              Text(
                "User : ${alert.user}",
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
                "Failed Attempts: ${alert.failAttempt}\n"
                "Status: ${alert.status.name}\n"
                "Website ID: ${alert.websiteId}",

                style: TextStyle(fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
