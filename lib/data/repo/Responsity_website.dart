import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/data/DTO/websiteDto.dart';
import 'package:my_app/model/web.dart';

// void main () async{
//   String web="https://network-design-project.vercel.app/";

//   Uri urlData = Uri.parse("https://phneak-tep-default-rtdb.asia-southeast1.firebasedatabase.app/Websites/site_001.json");
//   Uri urlWeb = Uri.parse(web);

//   Response response = await http.get(urlWeb);
//   if(response.statusCode == 200){
//     Response saveResponse = await http.put(urlData,
//       headers: {"content-type" : "application/json"},
//       body: jsonEncode(
//         {
//         "name": "KhmerCharm",
//         "url": web,
//         "status": "active",
//         "addTime": DateTime.now().toString(),
//         }
//       )
//     );
//     if(saveResponse.statusCode == 200){
//       print("Save successfull!");
//     }
//   }
//   else{
//     print("WebServer not found");
//   }

// }

class ResponsityWebsite {
  static ResponsityWebsite instance = ResponsityWebsite();

  Future<List<Website>> getAllWebsite() async {
    Uri url = Uri.parse(
      "https://phneak-tep-default-rtdb.asia-southeast1.firebasedatabase.app/Websites.json",
    );
    Response response = await http.get(url);
    Map<String, dynamic> jsons = jsonDecode(response.body);
    List<Website> result = [];
    for (var entry in jsons.entries) {
      String id = entry.key;
      var value = entry.value;
      result.add(WebsiteDto.fromJson(id, value));
    }

    return result;
  }

  Stream<List<Website>> streamWebsite() async* {
    while (true) {
      yield await getAllWebsite();
      await Future.delayed(Duration(seconds: 2));
    }
  }

  Future<bool> addWebsite({required String name,required String websiteUrl,}) async {
    String status = "faild";
    List<Website> allWebsites = await getAllWebsite();
    int newNumber = allWebsites.length + 1;
    String siteId = "site_00$newNumber";

    Uri firebaseUrl = Uri.parse(
      "https://phneak-tep-default-rtdb.asia-southeast1.firebasedatabase.app/Websites/$siteId.json",
    );
    Uri webUrl = Uri.parse(websiteUrl);
    Response webreponse = await http.get(webUrl);
    if(webreponse.statusCode != 200) {
      return false;
    }

   Website newWebsite =Website(
    id: siteId,
    name: name,
    url: websiteUrl,
    status: "active",
    addTime: DateTime.now(),
   );

   await http.put(
    firebaseUrl,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(WebsiteDto.toJson(newWebsite)),
   );
   return true;
  }

  
}

void main () async{
  ResponsityWebsite global = ResponsityWebsite.instance;
  List <Website> r= await global.getAllWebsite();
  print(r);
  
}