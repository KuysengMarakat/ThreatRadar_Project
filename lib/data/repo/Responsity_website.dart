
import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

void main () async{
  String web="https://network-design-project.vercel.app/";

  Uri urlData = Uri.parse("https://phneak-tep-default-rtdb.asia-southeast1.firebasedatabase.app/Websites/site_001.json");
  Uri urlWeb = Uri.parse(web);

  Response response = await http.get(urlWeb);
  if(response.statusCode == 200){
    Response saveResponse = await http.put(urlData,
      headers: {"content-type" : "application/json"},
      body: jsonEncode(
        {
        "name": "KhmerCharm",
        "url": web,
        "status": "active",
        "addTime": DateTime.now().toString(),
        }
      )
    );
    if(saveResponse.statusCode == 200){
      print("Save successfull!");
    }
  }
  else{
    print("WebServer not found");
  }


}