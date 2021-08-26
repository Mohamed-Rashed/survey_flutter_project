class SignUpResponse {
  String phone;
  String name;
  String email;
  String gender;
  int credit;
  String isAdmin;

  SignUpResponse({this.phone, this.name, this.email, this.gender, this.credit});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    credit = json['credit'];
    isAdmin = json['is_admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['name'] = this.name;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['credit'] = this.credit;
    data['is_admin'] = this.isAdmin;
    return data;
  }
}