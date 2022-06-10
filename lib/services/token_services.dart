import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:surga_mainan/model/token.dart';


class TokenService {
  String baseUrl = 'http://surga-mainan-api.herokuapp.com';

  Future<TokenModel> login({
    String email,
    String password,
  }) async {

    var url = Uri.parse('$baseUrl/token');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    // ignore: avoid_print
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      TokenModel userToken ;
      userToken.token = 'Bearer ' + data['token'] ;

      return userToken;

    } else {
      throw Exception('Gagal Login');
    }
    
  }
}