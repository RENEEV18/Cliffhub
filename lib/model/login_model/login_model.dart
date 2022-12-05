class LoginModel {
  final String name;
  final String password;

  LoginModel({required this.name, required this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      name: json["name"]??'name',
      password: json["password"]??'password',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "password": password,
    };
  }
}
