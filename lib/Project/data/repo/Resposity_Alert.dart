import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Project/data/DTO/alertDto.dart';
import 'package:my_app/Project/model/alert.dart';

void main() async {
  ResposityAlert global = ResposityAlert.global;
  List<Alert> result = await global.getAllAlert();
  print(result);

  Alert alert = Alert(
    websiteId: "1",
    threatType: ThreatType.BruteForce,
    title: "3",
    failAttempt: 5,
    ristLevel: RiskLevel.Critical,
    user: "6",
    detectAt: DateTime.now(),
    status: Status.New,
  );

  await global.createAlert(alert, 2);
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

  Stream<List<Alert>> streamAlert() async* {
    while (true) {
      yield await getAllAlert();

      await Future.delayed(Duration(seconds: 3));
    }
  }

  Future<void> createAlert(Alert alert, int id) async {
    Uri url = Uri.parse(
      "https://phneak-tep-default-rtdb.asia-southeast1.firebasedatabase.app/Alert/alert_00${id}.json",
    );

    Map<String, dynamic> body = AlertDto.toJson(alert);

    Response response = await http.put(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
  }
}
