import 'dart:convert';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:sleeptracker_app/api/Token.dart';
import 'package:sleeptracker_app/models/JobMaster.dart';

loadPref(id, name, initials, email) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("id", id);
  prefs.setString("name", name);
  prefs.setString("initials", initials);
  prefs.setString("email", email);
}

class ApiServices {
  final baseurl = 'http://192.168.18.197/sleeptracker';
  // final baseurl = 'http://10.220.1.72/sleeptracker';

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
      return true;
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

//Create Use Material Return
  Future createUseMaterialReturn(String materialToSiteId, String returnDate,
      String notes, List<Map<dynamic, dynamic>> materialList) async {
    var urlPost = '$baseurl/used-material-returns/create';
    var token = await TokenAccess.getToken();
    DateTime tanggalObj = DateFormat("dd/MM/yyyy").parse(returnDate);
    var convertDate = DateFormat("yyyy-MM-dd").format(tanggalObj);

    List<Map<String, dynamic>> payLoadDetailsList = [];
    for (int i = 0; i < materialList.length; i++) {
      Map<String, dynamic> payLoadDetails = {
        "material_id": materialList[i]["material_id"] ?? '',
        "qty": int.tryParse(materialList[i]["qty"] ?? '0') ?? 0,
      };
      payLoadDetailsList.add(payLoadDetails);
    }
    Map<dynamic, dynamic> payload = {
      "data": {
        "material_to_site_id": materialToSiteId,
        "return_date": convertDate,
        "notes": notes,
        "details": payLoadDetailsList
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

  //Get TT Number
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
}
