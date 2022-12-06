class SendOtpModel {
  final String mobile;

  SendOtpModel({
    required this.mobile,
  });

  factory SendOtpModel.fromJson(Map<String, dynamic> json) {
    return SendOtpModel(
      mobile: json["number"] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "number": mobile,
    };
  }
}
