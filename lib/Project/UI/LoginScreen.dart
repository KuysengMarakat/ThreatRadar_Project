import 'package:flutter/material.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF260304),
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: .start,
              children: [
                Container(
                  child: Image.asset("asset/logo/logo.png", height: 90),
                ),
                Container(
                  child: Text(
                    "Threat Radar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: .bold,
                    ),
                  ),
                ),

                SizedBox(height: 30),

                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: .stretch,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          label: Text("Email"),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                      SizedBox(height: 20),

                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          label: Text("Passwor"),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),

                      SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: .end,
                        children: [
                          TextButton(
                            onPressed: () => {},
                            child: Text(
                              "Fogot Password?",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),

                      Container(
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          onPressed: () => {},
                          child: Text(
                            "Sign In",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
