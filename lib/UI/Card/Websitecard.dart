import 'package:flutter/material.dart';
import 'package:my_app/model/web.dart';

class WebsiteCard extends StatelessWidget {
  WebsiteCard({super.key,required this.website});
  Website website;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: ListTile(
          title: Text(
            website.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Container(
            width: 60,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.green,
            ),
            child: Text(
              website.status,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
