class LoginRequestModel {
  String? contactNumber;
  String? password;

  LoginRequestModel({this.contactNumber, this.password});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    contactNumber = json['contactNumber'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contactNumber'] = this.contactNumber;
    data['password'] = this.password;
    return data;
  }
}
