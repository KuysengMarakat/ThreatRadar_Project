

import 'package:flutter/material.dart';
import 'package:my_app/model/web.dart';

class HomeCard extends StatelessWidget {
  final Website website;
  final int unresolvedAlerts;
  final VoidCallback onViewAlerts;
  final VoidCallback onSwitchWebsite;

  const HomeCard({
    super.key,
    required this.website,
    required this.unresolvedAlerts,
    required this.onViewAlerts,
    required this.onSwitchWebsite,
  });

  @override
  Widget build(BuildContext context) {
    bool isActive = website.status == "active";
    
    return Container(
      margin: EdgeInsets.all(20),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.language, color: Colors.grey, size: 30),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      website.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      website.url,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          SizedBox(height: 20),
          Divider(),
          SizedBox(height: 15),
          
          // Status Badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
              color: isActive ? Colors.green[100] : Colors.red[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              isActive ? "Monitoring active" : "Monitoring inactive",
              style: TextStyle(
                color: isActive ? Colors.green[700] : Colors.red[700],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          SizedBox(height: 20),
          
          // Alerts Count
          Row(
            children: [
              Icon(Icons.notifications, color: Colors.orange),
              SizedBox(width: 10),
              Text(
                "$unresolvedAlerts unresolved alerts",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          
          SizedBox(height: 20),
          Divider(),
          SizedBox(height: 15),
          
          // Action Buttons
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: onViewAlerts,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: Text("View Alerts"),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: OutlinedButton(
                  onPressed: onSwitchWebsite,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: BorderSide(color: Colors.red),
                  ),
                  child: Text("Switch Website"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}