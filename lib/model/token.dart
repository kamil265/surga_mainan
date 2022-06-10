class TokenModel {
  String token;
  List<String> permissions;


  TokenModel(
    {
      this.token, 
      this.permissions
    }
  );

  TokenModel.fromJson(Map<String, dynamic> json) 
  {
    token: json["token"];
    permissions: List<String>.from(json["permissions"].map((x) => x));
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'permission' : permissions,
    };
  }
}