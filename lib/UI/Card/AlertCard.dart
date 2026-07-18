import 'package:flutter/material.dart';
import 'package:my_app/UI/Screen/AlertDetailScreen.dart';
import 'package:my_app/model/alert.dart';


class Alertcard extends StatefulWidget {
  Alertcard({super.key ,required this.alert});
  Alert alert;

  @override
  State<Alertcard> createState() => _AlertcardState();
}

class _AlertcardState extends State<Alertcard> {
  Color? colors(){
    if(widget.alert.ristLevel == RiskLevel.High){
      return Colors.red;
    }else if(widget.alert.ristLevel == RiskLevel.Meduim){
      return Colors.amber;
    }
    else{
      return Colors.red[900];
    }
  }
  void onClick(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Alertdetailscreen()));
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: colors(),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                widget.alert.ristLevel!.name.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
      
            SizedBox(height: 10),
      
            Text(
              widget.alert.title!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
      
            SizedBox(height: 10),
      
            Text(widget.alert.user!),
      
            SizedBox(height: 5),
      
            Text(widget.alert.detectAt.toString()),
          ],
        ),
      ),
    );
  }
}
