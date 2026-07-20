import 'package:my_app/data/repo/Resposity_Alert.dart';
import 'package:my_app/model/alert.dart';

class AlertFilter {
  static AlertFilter alertFilterGlobal = AlertFilter();
  ResposityAlert resposityAlert = ResposityAlert.global;

 
  
  List<Alert> filterByRisk(List<Alert> alerts, RiskLevel risk) {
    List<Alert> result = [];
    for (int i = 0; i < alerts.length; i++) {
      if (alerts[i].ristLevel == risk) {
        result.add(alerts[i]);
      }
    }
    return result;
  }
}