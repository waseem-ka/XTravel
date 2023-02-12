import 'package:shared_preferences/shared_preferences.dart';
import 'package:bookingbus/api_url.dart';
import 'package:bookingbus/api/api_provider.dart';

class costomer {
  String UserName;
  String Password;
  String name;
  String fatherName;
  String motherName;
  String date;
  String address;
  String iss;
  int balance;

  costomer({
    required this.UserName,
    required this.Password,
    required this.name,
    required this.fatherName,
    required this.motherName,
    required this.date,
    required this.address,
    required this.iss,
    required this.balance,
  });

  void userProfile(costomer user) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    user = await APIProvider().get(APIUrl.myProfile);

    setState() {
      user.name;
      user.Password;
      user.fatherName;
      user.motherName;
      user.balance;
      user.address;
      user.date;
    }
  }
}

void getProfile(costomer profile) async {
  Map user = await APIProvider().get(APIUrl.myProfile);
  profile.name = user["name"];
  profile.fatherName = user["fathername"];
  profile.motherName = user["mothername"];
  profile.balance = user["trip_availabel"];
  profile.date = user["birthdate"];
  profile.address = user["address"];
  profile.iss = user["iss"];
  profile.UserName = user["username"];
}
