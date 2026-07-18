
enum Status{
  New,
  Inprogress,
  Resolve
}
enum ThreatType{
  BruteForce,
  DDOS,
  UnusalLogin,
}
enum RiskLevel{
  High,
  Critical,
  Meduim,
}

class Alert{
  final String? websiteId;
  final ThreatType? threatType;
  final Status? status;
  final String? title;
  final String? user;
  final int? failAttempt;
  final RiskLevel? ristLevel;
  final DateTime? detectAt;

  Alert({
     required this.websiteId,
    required this.threatType,
    required this.title,
    required this.failAttempt,
    required this.ristLevel,
    required this.user,
    required this.detectAt,
    required this.status
  });

  @override
  String toString(){
    return "falided Attempt : $failAttempt , risk: $ristLevel";
  }

  
}
