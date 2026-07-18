import 'package:flutter/material.dart';

class filterWidget extends StatelessWidget {

 filterWidget({super.key,required this.onAll,required this.onHigh,required this.onMeduim,required this.onCritical});
  VoidCallback onAll;
  VoidCallback onHigh;
  VoidCallback onMeduim;
  VoidCallback onCritical;
  

  
  @override
  Widget build(BuildContext context) {

    return Row(

      children: [
        
        SizedBox(width: 5),
        
        GestureDetector(
          onTap: onAll,
          child: Container(
            width: 50,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white
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
          onTap: onCritical,
          child: Container(
            width: 75,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
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
          onTap: onHigh,
          child: Container(
            width: 75,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
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
          onTap: onMeduim,
          child: Container(
            width: 75,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
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
