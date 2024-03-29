import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../enums/networkEnum/network_enum.dart';
import 'error/connectivity_error.dart';
import 'interface/inetwork_connectivity.dart';

class NetworkConnectivity extends INetworkConnectivity {
  late final Connectivity _networkConnectivity;
  StreamSubscription<ConnectivityResult>? _subscription;

  void checkConnectivityObject() {
    if (_networkConnectivity == null) {
      ConnectivityError<NetworkConnectivity>(errorMessage: 'connectivity class does not works properly $this')
          .toString();
    }
  }

  NetworkConnectivity() {
    _networkConnectivity = Connectivity();
  }

  @override
  Future<NetworkConnectivityEnums?> checkNetworkConnectivity() async {
    checkConnectivityObject();
    final connectivity = await _networkConnectivity.checkConnectivity();
    NetworkConnectivityEnums? connectivityEnum = NetworkConnectivityEnums.checkConnectivity(connectivity);
    return connectivityEnum;
  }

  @override
  void streamNetworkConnectivity(NetworkConnectivityStreamCallback onChange) {
    checkConnectivityObject();
    _subscription = _networkConnectivity.onConnectivityChanged.listen((event) {
      onChange.call(NetworkConnectivityEnums.checkConnectivity(event));
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
  }
}
