class LoginServiceModel {
  String message;
  TokenAuth data;

  LoginServiceModel(
    {
      this.message, 
      this.data
    }
  );

  LoginServiceModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = TokenAuth.fromJson(json['data']);
  }
}

class TokenAuth {
  String token;

  TokenAuth(
    {
      this.token
    }
  );

  TokenAuth.fromJson(Map<String, dynamic> data) {
    token = data['token'];
  }
}