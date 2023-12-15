import 'dart:convert';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:sleeptracker_app/api/Token.dart';
import 'package:sleeptracker_app/models/DailySleep.dart';
import 'package:sleeptracker_app/models/JobMaster.dart';

loadPref(id, name, initials, email) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("id", id);
  prefs.setString("name", name);
  prefs.setString("initials", initials);
  prefs.setString("email", email);
}

class ApiServices {
  // final baseurl = 'http://192.168.18.197/sleeptracker';
  final baseurl = 'http://192.168.39.243/sleeptracker';
  // final baseurl = 'http://10.3.6.91/sleeptracker';

  //Login User
  Future loginUser(String email, String password) async {
    var urlLogin = '$baseurl/auth/login';
    final response = await http.post(Uri.parse(urlLogin), body: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      var token = json.decode(response.body)['result']['access_token'];
      var id = json.decode(response.body)['result']['user']['id'];
      var name = json.decode(response.body)['result']['user']['name'];
      var email = json.decode(response.body)['result']['user']['email'];
      var initials = json.decode(response.body)['result']['user']['initials'];
      loadPref(id, name, initials, email);
      await TokenAccess.storeToken(token);
      return json.decode(response.body);
    } else if (response.statusCode != 200) {
      return false;
    } else {
      throw Exception('Failed to login');
    }
  }

  //Register User
  Future registerUser(String email, String password) async {
    var url = '$baseurl/auth/register';
    final response = await http.post(Uri.parse(url), body: {
      "email": email,
      "password": password,
    });
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode != 200) {
      return false;
    } else {
      throw Exception('Failed to login');
    }
  }

//Update User Profile
  Future updateUser(String name, String job, String bod, String gender,
      int weight, int height) async {
    var urlPost = '$baseurl/users/update';
    var token = await TokenAccess.getToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime dateBod = DateFormat("dd/MM/yyyy").parse(bod);
    var convertBod = DateFormat("yyyy-MM-dd").format(dateBod);
    Map<dynamic, dynamic> payload = {
      "data": {
        "id": prefs.getString("id"),
        "name": name,
        "bod": convertBod,
        "job": job,
        "gender": gender,
        "weight": weight,
        "height": height,
      }
    };
    final response = await http.post(Uri.parse(urlPost),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          'Content-type': "application/json",
          'Accept': "application/json"
        },
        body: jsonEncode(payload));
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode != 200) {
      return false;
    } else {
      throw Exception('Failed to post data');
    }
  }

  //Create Sleep
  Future createSleep(
      DateTime sleep_start, DateTime sleep_end, int sleep_quality) async {
    var urlPost = '$baseurl/sleep/create';
    var token = await TokenAccess.getToken();

    var convertSleepStart = DateFormat("yyyy-MM-dd HH:mm").format(sleep_start);
    var convertSleepEnd = DateFormat("yyyy-MM-dd HH:mm").format(sleep_end);
    Map<dynamic, dynamic> payload = {
      "data": {
        "sleep_start": convertSleepStart,
        "sleep_end": convertSleepEnd,
        "sleep_quality": sleep_quality,
      }
    };
    final response = await http.post(Uri.parse(urlPost),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          'Content-type': "application/json",
          'Accept': "application/json"
        },
        body: jsonEncode(payload));
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode != 200) {
      return false;
    } else {
      throw Exception('Failed to post data');
    }
  }

  //Get Job Master
  Future<List<JobMaster>> getJobMaster() async {
    var token = await TokenAccess.getToken();
    var urlGet = '$baseurl/jobs';
    final response = await http.get(
      Uri.parse(urlGet),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    print(response);
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body)['result']['data'];
      return jsonResponse.map((data) => JobMaster.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  //Get Job Master
  Future<List<DailySleep>> getDailySleep() async {
    var token = await TokenAccess.getToken();
    var urlGet = '$baseurl/sleep/daily';
    final response = await http.get(
      Uri.parse(urlGet),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body)['result']['data'];
      return jsonResponse.map((data) => DailySleep.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
