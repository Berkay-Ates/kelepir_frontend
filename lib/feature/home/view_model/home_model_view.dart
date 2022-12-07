import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kelepir/core/enums/shared/shared_enums.dart';
import 'package:mobx/mobx.dart';
import '../../../core/base_view/ibase_view.dart';
import '../../../core/enums/navigations_enum/navigation_enums.dart';
import '../../../core/enums/networkEnum/network_enum.dart';
import '../../../core/init/cache/ishared_manager.dart';
import '../../../core/init/cache/shared_manager.dart';
import '../../../core/init/cache/singleton_shared_pref/singleton_shared_pref.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../core/init/network/connectivity/interface/inetwork_connectivity.dart';
import '../../../core/init/network/connectivity/network_connectivity.dart';

part 'home_model_view.g.dart';

// ignore: library_private_types_in_public_api
class HomeModelView = _HomeModelView with _$HomeModelView;

abstract class _HomeModelView with Store, IBaseView {
  late INetworkConnectivity networkConnectivity;
  ISharedPreferences? sharedManager;
  SingletonSharedPref? sharedPref;

  @observable
  NetworkConnectivityEnums? connectivityEnums;

  @observable
  bool isMapScreen = true;

  @observable
  bool isLoading = true;

  @observable
  int selectedIndx = 0;

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
    await sharedPref?.initShared();
    //*singleton icerisindeki shared preferences objesi artık null degil auth kısmında atanmıs vaziyette
    sharedManager = SharedPreferencesManager(sharedPref?.getSharedObject);
  }

  @action
  Future checkFirstTimeConnectivity() async {
    connectivityEnums = await networkConnectivity.checkNetworkConnectivity();
  }

  @action
  Future<bool> deleteToken() async {
    isLoading = true;
    final result = await sharedManager?.delete(SharedKeyEnums.userTokenKey) ?? false;
    inspect(result);
    if (result) {
      NavigationService.instance.router.go(NavigationEnums.auth.routeName);
    } else {
      isLoading = false;
    }
    return result;
  }

  @action
  void setTabIndx(int index, TabController tabController) {
    tabController.animateTo(index, duration: const Duration(seconds: 0));
    selectedIndx = index;
    selectedIndx == 0 ? isMapScreen = true : isMapScreen = false;
  }
}
