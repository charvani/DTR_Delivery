class UnclaimedOrdersRequestModel {
  String? query;
  int? page;
  int? limit;

  UnclaimedOrdersRequestModel({this.query, this.page, this.limit});

  UnclaimedOrdersRequestModel.fromJson(Map<String, dynamic> json) {
    query = json['query'];
    page = json['page'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['query'] = this.query;
    data['page'] = this.page;
    data['limit'] = this.limit;
    return data;
  }
}
