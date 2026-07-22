import 'package:flutter/material.dart';
import 'package:my_app/data/repo/Responsity_website.dart';
import 'package:my_app/data/repo/UserReposity.dart';
import 'package:my_app/model/web.dart';

class HomeCard extends StatefulWidget {
  HomeCard({
    super.key,
    required this.onViewAlerts,
    required this.onSwitchWebsite,
    required this.websiteId,
  });

  final String websiteId;
  final VoidCallback onViewAlerts;
  final VoidCallback onSwitchWebsite;

  @override
  State<HomeCard> createState() => _HomeCardState();
}

enum AsynState { error, success, loading }

class _HomeCardState extends State<HomeCard> {
  ResponsityWebsite websiteinstance = ResponsityWebsite.instance;
  List<Website> Allweb = [];
  AsynState state = AsynState.loading;
  Website? website;
  String? errorMessage;

   void initState() {
    super.initState();

    fetchData();
  }


  void fetchData() async {
    state = AsynState.loading;
    setState(() {});
    try {
      Allweb = await websiteinstance.getAllWebsite();
      for (var web in Allweb) {
        if (web.id == widget.websiteId) {
          website = web;
        }
      }
      setState(() {
        state = AsynState.success;
      });
      
    } catch (e) {
      errorMessage = e.toString();
      setState(() {
        state = AsynState.error;
      });
    }
  }

  Widget get Content {
    switch (state) {
      case AsynState.loading:
        return Center(child: CircularProgressIndicator());
      case AsynState.error:
        return Center(
          child: Text(errorMessage!),
        );
      case AsynState.success:
        return Center(
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                            website!.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            website!.url,
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                Container(height: 3, color: Colors.grey),
                SizedBox(height: 15),

                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: website!.status == "active"
                        ? Colors.green
                        : Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    website!.status == "active"
                        ? "Monitoring active"
                        : "Monitoring inactive",
                    style: TextStyle(
                      color: website!.status == "active"
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Row(
                  children: [
                    Text(
                      "unresolved alerts",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                Container(height: 3, color: Colors.grey),
                SizedBox(height: 15),

                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: widget.onViewAlerts,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                        child: Text("View Alerts"),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: widget.onSwitchWebsite,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white

                        ),
                        child: Text("Switch Website"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Content;
  }
}
