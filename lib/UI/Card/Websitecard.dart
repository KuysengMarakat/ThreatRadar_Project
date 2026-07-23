import 'package:flutter/material.dart';
import 'package:my_app/data/repo/Responsity_website.dart';
import 'package:my_app/data/repo/UserReposity.dart';
import 'package:my_app/model/web.dart';

class WebsiteCard extends StatefulWidget {
  WebsiteCard({super.key,required this.website,required this.user,required this.onSelect});
  Website website;
  UserReposity user;
  VoidCallback onSelect;

  @override
  State<WebsiteCard> createState() => _WebsiteCardState();
}

class _WebsiteCardState extends State<WebsiteCard> {
  ResponsityWebsite global = ResponsityWebsite.instance;
  
  void onSelect(){
    setState(() {
      widget.user.selectedWebsite = widget.website.id;
        
    });
    widget.onSelect();
  }


  void onDelete() async{
    await global.deleteWebsite(widget.website.id);
  }

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      
      onTap: onSelect ,
      child: Container(
        margin: EdgeInsets.all(8),
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          
        ),
        child: Center(
          child: ListTile(
            title: Text(
              widget.website.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
               widget.website.url,
                style:TextStyle(color: Colors.black54, fontSize: 12),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 60,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                  child: Text(
                    widget.website.status,
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
             
                IconButton(onPressed: onDelete, icon: Icon(Icons.delete)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
