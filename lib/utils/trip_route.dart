import 'package:url_launcher/url_launcher.dart';

class LocationPoint {
  final double? latitude;
  final double? longitude;
  final String? address;

  LocationPoint({this.latitude, this.longitude, this.address})
      : assert(
          latitude != null && longitude != null || address != null,
        );

  String toQuery() {
    if (latitude != null && longitude != null) {
      return "$latitude,$longitude"; // safest and shortest
    } else {
      // Replace spaces with +, leave commas as is
      return address!.trim().replaceAll(RegExp(r"\s+"), "+");
    }
  }
}

Future<void> openRouteInGoogleMaps(List<LocationPoint> points) async {
  if (points.length < 2) {
    throw 'At least 2 points required (origin & destination)';
  }

  final origin = points.first.toQuery();
  print("origin .....$origin");
  final destination = points.last.toQuery();
  print("destination .....$destination");

// Waypoints in between
  final waypointList = points.sublist(1, points.length - 1);
  final waypoints = waypointList.map((p) => p.toQuery()).join('|');

  print("origin: $origin");
  print("destination: $destination");
  print("waypoints: $waypoints");
  print("waypoints length: ${waypoints.length}");

  final googleMapsUrl =
      "https://www.google.com/maps/dir/?api=1&origin=$origin&destination=$destination"
      "${waypoints.isNotEmpty ? "&waypoints=$waypoints" : ""}";

  final uri = Uri.parse(googleMapsUrl.toString());
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch Google Maps';
  }
}
