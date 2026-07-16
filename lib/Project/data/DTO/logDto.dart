
import 'package:my_app/Project/model/log.dart';

class Logdto {
  static const String action = "action";
  static const String device = "device";
  static const String email= "email";
  static const String ip= "ip";
  static const String time= "time";
  static const String websiteID= "websiteID";

  static Log fromjson(Map<String, dynamic> json){
    return Log(action: json[action], device: json[device], email: json[email], ip: json[ip], time: json[time], websiteID: json[websiteID]);
  } 

  
 
}