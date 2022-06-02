class UserModel {
  String name;
  String email;

  UserModel(
    {
      this.name, 
      this.email
    }
  );

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      name = json['data']['name'];
      email = json['data']['email'];
    } else {
      name = "";
      email = "";
    }
  }
}