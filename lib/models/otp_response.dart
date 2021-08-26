
class OtpResponse {
  int otp;
  bool success;

  OtpResponse({this.otp, this.success});

  OtpResponse.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    data['success'] = this.success;
    return data;
  }
}