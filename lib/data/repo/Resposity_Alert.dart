import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/data/DTO/alertDto.dart';
import 'package:my_app/model/alert.dart';

void main() async {
  ResposityAlert global = ResposityAlert.global;
  //  await global.Update(id: 2, status: Status.Inprogress);
  // print(result);

  Alert alert = Alert(
    websiteId: "site_001",
    threatType: ThreatType.BruteForce,
    title: "DDOS",
    failAttempt: 5,
    ristLevel: RiskLevel.Critical,
    user: "U@gmail.com",
    detectAt: DateTime.now(),
    status: Status.New,
  );

  await global.createAlert(alert, 0);
}

class ResposityAlert {
  static final ResposityAlert global = ResposityAlert();

  Future<List<Alert>> getAllAlert() async {
    Uri url = Uri.parse(
      "https://phneak-tep-default-rtdb.asia-southeast1.firebasedatabase.app/Alert.json",
    );

    Response response = await http.get(url);

    Map<String, dynamic> json = jsonDecode(response.body);

    List<Alert> result = [];

    for (var entry in json.entries) {
      var value = entry.value;
      result.add(AlertDto.fromjson(value));
    }
    return result;
  }

  Stream<List<Alert>> streamAlertByWebsite(String websiteId) async* {
    while (true) {
      List<Alert> allAlerts = await getAllAlert();
      List<Alert> result = [];

      for (int i = 0; i < allAlerts.length; i++) {
        if (allAlerts[i].websiteId == websiteId) {
          result.add(allAlerts[i]);
        }
      }

      yield result;
      await Future.delayed(Duration(seconds: 1));
    }
  }

  //   Stream<List<Alert>> streamAlert() async* {
  //   while (true) {
  //     try {
  //       yield await getAllAlert();
  //     } catch (e) {
  //       throw Exception("Failed: $e");
  //     }
  //     await Future.delayed(Duration(seconds: 1));
  //   }
  // }

  Future<void> createAlert(Alert alert, int id) async {
    Uri url = Uri.parse(
      "https://phneak-tep-default-rtdb.asia-southeast1.firebasedatabase.app/Alert/alert_00$id.json",
    );

    Map<String, dynamic> body = AlertDto.toJson(alert);

    Response response = await http.put(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
  }

  Future<void> Update({required int id, required Status status}) async {
    Uri url = Uri.parse(
      "https://phneak-tep-default-rtdb.asia-southeast1.firebasedatabase.app/Alert/alert_00${id}.json",
    );

    Response response = await http.patch(
      url,
      headers: {"content-type": "application/json"},
      body: jsonEncode({"status": status.name}),
    );
  }
}
