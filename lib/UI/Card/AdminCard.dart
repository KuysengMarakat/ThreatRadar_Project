
import 'package:flutter/material.dart';

class AdminTile extends StatelessWidget {
  const AdminTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [

          
           CircleAvatar(
            radius: 22,
            backgroundColor: Colors.grey,
          ),

         SizedBox(width: 12),

          
         Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Admin1",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "admin1@thrda.com",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          
        ],
      ),
    );
  }
}