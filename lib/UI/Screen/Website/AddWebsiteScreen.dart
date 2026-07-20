import 'package:flutter/material.dart';
import 'package:my_app/data/repo/Responsity_website.dart';

class Addwebsitescreen extends StatefulWidget {
  const Addwebsitescreen({super.key});

  @override
  State<Addwebsitescreen> createState() => _AddwebsitescreenState();
}

class _AddwebsitescreenState extends State<Addwebsitescreen> {
  TextEditingController WebsiteName = TextEditingController();
  TextEditingController WebsiteUrl = TextEditingController();
  bool isLoading = false;
  Text? message;
  ResponsityWebsite global = ResponsityWebsite.instance;

  void onapp() async {
    if (WebsiteName.text.isEmpty || WebsiteUrl.text.isEmpty) {
      setState(() {
        message = Text("Please fill all", style: TextStyle(color: Colors.red));
      });
      return;
    }

    setState(() {
      isLoading = true;
      message = Text(
        "Checking website...",
        style: TextStyle(color: Colors.orange),
      );
    });

    bool success = await global.addWebsite(
      name: WebsiteName.text,
      websiteUrl: WebsiteUrl.text,
    );
    setState(() {
      isLoading = false;
      if (success) {
        message = Text(
          "Website added successfully!",
          style: TextStyle(color: Colors.green),
        );
      } else {
        message = Text(
          "Website added successfully!",
          style: TextStyle(color: Colors.red),
        );
      }
    });
    if (success) {
      await Future.delayed(Duration(seconds: 1));
      Navigator.pop(context);
    }
  }

  void dispose() {
    WebsiteName.dispose();

    WebsiteUrl.dispose();

    super.dispose();
  }

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
              controller: WebsiteName,
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
              controller: WebsiteUrl,
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
                onPressed: onapp,

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[700],
                ),

                child: Text(
                  'Create Website',

                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(child: message != null ? message! : null),
          ],
        ),
      ),
    );
  }
}
