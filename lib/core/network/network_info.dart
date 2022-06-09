import 'package:connectivity_plus/connectivity_plus.dart';

abstract class ANetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfo implements ANetworkInfo {
  final Connectivity connecitonChecker;

  NetworkInfo(this.connecitonChecker);

  @override
  Future<bool> get isConnected async =>
      !((await connecitonChecker.checkConnectivity()) ==
          ConnectivityResult.none);
}
