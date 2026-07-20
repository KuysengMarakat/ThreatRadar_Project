import 'package:my_app/model/web.dart';


class WebsiteDto {
  static Website fromJson(String id, Map<String, dynamic> json) {
    return Website(
      id: id,
      name: json['name'],
      url: json['url'],
      status: json['status'],
      addTime: DateTime.parse(json['addTime']),
    );
  }

  static Map<String, dynamic> toJson(Website website) {
    return {
      "name": website.name,
      "url": website.url,
      "status": website.status,
      "addTime": website.addTime.toString(),
    };
  }
}