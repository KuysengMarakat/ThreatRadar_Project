import 'package:my_app/data/fakeData/fakeData.dart';
import 'package:my_app/data/repo/Reponsity_log.dart';
import 'package:my_app/data/repo/Resposity_Alert.dart';
import 'package:my_app/model/alert.dart';
import 'package:my_app/model/log.dart';

class Detector {
  static final Detector global = Detector();

  ResposityAlert alertRepo = ResposityAlert.global;
  ReponsityLog Logrepo = ReponsityLog.global;

  Future<void> BruteForceRule() async {
    List<Alert> result = await alertRepo.getAllAlert();
    List<Log> AllLog = await Logrepo.getAllLog();
    

    int alertId = result.length + 1;

    List<String> allemailFail = [];
    DateTime now = DateTime.now();
    DateTime fiveMinute = now.subtract(Duration(minutes: 5));

    // Get unique failed emails
    for (int i = 0; i < AllLog.length; i++) {
      if (AllLog[i].action == "login_failed") {
        if (allemailFail.contains(AllLog[i].email) == false) {
          allemailFail.add(AllLog[i].email);
        }
      }
    }

    // Check each email
    for (int i = 0; i < allemailFail.length; i++) {
      int count = 0;
      String email = allemailFail[i];
      String? websiteId;

      for (int j = 0; j < AllLog.length; j++) {
        if (email == AllLog[j].email) {
          if (AllLog[j].action == "login_failed") {
            DateTime logTime = DateTime.parse(AllLog[j].time);
            if (logTime.isAfter(fiveMinute)) {
              count++;
              websiteId = AllLog[j].websiteID;
            }
          }
        }
      }

      // Alert if count >= 5
      if (count >= 5) {
        Alert alertNew = Alert(
          websiteId: websiteId ?? "unknown",
          threatType: ThreatType.BruteForce,
          title: "Brute Force Detection",
          failAttempt: count,
          ristLevel: RiskLevel.High,
          user: email,
          detectAt: now,
          status: Status.New,
        );
        try {
          await alertRepo.createAlert(alertNew, alertId+1);
          alertId++;
          print(email);
        } catch (e) {
          print(e);
        }
      }
    }
  }

  Future<void> CredentialStuffingRule() async {
    List<Alert> result = await alertRepo.getAllAlert();
    List<Log> AllLog = await Logrepo.getAllLog();
    int alertId = result.length + 1;

    List<String> allIPFail = [];
    DateTime now = DateTime.now();
    DateTime tenMinute = now.subtract(Duration(minutes: 10));

    // Get unique IPs
    for (int i = 0; i < AllLog.length; i++) {
      if (AllLog[i].action == "login_failed") {
        if (allIPFail.contains(AllLog[i].ip) == false) {
          allIPFail.add(AllLog[i].ip);
        }
      }
    }

    // Check each IP
    for (int i = 0; i < allIPFail.length; i++) {
      List<String> uniqueEmails = [];
      String ip = allIPFail[i];
      String? websiteId;

      for (int j = 0; j < AllLog.length; j++) {
        if (ip == AllLog[j].ip) {
          if (AllLog[j].action == "login_failed") {
            DateTime logTime = DateTime.parse(AllLog[j].time);
            if (logTime.isAfter(tenMinute)) {
              if (uniqueEmails.contains(AllLog[j].email) == false) {
                uniqueEmails.add(AllLog[j].email);
              }
              websiteId = AllLog[j].websiteID;
            }
          }
        }
      }

      // Alert if unique emails >= 3
      if (uniqueEmails.length >= 3) {
        Alert alertNew = Alert(
          websiteId: websiteId ?? "unknown",
          threatType: ThreatType.BruteForce,
          title: "Credential Stuffing Detection",
          failAttempt: uniqueEmails.length,
          ristLevel: RiskLevel.High,
          user: ip,
          detectAt: now,
          status: Status.New,
        );
        try {
          await alertRepo.createAlert(alertNew, alertId+1);
          alertId++;
        } catch (e) {}
      }
    }
  }

  Future<void> DDoSRule() async {
    List<Alert> result = await alertRepo.getAllAlert();
    List<Log> AllLog = await Logrepo.getAllLog();
    int alertId = result.length + 1;

    List<String> allEmailFail = [];
    DateTime now = DateTime.now();
    DateTime oneMinute = now.subtract(Duration(minutes: 1));

    // Get unique emails
    for (int i = 0; i < AllLog.length; i++) {
      if (AllLog[i].action == "login_failed") {
        if (allEmailFail.contains(AllLog[i].email) == false) {
          allEmailFail.add(AllLog[i].email);
        }
      }
    }

    // Check each email
    for (int i = 0; i < allEmailFail.length; i++) {
      List<String> uniqueIPs = [];
      String email = allEmailFail[i];
      String? websiteId;

      for (int j = 0; j < AllLog.length; j++) {
        if (email == AllLog[j].email) {
          if (AllLog[j].action == "login_failed") {
            DateTime logTime = DateTime.parse(AllLog[j].time);
            if (logTime.isAfter(oneMinute)) {
              if (uniqueIPs.contains(AllLog[j].ip) == false) {
                uniqueIPs.add(AllLog[j].ip);
              }
              websiteId = AllLog[j].websiteID;
            }
          }
        }
      }

      if (uniqueIPs.length >= 5) {
        Alert alertNew = Alert(
          websiteId: websiteId ?? "unknown",
          threatType: ThreatType.DDOS,
          title: "DDoS Attack Detection",
          failAttempt: uniqueIPs.length,
          ristLevel: RiskLevel.Critical,
          user: email,
          detectAt: now,
          status: Status.New,
        );
        try {
          await alertRepo.createAlert(alertNew, alertId+1);
          alertId++;
        } catch (e) {
          
        }
      }
    }
  }

  Future<void> UnusualTimeRule() async {
    List<Alert> result = await alertRepo.getAllAlert();
    List<Log> AllLog = await Logrepo.getAllLog();
    int alertId = result.length + 1;

    DateTime now = DateTime.now();

    for (int i = 0; i < AllLog.length; i++) {
      if (AllLog[i].action == "login_success") {
        DateTime logTime = DateTime.parse(AllLog[i].time);
        int hour = logTime.hour;

        // Check if between 2 AM and 5 AM
        if (hour >= 2 && hour <= 5) {
          Alert alertNew = Alert(
            websiteId: AllLog[i].websiteID,
            threatType: ThreatType.UnusalLogin,
            title: "Unusual Time Login Detection",
            failAttempt: 0,
            ristLevel: RiskLevel.Meduim,
            user: AllLog[i].email,
            detectAt: now,
            status: Status.New,
          );

          try {
            await alertRepo.createAlert(alertNew, alertId+1);
            alertId++;
          } catch (e) {
            print(e);
          }
        }
      }
    }
  }

  Stream<void> streamDetection() async* {
    while (true) {
      await BruteForceRule();

      await CredentialStuffingRule();

      await DDoSRule();

      await UnusualTimeRule();

      yield null;

      await Future.delayed(Duration(minutes: 5));
    }
  }
}
