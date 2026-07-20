

import 'package:my_app/model/alert.dart';

class AlertDto {
  static const String user = "affectedUser";
  static const String detectAt = "detectedAt";
  static const String failAttempt = "failedAttempts";
  static const String ristLevel = "riskLevel";
  static const String status = "status";
  static const String threatType = "threatType";
  static const String title = "title";
  static const String websiteId = "websiteId";

  static Alert fromjson(Map<String, dynamic> json) {


    ThreatType threatTypee = ThreatType.values.firstWhere(
      (element) => element.name == json[threatType]
    );
    
    Status statuss = Status.values.firstWhere(
      ((element) => element.name == json[status]
    ));

     RiskLevel riskLevell = RiskLevel.values.firstWhere(
      ((element) => element.name == json[ristLevel]
    ));

   
    

    return Alert(
      websiteId: json[websiteId],
      threatType: threatTypee,
      title: json[title],
      failAttempt: json[failAttempt] as int,
      ristLevel: riskLevell,
      user: json[user],
      detectAt: DateTime.parse(json[detectAt]),
      status: statuss,
    ); 
}


  static Map<String, dynamic> toJson(Alert alert){
    return {
      "affectedUser": alert.user,
      "detectedAt": alert.detectAt.toString(),
      "failedAttempts": alert.failAttempt,
      "riskLevel": alert.ristLevel.name,
      "status": alert.status.name,
      "threatType": alert.threatType.name,
      "title": alert.title,
      "websiteId": alert.websiteId,
    };
  }

}
