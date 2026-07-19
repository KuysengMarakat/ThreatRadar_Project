import 'package:flutter/material.dart';

class Addwebsitescreen extends StatefulWidget {
  const Addwebsitescreen({super.key});

  @override
  State<Addwebsitescreen> createState() => _AddwebsitescreenState();
}

class _AddwebsitescreenState extends State<Addwebsitescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2A0A0A),

      appBar: AppBar(
        backgroundColor: Color(0xFF2A0A0A),

        title: Text('Add Website', style: TextStyle(color: Colors.white)),

        centerTitle: true,

        iconTheme: IconThemeData(color: Colors.white),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text('Website Name', style: TextStyle(color: Colors.white70)),

            SizedBox(height: 6),

            TextField(
              style: TextStyle(color: Colors.white),

              decoration: InputDecoration(
                hintText: 'e.g ThreatRadar',

                hintStyle: TextStyle(color: Colors.white38),

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red[900]!),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red[400]!),
                ),
              ),
            ),

            SizedBox(height: 20),

            Text('Website URL', style: TextStyle(color: Colors.white70)),

            const SizedBox(height: 6),

            TextField(
              style: const TextStyle(color: Colors.white),

              decoration: InputDecoration(
                hintText: 'e.g https://example.com',

                hintStyle: const TextStyle(color: Colors.white38),

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red[900]!),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red[400]!),
                ),
              ),
            ),

            const SizedBox(height: 40),

            
            Center(
              child: ElevatedButton(
                onPressed: () => {},

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[700],

                  padding: EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 14,
                  ),
                ),

                child:  Text(
                  'Create Website',

                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
