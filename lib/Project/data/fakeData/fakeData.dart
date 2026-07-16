import 'package:my_app/Project/model/alert.dart';
import 'package:my_app/Project/model/log.dart';

List<Log> fakeLogs = [
    Log(
      action: "login_failed",
      device: "Chrome on Windows",
      email: "Nak@gmail.com",
      ip: "175.100.11.209",
      time: "2026-07-11 17:51:00",
      websiteID: "site_001",
    ),
    Log(
      action: "login_failed",
      device: "Chrome on Windows",
      email: "Nak@gmail.com",
      ip: "175.100.11.209",
      time: "2026-07-11 17:51:00",
      websiteID: "site_001",
    ),
    Log(
      action: "login_failed",
      device: "Chrome on Windows",
      email: "Nak@gmail.com",
      ip: "175.100.11.209",
      time: "2026-07-11 17:51:00",
      websiteID: "site_001",
    ),
    Log(
      action: "login_failed",
      device: "Chrome on Windows",
      email: "Nak@gmail.com",
      ip: "175.100.11.209",
      time: "2026-07-11 17:51:00",
      websiteID: "site_001",
    ),
    Log(
      action: "login_failed",
      device: "Chrome on Windows",
      email: "Nak@gmail.com",
      ip: "175.100.11.209",
      time: "2026-07-11 17:51:00",
      websiteID: "site_001",
    ),
    Log(
      action: "login_failed",
      device: "Chrome on Windows",
      email: "Nak@gmail.com",
      ip: "175.100.11.209",
      time: "2026-07-11 17:51:00",
      websiteID: "site_001",
    ),
    Log(
      action: "login_failed",
      device: "Safari on iPhone",
      email: "friend@gmail.com",
      ip: "192.168.1.5",
      time: "2026-07-07 21:15:00",
      websiteID: "site_001",
    ),
    Log(
      action: "login_success",
      device: "Safari on iPhone",
      email: "friend@gmail.com",
      ip: "192.168.1.5",
      time: "2026-07-07 21:15:30",
      websiteID: "site_001",
    ),
    Log(
      action: "login_failed",
      device: "Firefox on Linux",
      email: "victim1@site.com",
      ip: "45.77.90.12",
      time: "2026-07-07 21:10:00",
      websiteID: "site_001",
    ),
    Log(
      action: "login_failed",
      device: "Firefox on Linux",
      email: "victim2@site.com",
      ip: "45.77.90.12",
      time: "2026-07-07 21:10:30",
      websiteID: "site_001",
    ),
    Log(
      action: "login_failed",
      device: "Firefox on Linux",
      email: "victim3@site.com",
      ip: "45.77.90.12",
      time: "2026-07-07 21:11:00",
      websiteID: "site_001",
    ),
    Log(
      action: "login_success",
      device: "Chrome on Windows",
      email: "admin@site.com",
      ip: "103.87.32.55",
      time: "2026-07-07 03:30:00",
      websiteID: "site_001",
    ),
  ];



List<Alert> fakeAlerts = [
   
  
   Alert(
      websiteId: "site_001",
      threatType: ThreatType.BruteForce,
      title: "Brute Force Attack Detected",
      failAttempt: 6,
      ristLevel: RiskLevel.Meduim,
      user: "Nak@gmail.com",
      detectAt: DateTime.now().subtract(Duration(minutes: 2)),
      status: Status.New,
   ),
      Alert(
      websiteId: "site_001",
      threatType: ThreatType.BruteForce,
      title: "Brute Force Attack Detected",
      failAttempt: 6,
      ristLevel: RiskLevel.Meduim,
      user: "Nak@gmail.com",
      detectAt: DateTime.now().subtract(Duration(minutes: 2)),
      status: Status.New,
   ),
   
      Alert(
      websiteId: "site_001",
      threatType: ThreatType.BruteForce,
      title: "Brute Force Attack Detected",
      failAttempt: 6,
      ristLevel: RiskLevel.High,
      user: "Nak@gmail.com",
      detectAt: DateTime.now().subtract(Duration(minutes: 2)),
      status: Status.New,
   ),
   
      Alert(
      websiteId: "site_001",
      threatType: ThreatType.BruteForce,
      title: "Brute Force Attack Detected",
      failAttempt: 6,
      ristLevel: RiskLevel.High,
      user: "Nak@gmail.com",
      detectAt: DateTime.now().subtract(Duration(minutes: 2)),
      status: Status.New,
   ),
   
      Alert(
      websiteId: "site_001",
      threatType: ThreatType.BruteForce,
      title: "Brute Force Attack Detected",
      failAttempt: 6,
      ristLevel: RiskLevel.High,
      user: "Nak@gmail.com",
      detectAt: DateTime.now().subtract(Duration(minutes: 2)),
      status: Status.New,
   ),
   
      Alert(
      websiteId: "site_001",
      threatType: ThreatType.BruteForce,
      title: "Brute Force Attack Detected",
      failAttempt: 6,
      ristLevel: RiskLevel.High,
      user: "Nak@gmail.com",
      detectAt: DateTime.now().subtract(Duration(minutes: 2)),
      status: Status.New,
   ),
   
      Alert(
      websiteId: "site_001",
      threatType: ThreatType.BruteForce,
      title: "Brute Force Attack Detected",
      failAttempt: 6,
      ristLevel: RiskLevel.High,
      user: "Nak@gmail.com",
      detectAt: DateTime.now().subtract(Duration(minutes: 2)),
      status: Status.New,
   ),
   

   
   

 
   
   
  

];