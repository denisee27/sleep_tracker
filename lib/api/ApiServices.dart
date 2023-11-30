import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:sleeptracker_app/api/Token.dart';

loadPref(name, initials, role, job_position, email, Warehouse) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("name", name);
  prefs.setString("initials", initials);
  prefs.setString("role", role);
  prefs.setString("job_position", job_position);
  prefs.setString("email", email);
  prefs.setStringList("responsible_warehouse", Warehouse);
}

class ApiServices {
  // final baseurl = 'https://api-ims.karyaoptima.com/mobile';
  final baseurl = 'https://ims.triasmitra.com/api/mobile';

  //Login User
  Future loginUser(String email, String password) async {
    var urlLogin = '$baseurl/auth/login';
    final response = await http.post(Uri.parse(urlLogin), body: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      var token = json.decode(response.body)['result']['access_token'];
      var name = json.decode(response.body)['result']['user']['name'];
      var email = json.decode(response.body)['result']['user']['email'];
      var initials = json.decode(response.body)['result']['user']['initials'];
      var role = json.decode(response.body)['result']['user']['role'];
      var job_position =
          json.decode(response.body)['result']['user']['job_position'];
      var warehouse =
          json.decode(response.body)['result']['user']['responsible_warehouse'];
      List<String> responsibleWarehouse = List<String>.from(warehouse);

      loadPref(name, initials, role, job_position, email, responsibleWarehouse);
      await TokenAccess.storeToken(token);
      return true;
    } else if (response.statusCode != 200) {
      return false;
    } else {
      throw Exception('Failed to login');
    }
  }

//Update Material Tp
  Future revisiMaterialToSite(
      String id,
      String fromType,
      String fromWarehouse,
      String projectId,
      String requestDate,
      String jointer,
      String ticketNumber,
      String segmentName,
      String sectionName,
      String notes,
      List<Map<dynamic, dynamic>> materialList) async {
    var urlPost = '$baseurl/material-to-site/update';
    var token = await TokenAccess.getToken();
    DateTime tanggalObj = DateFormat("dd/MM/yyyy").parse(requestDate);
    var convertDate = DateFormat("yyyy-MM-dd").format(tanggalObj);

    List<Map<String, dynamic>> payLoadDetailsList = [];
    for (int i = 0; i < materialList.length; i++) {
      List<Map<String, dynamic>> payloadStockList = [];
      if (materialList[i]["oldData"] == true) {
        for (int q = 0; q < materialList[i]["stocks"].length; q++) {
          Map<String, dynamic> payloadStock = {
            "material_stock_detail_id": materialList[i]["stocks"][q]
                ["materialStockDetailId"],
            "qty": materialList[i]["stocks"][q]["qty"] ?? 0,
          };
          payloadStockList.add(payloadStock);
        }
        Map<String, dynamic> payLoadDetails = {
          "material_id": materialList[i]["material_id"] ?? '',
          "qty": materialList[i]["qty"],
          "stocks": payloadStockList
        };
        payLoadDetailsList.add(payLoadDetails);
      } else {
        for (int q = 0; q < materialList[i]["stocks"].length; q++) {
          Map<String, dynamic> payloadStock = {
            "material_stock_detail_id": materialList[i]["stocks"][q].id,
            "qty": materialList[i]["stocks"][q].qty ?? 0,
          };
          payloadStockList.add(payloadStock);
        }
        Map<String, dynamic> payLoadDetails = {
          "material_id": materialList[i]["material_id"] ?? '',
          "qty": int.tryParse(materialList[i]["qty"] ?? '0') ?? 0,
          "stocks": payloadStockList
        };
        payLoadDetailsList.add(payLoadDetails);
      }
    }
    Map<dynamic, dynamic> payload = {
      "data": {
        "id": id,
        "material_to_site": id,
        "from_type": fromType,
        "from_warehouse": fromWarehouse,
        "project_id": projectId,
        "request_date": convertDate,
        "jointer": jointer,
        "ticket_number": ticketNumber,
        "segment_name": segmentName,
        "customer_name": null,
        "section_name": sectionName,
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
}
