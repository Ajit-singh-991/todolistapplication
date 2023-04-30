import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiBaseUrl {
  static const String createvirtual =
      'https://virtual.tradekia.com/api/createVanVirtualAccount';
  static const String getAllAccounts =
      'https://virtual.tradekia.com/api/getAllVanAccountList';
  static const String getAccountsHistory =
      'https://virtual.tradekia.com/api/getVanAccountHistory/';

  Future<void> updateData({
    required String accountNum,
    required String adharNum,
    required String panNum,
    required String naaame,
  }) async {
    var url = Uri.parse(createvirtual);
    var response = await http.post(url, body: {
      "accountNo": accountNum,
      "aadharNo": adharNum,
      "panNo": panNum,
      "name": naaame
    });
    if (response.statusCode == 200) {
      // Data updated successfully
      log('Data updated successfully');
      log(response.body);
    } else {
      log("Unable to update data");
      log(response.body);
      // Error updating data
    }
  }

  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(getAllAccounts));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, parse the JSON data
      final dynamic jsonData = json.decode(response.body);
      if (jsonData['status'] == true && jsonData['data'] is List<dynamic>) {
        return jsonData['data'];
      } else {
        throw Exception('Failed to parse data');
      }
    } else {
      // If the server did not return a 200 OK response, throw an error.
      throw Exception('Failed to load data');
    }
  }

Future<Map<String, List<dynamic>>> fetchDataSuccess() async {
  final response = await http.get(Uri.parse(getAccountsHistory));
  if (response.statusCode == 200) {
    final dynamic jsonData = json.decode(response.body);
    if (jsonData['status'] == true && jsonData['data'] is Map<String, dynamic>) {
      Map<String, dynamic> data = jsonData['data'];
      List<dynamic> successList = data['successList'];
      List<dynamic> refundList = data['refundList'];
      return {"successList": successList, "refundList": refundList};
    } else {
      throw Exception('Failed to parse data');
    }
  } else {
    throw Exception('Failed to load data');
  }
}
}
