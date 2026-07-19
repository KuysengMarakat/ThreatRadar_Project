import 'package:flutter/material.dart';

import 'package:my_app/data/repo/UserReposity.dart';

class Loginscreen extends StatefulWidget {

   Loginscreen({super.key,required this.onLogin,required this.user});
   VoidCallback onLogin;
   UserReposity user;


  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isHide =false;

  
  void Login()async{
    try {
      await widget.user.Login(email: email.text, password: password.text);
      widget.onLogin();
    }catch (e){

    }
  }


  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }


  void onHide(){
    setState(() {
      isHide = !isHide;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF260304),
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Container(
                child: Image.asset("asset/logo/logo.png", height: 90),
              ),
              Container(
                child: Text(
                  "Threat Radar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: .bold,
                    fontFamily: 'CADTMonoDisplay',
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
                      controller: email,
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                    
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 20),
          
                    TextField(
                      controller: password,
                      obscureText: isHide ? true : false,
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        suffixIcon: IconButton(onPressed: onHide, icon: isHide ? Icon(Icons.visibility_off) : Icon(Icons.visibility))
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
          
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        onPressed: Login,
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
    );
  }
}
