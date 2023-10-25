import 'package:bloc_tinder_app/interfaces/i_internet_connection_checker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnectionChecker implements IInternetConnectionChecker{
  @override
  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}
