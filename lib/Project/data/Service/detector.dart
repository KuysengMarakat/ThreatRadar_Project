import 'package:my_app/Project/data/fakeData/fakeData.dart';
import 'package:my_app/Project/data/repo/Resposity_Alert.dart';
import 'package:my_app/Project/model/alert.dart';

void main() {
  BruteForceRule();
}

Future<void> BruteForceRule() async {
  ResposityAlert alertRepo = ResposityAlert.global;
  
  // Get All alert from firebase
  List<Alert> result = await alertRepo.getAllAlert();
  print(result);
  // List<String> alert = [];
  
  // To create ID for alert
  int alertId = result.length + 1;
  print(alertId);
  
  // get all email that log in fail
  List<String> allemailFail = [];

  DateTime now = DateTime.now();
  DateTime fiveMinute = now.subtract(Duration(minutes: 5));

  print(fiveMinute);

  //loop to add the list that log in fail first .
  for (int i = 0; i < fakeLogs.length; i++) {
    if (fakeLogs[i].action == "login_failed") {
      if (allemailFail.contains(fakeLogs[i].email) == false) {
        allemailFail.add(fakeLogs[i].email!);
      }
    }
  }

  // loop into list email that login fail within 5 minite to count fail attempt
  for (int i = 0; i < allemailFail.length; i++) {
    int count = 0;
    String email = allemailFail[i];
    String? websiteId;
    String? attackId;

    for (int j = 0; j < fakeLogs.length; j++) {
      if (email == fakeLogs[j].email) {
        if (fakeLogs[j].action == "login_failed") {
          DateTime logTime = DateTime.parse(fakeLogs[j].time!);
          if (logTime.isAfter(fiveMinute)) {
            count++;
            websiteId = fakeLogs[j].websiteID;
            attackId = fakeLogs[j].ip;
          }
        }
      }
    }

    // if fail greater than 5 or equal 5 create new alert and put into the firebase
    if (count >= 5) {
      // alert.add(email);
      Alert alertNew = Alert(
        websiteId: websiteId,
        threatType: ThreatType.BruteForce,
        title: "Brute Force Detection",
        failAttempt: count,
        ristLevel: RiskLevel.High,
        user: email,
        detectAt: now,
        status: Status.New,
      );
      try {
        await alertRepo.createAlert(alertNew, alertId);
        alertId++;
        print("sss");
      } catch (e) {
        print("job");
      }
    } else {

    }
  }
}


