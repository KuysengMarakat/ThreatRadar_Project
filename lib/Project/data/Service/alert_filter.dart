import 'package:my_app/Project/data/repo/Resposity_Alert.dart';
import 'package:my_app/Project/model/alert.dart';

// List<Alert> Highfilter(){
//   List<Alert> High = [];
//   for (int i=0 ; i< fakeAlerts.length ; i++){
//     if(fakeAlerts[i].ristLevel == RiskLevel.High){
//       High.add(fakeAlerts[i]);
//     }}
//   return High;
// }

// List<Alert> Meduimfilter(){
//   List<Alert> Meduim = [];
//   for (int i=0 ; i< fakeAlerts.length ; i++){
//     if(fakeAlerts[i].ristLevel == RiskLevel.Meduim){
//       Meduim.add(fakeAlerts[i]);
//     }}
//   return Meduim;
// }
// List<Alert> Criticalfilter(){
//   List<Alert> Critical = [];
//   for (int i=0 ; i< fakeAlerts.length ; i++){
//     if(fakeAlerts[i].ristLevel == RiskLevel.Critical){
//       Critical.add(fakeAlerts[i]);
//     }}
//   return Critical;
// }

class AlertFilter {
  static AlertFilter alertFilterGlobal = AlertFilter();
  ResposityAlert resposityAlert = ResposityAlert.global;

  Future<List<Alert>> Highfilter() async {
    List<Alert> result = await resposityAlert.getAllAlert();
    List<Alert> High = [];

    for (int i = 0; i < result.length; i++) {
      if (result[i].ristLevel == RiskLevel.High) {
        High.add(result[i]);
      }
    }

    return High;
  }

  Future<List<Alert>> Meduimfilter() async {
    List<Alert> result = await resposityAlert.getAllAlert();
    List<Alert> Meduim = [];

    for (int i = 0; i < result.length; i++) {
      if (result[i].ristLevel == RiskLevel.Meduim) {
        Meduim.add(result[i]);
      }
    }

    return Meduim;
  }

  Future<List<Alert>> Criticalfilter() async {
    List<Alert> result = await resposityAlert.getAllAlert();
    List<Alert> Critical = [];

    for (int i = 0; i < result.length; i++) {
      if (result[i].ristLevel == RiskLevel.Critical) {
        Critical.add(result[i]);
      }
    }

    return Critical;
  }

  Future<List<Alert>> Allfilter() async {
    List<Alert> result = await resposityAlert.getAllAlert();
  

   

    return result;
  }
}
