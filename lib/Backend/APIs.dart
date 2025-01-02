import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Global_values.dart';
import '../config.dart';
import '../routes/index.dart';

Future<void> sign_up_method(var data) async {
  final random = Random();
  int randomNumber = 100 + random.nextInt(900);
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse('http://${Host}/register'));
  request.body = json.encode(data);
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  print(request.body);

  if (response.statusCode == 200 || response.statusCode == 201) {
    // print(await response.stream.bytesToString() + "Program");
    try {
      final String responseString = await response.stream.bytesToString();
      final Map<String, dynamic> dataMap = jsonDecode(responseString);
      // final Map<String, dynamic> users = dataMap['user'];
      print(dataMap['status']);
      if (dataMap['status'] != 1) {
        sign_up_success = false;
        Fluttertoast.showToast(
            msg: dataMap['message'],
            backgroundColor: Colors.red,
            textColor: Colors.white);
      } else {
        sign_up_success = true;
        Fluttertoast.showToast(
            msg: dataMap['message'],
            backgroundColor: Colors.green,
            textColor: Colors.white);
      }
    } catch (e) {
      print(e.toString());
    }
  } else {
    final String responseString = await response.stream.bytesToString();
    final Map<String, dynamic> dataMap = jsonDecode(responseString);
    error_msg = "";
    error_msg = dataMap['message'];
    Fluttertoast.showToast(
        msg: dataMap['message'],
        backgroundColor: Colors.red,
        textColor: Colors.white);
    print(dataMap['message']);
    sign_up_success = false;
    //print(await response.stream.bytesToString());
  }
}

Future<void> sign_in_method(email, pass) async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse('http://${Host}/login'));
  request.body = json.encode({"email": "${email}", "password": "${pass}"});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200 || response.statusCode == 201) {
    final String responseString = await response.stream.bytesToString();
    final Map<String, dynamic> dataMap = jsonDecode(responseString);
    List<dynamic> familyId = dataMap['familyId'];
    print(dataMap);
    SharedPreferences pr = await SharedPreferences.getInstance();
    print(dataMap['userId']);
    pr.setString("Token", dataMap['token']);
    pr.setString("userrole", dataMap['role']);
    pr.setString("userid", dataMap['userId']);
    pr.setString("familyid", familyId[0].toString());
    pr.setString("userna", dataMap['name']);
    pr.setString("emails", email);
    username_dispaly = dataMap['name'];
    userrole_dispaly = dataMap['role'];
    userfmailyid_dispaly = familyId[0];
    useremail_dispaly = email;
    sign_in_success = true;
  } else {
    sign_in_success = false;
    print(await response.stream.bytesToString());
  }
}

Future<List<String>?> checkEmailSuggestions(String emailPrefix) async {

  final url = 'http://${Host}/suggest-emails?emailPrefix=$emailPrefix';

  try {

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {

      final responseData = json.decode(response.body);

      if (responseData['status'] == 1) {

        return List<String>.from(responseData['suggestions']);

      } else {
        return null;
      }
    } else {
      print('Failed to load suggestions: ${response.statusCode}');
      return null;
    }
  } catch (error) {
    print('Error occurred: $error');
    return null;
  }
}

// Future<bool> Create_chid(Map<String,dynamic> data) async {
//   SharedPreferences pr  = await SharedPreferences.getInstance();
//   var token = pr.getString("Token");
//   print(token);
//   var headers = {
//     'Authorization': 'Bearer ${token}',
//     'Content-Type': 'application/json'
//   };
//   var request = http.Request('POST', Uri.parse('http://${Host}/create-child'));
//   request.body = json.encode(data);
//   print(json.encode(data));
//   request.headers.addAll(headers);
//
//   http.StreamedResponse response = await request.send();
//
//   if (response.statusCode == 200) {
//     final String responseString = await response.stream.bytesToString();
//     final Map<String, dynamic> dataMap = jsonDecode(responseString);
//     print(dataMap);
//     child_mesaage = null;
//     if (dataMap['status'] != 1)  {
//       child_mesaage = null;
//       child_mesaage = dataMap['message'];
//       return false;
//     }
//     else
//     {
//       child_mesaage = null;
//       child_mesaage = dataMap['message'];
//       return true;
//     }
//     print(dataMap);
//   }
//   else {
//     final String responseString = await response.stream.bytesToString();
//     final Map<String, dynamic> dataMap = jsonDecode(responseString);
//     child_mesaage = null;
//     child_mesaage = dataMap['message'];
//     return false;
//   }
//
// }

Future<bool> Create_chid(Map<String, dynamic> data) async {
  SharedPreferences pr = await SharedPreferences.getInstance();
  var token = pr.getString("Token");
  print(token);
  var headers = {
    'Authorization': 'Bearer ${token}',
    'Content-Type': 'application/json'
  };
  var request = http.Request('POST', Uri.parse('http://${Host}/create-child'));
  request.body = json.encode(data);
  print(json.encode(data));
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final String responseString = await response.stream.bytesToString();
    final Map<String, dynamic> dataMap = jsonDecode(responseString);
    print(dataMap);

    if (dataMap['status'] != 1) {
      Fluttertoast.showToast(
          msg: dataMap['message'],
          backgroundColor: Colors.red,
          textColor: Colors.white);
      return false;
    } else {
      Fluttertoast.showToast(
          msg: dataMap['message'],
          backgroundColor: Colors.green,
          textColor: Colors.white);
      return true;
    }
  } else {
    final String responseString = await response.stream.bytesToString();
    final Map<String, dynamic> dataMap = jsonDecode(responseString);
    Fluttertoast.showToast(
        msg: dataMap['message'],
        backgroundColor: Colors.red,
        textColor: Colors.white);

    return false;
  }
}

Future<bool> Create_task(Map<String, dynamic> data) async {
  SharedPreferences pr = await SharedPreferences.getInstance();
  var token = pr.getString("Token");
  print(token);
  var headers = {
    'Authorization': 'Bearer ${token}',
    'Content-Type': 'application/json'
  };
  var request = http.Request('POST', Uri.parse('http://${Host}/create-task'));
  print(jsonEncode(data));
  request.body = jsonEncode(data);
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200 || response.statusCode == 201) {
    final String responseString = await response.stream.bytesToString();
    final Map<String, dynamic> dataMap = jsonDecode(responseString);
    if (dataMap['status'] != 1) {
      return false;
    } else {
      return true;
    }
    print(dataMap);
  } else {
    return false;
  }
}

Future<bool> Create_guardian(Map<String, dynamic> data) async {
  SharedPreferences pr = await SharedPreferences.getInstance();
  var token = pr.getString("Token");
  print(token);
  var headers = {
    'Authorization': 'Bearer ${token}',
    'Content-Type': 'application/json'
  };
  var request =
      http.Request('POST', Uri.parse('http://${Host}/create-guardian'));
  request.body = json.encode(data);
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  // print(await response.stream.bytesToString());
  if (response.statusCode == 200) {
    final String responseString = await response.stream.bytesToString();
    final Map<String, dynamic> dataMap = jsonDecode(responseString);
    if (dataMap['status'] != 1) {
      return false;
    } else {
      return true;
    }
    print(dataMap);
  } else {
    print(await response.stream.bytesToString());
    return false;
  }
}

Future<bool> invite_guardian(Map<String, dynamic> data) async {
  SharedPreferences pr = await SharedPreferences.getInstance();
  var token = pr.getString("Token");
  print(token);
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request(
      'POST', Uri.parse('http://93.127.172.167:5001/invite-guardian'));
  request.body = json.encode(data);
  request.headers.addAll(headers);
  print(request.body);
  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final String responseString = await response.stream.bytesToString();
    final Map<String, dynamic> dataMap = jsonDecode(responseString);
    if (dataMap['status'] != 1) {
      return false;
    } else {
      return true;
    }
    print(dataMap);
  } else {
    print(await response.stream.bytesToString());
    return false;
  }
}

Future<bool> invite_co_parent(Map<String, dynamic> data) async {
  SharedPreferences pr = await SharedPreferences.getInstance();
  var token = pr.getString("Token");
  print(token);
  var headers = {'Content-Type': 'application/json'};
  var request =
      http.Request('POST', Uri.parse('http://${Host}/invite-second-parent'));
  request.body = json.encode(data);
  request.headers.addAll(headers);
  print(request.body);
  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final String responseString = await response.stream.bytesToString();
    final Map<String, dynamic> dataMap = jsonDecode(responseString);
    if (dataMap['status'] != 1) {
      return false;
    } else {
      return true;
    }
    print(dataMap);
  } else {
    print(await response.stream.bytesToString());
    return false;
  }
}

Future<void> Fetch_children() async {
  SharedPreferences pr = await SharedPreferences.getInstance();
  var token = pr.getString("Token");
  print(token);
  var headers = {'Authorization': 'Bearer ${token}'};
  var request =
      http.Request('GET', Uri.parse('http://93.127.172.167:5001/children'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  // print(await response.stream.bytesToString());
  if (response.statusCode == 200) {
    children = [];
    // Convert response stream to string
    String responseString = await response.stream.bytesToString();

    // Decode JSON and extract children
    final Map<String, dynamic> decodedJson = jsonDecode(responseString);
    print(decodedJson);
    children = decodedJson['children'];
    //children = jsonMap
    print(children);
  } else {
    print(response.reasonPhrase);
  }
}

Future<void> Fetch_famalies() async {
  SharedPreferences pr = await SharedPreferences.getInstance();
  var uid = pr.getString("userid");
  var headers = {'Content-Type': 'application/json'};
  var request =
      http.Request('GET', Uri.parse('http://${Host}/get-families/${uid}'));
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    Families = [];
    // Convert response stream to string
    String responseString = await response.stream.bytesToString();
    // Decode JSON and extract children
    final Map<String, dynamic> decodedJson = jsonDecode(responseString);
    Families = decodedJson['families'];
    //children = jsonMap
  } else {
    print(response.reasonPhrase);
  }
}

Future<void> Forgot_password(var mail, BuildContext context) async {
  try {
    // CircularProgressIndicator();
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('http://${Host}/forgot-password'));
    request.body = json.encode({"email": "${mail}"});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String responseString = await response.stream.bytesToString();
      final Map<String, dynamic> decodedJson = jsonDecode(responseString);
      if (decodedJson['status'] != 1) {
        Fluttertoast.showToast(
            msg: "${decodedJson['message']}",
            backgroundColor: Colors.red,
            textColor: Colors.white);
        print(decodedJson['message']);
      } else {
        Fluttertoast.showToast(
            msg: "${decodedJson['message']}",
            backgroundColor: Colors.green,
            textColor: Colors.white);
        print(decodedJson['message']);
        route.pushNamed(context, routeName.login);
      }
    } else {
      print(response.reasonPhrase.toString());
      Fluttertoast.showToast(
          msg: response.reasonPhrase.toString(),
          backgroundColor: Colors.red,
          textColor: Colors.white);
    }
  } catch (e) {
    print(e.toString());
  }
}

Future<Map<String, dynamic>?> changeChildPassword({
  required String parentId,
  required String childId,
  required String currentPassword,
  required String newPassword,
}) async {
  final url = 'http://${Host}/change-password';

  final body = json.encode({
    'parentId': parentId,
    'childId': childId,
    'currentPassword': currentPassword,
    'newPassword': newPassword,
  });

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);

      return responseData;
    } else {
      print('Failed to change password: ${response.statusCode}');
      return null;
    }
  } catch (error) {
    print('Error occurred: $error');
    return null;
  }
}

Future<void> checkForUpdate() async {
  // Create the request
  var request = http.Request('GET', Uri.parse('http://${Host}/check-update'));

  // Send the request and get the response
  http.StreamedResponse response = await request.send();

  // Check if the response status is 200 (success)
  if (response.statusCode == 200) {
    // Convert the response stream to a string
    String responseBody = await response.stream.bytesToString();
    latestVersion = "";
    downloadUrl = "";
    // Parse the JSON response
    Map<String, dynamic> jsonData = jsonDecode(responseBody);

    // Print the entire 'data' section to check the structure
    print(jsonData['data']);

    // Extract the 'data' field which is a map, not a list in this case
    Map<String, dynamic> data = jsonData['data'];

    // Extract the 'version' and 'url' from the 'data' map
    latestVersion = data['version']; // Extract version
    downloadUrl = data['url']; // Extract download URL

    // Print the extracted values
    print('Latest Version: $latestVersion');
    print('Download URL: $downloadUrl');
  } else {
    // If the response status is not 200, print the error message
    print(response.reasonPhrase);
  }
}

Future<void> delete_profile(var id) async {
  var headers = {'Content-Type': 'application/json'};
  var request =
      http.Request('DELETE', Uri.parse('http://${Host}/delete-account'));
  request.body = json.encode({"userId": "${id}"});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final String responseString = await response.stream.bytesToString();
    final Map<String, dynamic> dataMap = jsonDecode(responseString);
    Fluttertoast.showToast(
        msg: dataMap['message'],
        backgroundColor: Colors.green,
        textColor: Colors.white);
    print(await response.stream.bytesToString());
    profile_d = true;
  } else {
    profile_d = false;
    final String responseString = await response.stream.bytesToString();
    final Map<String, dynamic> dataMap = jsonDecode(responseString);
    Fluttertoast.showToast(
        msg: dataMap['message'],
        backgroundColor: Colors.red,
        textColor: Colors.white);
    print(response.reasonPhrase);
  }
}
