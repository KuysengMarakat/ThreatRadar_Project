

class Log{
  final String? action;
  final String? device;
  final String? email;
  final String? ip;
  final String? time;
  final String? websiteID;

  Log({required this.action,required this.device,required this.email,required this.ip,required this.time,required this.websiteID});

  String toString(){
    return "action : $action , email: $email , ip : $ip";
  }
}