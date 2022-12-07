import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../core/base_view/ibase_view.dart';
import '../../../core/enums/navigations_enum/navigation_enums.dart';
import '../../../core/enums/networkEnum/network_enum.dart';
import '../../../core/enums/shared/shared_enums.dart';
import '../../../core/init/cache/ishared_manager.dart';
import '../../../core/init/cache/shared_manager.dart';
import '../../../core/init/cache/singleton_shared_pref/singleton_shared_pref.dart';
import '../../../core/init/network/connectivity/interface/inetwork_connectivity.dart';
import '../../../core/init/network/connectivity/network_connectivity.dart';
import '../../../core/token/token_management.dart';

part 'splash_view_model.g.dart';

// ignore: library_private_types_in_public_api
class SplashModelView = _SplashModelView with _$SplashModelView;

abstract class _SplashModelView with Store, IBaseView {
  //* user Tokeni kontrol edip eger token vars otomatik olarak hom sayfasına yonlendirecegiz
  late INetworkConnectivity networkConnectivity;
  ISharedPreferences? sharedManager;
  SingletonSharedPref? sharedPref;

  @observable
  NetworkConnectivityEnums? connectivityEnums;

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  TextEditingController nameController = TextEditingController();

  @observable
  TextEditingController passwordController = TextEditingController();

  @observable
  bool isLoading = true;

  @observable
  bool isTokenExists = false;

  @override
  void setContext(context) => buildContext = context;

  @override
  void init() {
    isLoading = true;
    sharedPref = SingletonSharedPref.instance;
    networkConnectivity = NetworkConnectivity();
    checkFirstTimeConnectivity();
    initAndSetShared();
  }

  Future<void> initAndSetShared() async {
    await sharedPref?.initShared(); //*singleton icerisindeki shared preferences objesi artık null degil
    sharedManager = SharedPreferencesManager(sharedPref?.getSharedObject);
    checkUserToken();
  }

  @action
  void checkUserToken() {
    String? token = sharedManager?.getString(SharedKeyEnums.userTokenKey);
    if (token != null) {
      TokenManagement.instance.setToken(token);
      isTokenExists = true;
      navigationService.router.go(NavigationEnums.home.routeName);
    } else {
      navigationService.router.go(NavigationEnums.auth.routeName);
    }
  }

  @action
  Future checkFirstTimeConnectivity() async {
    connectivityEnums = await networkConnectivity.checkNetworkConnectivity();
  }

  @action
  String? validateFields(String? data) {
    return (data?.isNotEmpty ?? false) ? null : 'this field could not be empty';
  }
}
