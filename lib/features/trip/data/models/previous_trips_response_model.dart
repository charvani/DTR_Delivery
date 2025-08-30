class PreviousTripsResponseModel {
  int? total;
  List<Trips>? trips;

  PreviousTripsResponseModel({this.total, this.trips});

  PreviousTripsResponseModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['trips'] != null) {
      trips = <Trips>[];
      json['trips'].forEach((v) {
        trips!.add(new Trips.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.trips != null) {
      data['trips'] = this.trips!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Trips {
  String? tripId;
  int? totalOrders;
  int? totalOrdersDelivered;
  String? vehicleName;

  Trips(
      {this.tripId,
      this.totalOrders,
      this.totalOrdersDelivered,
      this.vehicleName});

  Trips.fromJson(Map<String, dynamic> json) {
    tripId = json['tripId'];
    totalOrders = json['totalOrders'];
    totalOrdersDelivered = json['totalOrdersDelivered'];
    vehicleName = json['vehicleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tripId'] = this.tripId;
    data['totalOrders'] = this.totalOrders;
    data['totalOrdersDelivered'] = this.totalOrdersDelivered;
    data['vehicleName'] = this.vehicleName;
    return data;
  }
}
