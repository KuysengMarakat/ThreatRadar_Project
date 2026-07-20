import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/data/DTO/UserDto.dart';
import 'package:my_app/model/user.dart';


// void main() async {
  
//   UserReposity global = UserReposity.instance;

//   User? result = await global.Login(
//     email: 'admin@test.com',
//     password: 'admin123',
//   );

//   if (result != null) {
//     print("Login success: ${result.email}");
//   } else {
//     print("Invalid email or password");
//   }

// }

class UserReposity {
  static UserReposity instance = UserReposity();
  String? selectedWebsite;
  User? user;
  bool get isLoggin => null != user;

  Future<List<User>> getAllUser() async {
    Uri url = Uri.parse(
      "https://phneak-tep-default-rtdb.asia-southeast1.firebasedatabase.app/users/Users.json",
    );

    Response response = await http.get(url);

    Map<String, dynamic> jsons = jsonDecode(response.body);

    List<User> result = [];

    for (var entry in jsons.entries) {
      var key = entry.key;
      var value = entry.value;
      result.add(UserDto.fromJson(value));
    }
    return result;
  }

  Future<void> Login({required String email, required String password}) async {
    Uri url = Uri.parse(
      "https://phneak-tep-default-rtdb.asia-southeast1.firebasedatabase.app/users/Users.json",
    );
    Response response = await http.get(url);
    Map<String, dynamic> jsons = jsonDecode(response.body);
 

    

    for (var entry in jsons.entries) {

      var value= entry.value;
      
      
     

      if(value["email"] == email && value["password"] == password){
       User userTest = UserDto.fromJson(value);
       user = userTest;
       print(user);
       
      }
    }
   
  }
}
