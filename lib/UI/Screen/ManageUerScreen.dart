
import 'package:flutter/material.dart';

class Manageuerscreen extends StatefulWidget {
  const Manageuerscreen({super.key});

  @override
  State<Manageuerscreen> createState() => _ManageuerscreenState();
}

class _ManageuerscreenState extends State<Manageuerscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFF260304),
      appBar: AppBar(
        title: Center(
          child: Text("Manage user",),
        ),
        actions: [IconButton(onPressed: ()=>{}, icon: Icon(Icons.add))],
      ),
      body: Padding(
        padding:EdgeInsets.all(20),
        child: Column(
          children: [
             TextField(
                decoration: InputDecoration(
                  hintText: "Search By name or email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                  )
                ),
              
            
          ],
        ),
        ),
    );
  }
}