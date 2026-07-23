import 'package:flutter/material.dart';

class filterWidget extends StatefulWidget {

 filterWidget({super.key,required this.onAll,required this.onHigh,required this.onMeduim,required this.onCritical});
  VoidCallback onAll;
  VoidCallback onHigh;
  VoidCallback onMeduim;
  VoidCallback onCritical;

  @override
  State<filterWidget> createState() => _filterWidgetState();
}

class _filterWidgetState extends State<filterWidget> {
  int selectIndex=0;


  
  @override
  Widget build(BuildContext context) {

    return Row(

      children: [
        
        SizedBox(width: 5),
        
        GestureDetector(
        onTap: ()=>{
          setState(() {
            selectIndex = 0;
            widget.onAll();
          }),
        },
          child: Container(
            width: 50,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: selectIndex == 0 ? Colors.grey : Colors.white
            ),
            child: Center(
              child: Text(
                "All",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 5),
        GestureDetector(
          onTap: ()=>{
          setState(() {
            selectIndex = 1;
            widget.onCritical();
          }),
        },
          child: Container(
            width: 75,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: selectIndex == 1 ? Colors.grey : Colors.white
            ),
            child: Center(
              child: Text(
                "Critical",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 5),
        GestureDetector(
          onTap: ()=>{
          setState(() {
            selectIndex = 2;
            widget.onHigh();
          }),
        },
          child: Container(
            width: 75,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: selectIndex == 2 ? Colors.grey : Colors.white
            ),
            child: Center(
              child: Text(
                "High",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),

        SizedBox(width: 5),

        GestureDetector(
          onTap: ()=>{
          setState(() {
            selectIndex = 3;
            widget.onMeduim();
          }),
        },
          child: Container(
            width: 75,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: selectIndex == 3 ? Colors.grey : Colors.white
            ),
            child: Center(
              child: Text(
                "Meduim",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
       
      ],
    );
  }
}
