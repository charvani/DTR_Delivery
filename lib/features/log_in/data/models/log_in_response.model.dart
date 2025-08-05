class LoginResponseModel {
  String? accessToken;
  String? firstName;
  String? lastName;
  String? contactNumber;

  LoginResponseModel(
      {this.accessToken, this.firstName, this.lastName, this.contactNumber});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    contactNumber = json['contactNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['contactNumber'] = this.contactNumber;
    return data;
  }
}
