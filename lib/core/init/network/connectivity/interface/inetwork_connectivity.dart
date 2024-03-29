import '../../../../enums/networkEnum/network_enum.dart';

typedef NetworkConnectivityStreamCallback = void Function(NetworkConnectivityEnums? connectivityResult);

abstract class INetworkConnectivity {
  Future<NetworkConnectivityEnums?> checkNetworkConnectivity();
  void streamNetworkConnectivity(NetworkConnectivityStreamCallback onChange);
  void dispose();
}
