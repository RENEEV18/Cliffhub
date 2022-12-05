class SignupModel {
  final String firstName;
  final String lastName;
  final String userName;
  final String emailId;
  final String mobile;
  final String password;

  SignupModel(
      {required this.firstName,
      required this.lastName,
      required this.userName,
      required this.emailId,
      required this.mobile,
      required this.password});

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
        firstName: json["firstName"] ?? '',
        lastName: json["lastName"] ?? '',
        userName: json["userName"] ?? '',
        emailId: json["emailId"] ?? '',
        mobile: json["mobile"] ?? '',
        password: json["password"] ?? '');
  }
  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "userName": userName,
      "emailId": emailId,
      "mobile": mobile,
      "password": password,
    };
  }
}
