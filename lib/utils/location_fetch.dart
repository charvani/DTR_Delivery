import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../features/trip/data/models/current_trip_response_model.dart';


class LocationFetch {
  Address myAddress = Address(
     
      address1: "",
      address2: "",
      city: "",
      state: "",
      postalCode: "",
      );
  Future<Address> getAddressFromLatLng(Position position) async {
    String currentAddress = "";
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      Placemark place = placemarks.first;
      currentAddress =
          "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}, ${place.name},N, ${place.subLocality} ,S,${place.thoroughfare}F ${place.subAdministrativeArea} ";
//street - door no  - add1
//locality - district -  city
// adminstrative area -- state
//postal - postal
//subLocality - maddilpalem  - add2
      print(
          "my current address >>> $currentAddress ${position.latitude.toString()}  ${position.longitude.toString()}");

      return myAddress = Address(
          
          address1: place.street ?? "",
          address2: place.subLocality ?? "",
          city: place.locality ?? place.name ?? "",
          state: place.administrativeArea ?? "",
          postalCode: place.postalCode ?? "",
          
          );
    } catch (e) {
      print(e);
    }

    return myAddress;
  }

  Future<Address?> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null; // Return null if permission is denied
      }
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      print("pos lat ....${position.latitude}");
      print("pos long ....${position.longitude}");
      Address address = await getAddressFromLatLng(position);
      return address;
    } catch (e) {
      print("Error fetching location: $e");
      return null;
    }
  }

  Future<List> getCoordinatesFromAddress(String address) async {
    print("final address...$address");
    late double latitude;
    late double longitude;
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        latitude = locations.first.latitude;
        longitude = locations.first.longitude;
        print('Latitude: $latitude, Longitude: $longitude');
      } else {
        print('No location found for this address.');
      }
    } catch (e) {
      print('Error getCoordinatesFromAddress : $e');
    }
    return [latitude, longitude];
  }
}
