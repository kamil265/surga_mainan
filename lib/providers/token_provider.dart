import 'package:flutter/material.dart';
import 'package:surga_mainan/model/token.dart';
import 'package:surga_mainan/services/token_services.dart';

class TokenProvider with ChangeNotifier {
  TokenModel _token = TokenModel();
  
  TokenModel get token { 
    return _token; 
  } 
  set token(TokenModel token) { 
    this.token = token; 
    notifyListeners();
  } 
  
  Future<bool> login({
    String email,
    String password,
  }) async {
    try {
      TokenModel token = await TokenService().login(
        email: email,
        password: password,
      );

      _token = token;
      return true;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return false;
    }
  }
}