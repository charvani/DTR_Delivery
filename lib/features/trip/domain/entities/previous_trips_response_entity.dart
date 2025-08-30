import '../../data/models/previous_trips_response_model.dart';

class PreviousTripsResponseEntity {
  int? total;
  List<Trips>? trips;

  PreviousTripsResponseEntity({this.total, this.trips});
}
