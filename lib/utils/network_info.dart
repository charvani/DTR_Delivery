
// import 'package:connectivity_plus/connectivity_plus.dart';

// abstract class NetworkInfo {
//   Future<bool> get isConnected;
// }

// class NetworkInfoImpl implements NetworkInfo {
//   @override
//   // TODO: implement isConnected
//   Future<bool> get isConnected => isConnectedToInternet();

//   Future<bool> isConnectedToInternet () async {

//     var connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult.contains(ConnectivityResult.mobile)) {
//       return true;
//     } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
//       return true;
//     }
//     return false;
//   }

// }