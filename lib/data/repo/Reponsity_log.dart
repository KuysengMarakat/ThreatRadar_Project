import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/data/DTO/logDto.dart';
import 'package:my_app/model/log.dart';

void main() async {
  ReponsityLog global = ReponsityLog.global;

  List<Log> result = await global.getAllLog();

  print(result);


}

class ReponsityLog {
  static final ReponsityLog global = ReponsityLog();
  Future<List<Log>> getAllLog() async {
    Uri url = Uri.parse(
      "https://phneak-tep-default-rtdb.asia-southeast1.firebasedatabase.app/security_logs.json",
    );

    Response response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception("${response.statusCode}");
    }
    Map<String, dynamic> json = jsonDecode(response.body);

    List<Log> result = [];

    for (var entry in json.entries) {
      var value = entry.value;
      result.add(Logdto.fromjson(value));
    }
    return result;
  }
}
