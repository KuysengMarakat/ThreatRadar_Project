
import 'package:flutter/material.dart';

class NoWebsiteScreen extends StatelessWidget {
  const NoWebsiteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No website selected',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),

                Text(
                  'Please select a website to \n start monitoring threats',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54, fontSize: 14),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () => {}, 
                  child: Row(
                  mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: .center,
                    children: [
                      Icon(Icons.add),
                      Text("Select Webiste"),
                    ],
                  )),
              ],
            ),
          ),
        );
  }
}