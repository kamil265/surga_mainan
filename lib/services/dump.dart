// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class TokenServices {
//   final String _url = 'https://surga-mainan-api.herokuapp.com';
//   var token;

//   _getToken() async{
//     SharedPreferences localStorage = await SharedPreferences.getInstance();
//     token = jsonDecode(localStorage.getString('token'))['token'];
//   }

//   auth(data, apiURL) async{
//     var fullUrl = _url + apiURL;
//     return await http.post(
//       Uri.parse(fullUrl),
//       body: jsonEncode(data),
//     );
//   }

//   getData(apiURL) async{
//     var fullUrl = _url + apiURL;
//     await _getToken();
//     return await http.get(
//       Uri.parse(fullUrl),
//       headers: _setHeaders(),
//     );
//   }

//   _setHeaders() => {
//     'Content-type': 'application/json',
//     'Accept': 'application/json',
//     'Authorization': 'Bearer $token',
//   };
// }
// import 'dart:convert';
// import 'package:surga_mainan/model/login_service_model.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:surga_mainan/model/user_model.dart';

// class TokenServices {
//   String baseUrl = 'https://surga-mainan-api.herokuapp.com';

//   Future<LoginServiceModel> login({
//     String email,
//     String password,
//   }) async {
//     var url = '$baseUrl/token';
//     var headers = {'Content-Type': 'application/json'};
//     var body = jsonEncode({
//       'email': email,
//       'password': password,
//     });

//      var response = await http.post(
//       Uri.parse(url),
//       headers: headers,
//       body: body,
//     );
//      print(response.body);

//     if (response.statusCode == 200) {
//       var data = jsonDecode(response.body)['data'];
//       LoginServiceModel userToken = LoginServiceModel.fromJson(data['token']);
//       userToken.data.token = 'Bearer ' + data['token'];

//       return userToken;
//     } else {
//       throw Exception('Gagal Login');
//     }
//   }

//   Future getData(String token) async {
//     String url = '$baseUrl/me';

//     try {
//       var response = await http.get(Uri.parse(url),headers: {
//         'Authorization': 'Bearer $token',
//         'Accept': 'applcation/json'
//       });

//       var body = json.decode(response.body);
//       return UserModel.fromJson(body);
//     } catch (e) {
//       return e;
//     }
//   }

//   Future hasToken() async {
//     Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//     final SharedPreferences local = await _prefs;
//     final String token = local.getString("token") ?? null;
//     if (token != null) return token;
//     return null;
//   }

//   Future setLocalToken(String token) async {
//     Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//     final SharedPreferences local = await _prefs;
//     local.setString("token", token);
//   }

//   Future unsetLocalToken() async {
//     Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//     final SharedPreferences local = await _prefs;
//     local.setString("token", null);
//   }
// }