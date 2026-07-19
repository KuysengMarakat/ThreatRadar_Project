import 'package:flutter/material.dart';

class Manageuerscreen extends StatefulWidget {
  const Manageuerscreen({super.key});

  @override
  State<Manageuerscreen> createState() => _ManageuerscreenState();
}

class _ManageuerscreenState extends State<Manageuerscreen> {
  final TextEditingController searchController = TextEditingController();

  String search = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF260304),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Manage Admins',

            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [IconButton(onPressed: () => {}, icon: Icon(Icons.add))],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: "Search admin by name or email...",
                    hintStyle: TextStyle(color: Colors.white54, fontSize: 12),

                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                  
                  onChanged: (value) {
                    setState(() {
                      search = value.toLowerCase();
                    });
                  },
                ),
              ),
            ),

            Expanded(child: Column(
              children: [
                AdminTile(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}



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