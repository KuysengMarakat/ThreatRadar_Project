import 'package:flutter/material.dart';

class bottomNavigationBarWidget extends StatefulWidget {
  bottomNavigationBarWidget({super.key,required this.onAlert, required this.onHome,required this.onProfile,required this.onWebsite});
  VoidCallback onHome;
  VoidCallback onAlert;
  VoidCallback onWebsite;
  VoidCallback onProfile;

  @override
  State<bottomNavigationBarWidget> createState() => _bottomNavigationBarWidgetState();
}

class _bottomNavigationBarWidgetState extends State<bottomNavigationBarWidget> {
  int selectIndex=0;

  
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        
        
            GestureDetector(
              onTap: () {
                setState(() => selectIndex = 0); 
                widget.onHome();                    
              },
              child: Container(
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home, size: 30,color: selectIndex ==0 ? Colors.red:Colors.grey),
                      Text("Home", style: TextStyle(fontSize: 10,color:selectIndex ==0 ? Colors.red:Colors.grey )),
                    ],
                  ),
                ),
              ),
            ),
        
            GestureDetector(
              onTap:  () {
                setState(() => selectIndex = 1); 
                widget.onAlert();                    
              },
              child: Container(
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.warning, size: 30,color: selectIndex ==1 ? Colors.red:Colors.grey,),
                      Text("Alert", style: TextStyle(fontSize: 10,color: selectIndex ==1 ? Colors.red:Colors.grey)),
                    ],
                  ),
                ),
              ),
            ),
        
            GestureDetector(
              onTap:  () {
                setState(() => selectIndex = 2); 
                widget.onWebsite();                    
              },
              child: Container(
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.language, size: 30,color: selectIndex ==2 ? Colors.red:Colors.grey,),
                      Text("Website", style: TextStyle(fontSize: 10,color: selectIndex ==2 ? Colors.red:Colors.grey,)),
                    ],
                  ),
                ),
              ),
            ),
        
            GestureDetector(
              onTap:  () {
                setState(() => selectIndex = 3); 
                widget.onProfile();                    
              },
              child: Container(
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person, size: 30,color: selectIndex ==3 ? Colors.red:Colors.grey,),
                      Text("Profile", style: TextStyle(fontSize: 10,color: selectIndex ==3 ? Colors.red:Colors.grey,)),
                    ],
                  ),
                ),
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
