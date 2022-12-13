import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../http_constants/http_constants.dart';
import '../models/userprofile_model.dart';
import '../screens/home_page/home_page.dart';

class AuthService with ChangeNotifier {
  String _authToken = "";
  AuthService._internal();
  factory AuthService() {
    return _instance;
  }

  static final AuthService _instance = AuthService._internal();
  Map<String, String> _getRequestHeaders() {
    return {"Accepet": "application/json", "Authorization": 'Bear $_authToken'};
  }

  // http get request,
  //ignore: unused_element
  Future<http.Response> _get(
    String endPoint,
    Map<String, String> header,
  ) {
    String url = APIConstants.API_BASE_URL + endPoint;
    // print get url
    Uri uri = Uri.parse(url);
    return http.get(uri, headers: header);
  }

  // http post request
  Future<http.Response> _post(
      String endPoint, Map<String, String> header, Map<String, dynamic> body) {
    String url = APIConstants.API_BASE_URL + endPoint;
    Uri uri = Uri.parse(url);
    return http.post(uri);
  }

  // Convert to json
  Map<String, dynamic> _convertJsonToMap(String response) {
    return json.decode(response);
  }

  //  getter for token
  Future<String?> getToken() async {
    return _authToken;
  }

  // Post login Api
  Future Login(email, password, BuildContext context) async {
    http.Response response = await _post(
        "/login?email=$email&password=$password", _getRequestHeaders(), {});
    if (response.statusCode == 200) {
      var jsonList = json.decode(response.body);
      print(jsonList);
      _authToken = jsonList['data']['token'];
      _authToken = (await getToken()).toString();
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const MyHomePage(),
      ));
    } else {
      throw Exception("Faild to Post");
    }
  }

  Future Signup(name, email, password, confrimPassword, phone,
      BuildContext context) async {
    http.Response response = await _post(
        "/register?name=$name&email=$email&password=$password&confrimPassword=$confrimPassword",
        _getRequestHeaders(), {});
    // responsw code
    if (response.statusCode == 200) {
      var jsonList = json.decode(response.body);
      print(jsonList);
    } else {
      throw Exception('Usert Already Register');
    }
  }

  // get request api
  Future Logout(BuildContext context) async {
    http.Response response = await _get("/lagout", _getRequestHeaders());
    if (response.statusCode == 200) {
      var jsonList = json.decode(response.body);
      print(jsonList);
    } else {
      throw Exception('Failed to Logout');
    }
  }

  Future<UserProfileModel> getProfile() async {
    http.Response response = await _get("/profile", _getRequestHeaders());
    // response code
    if (response.statusCode == 200) {
      var jsonList = json.decode(response.body);
      print(jsonList);
      return UserProfileModel.fromJson(jsonList);
    } else {
      throw Exception("Failed to logout");
    }
  }

  // post profile updated
  Future profileUpdated(
    name,
    phone,
    image,
  ) async {
    http.Response response = await _post(
        "/profileUpdate?name=$name&phone=$phone&image=$image",
        _getRequestHeaders(), {});
    // response code
    if (response.statusCode == 200) {
      var jsonList = json.decode(response.body);
      print(jsonList);
    } else {
      throw Exception('faild to updated');
    }
  }
}
class AuthException implements Exception {
  static const cancelled = AuthException('No account');

  const AuthException(this.message);

  final String message;

  @override
  String toString() => message;
}
