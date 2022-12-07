import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:kelepir/feature/auth/model/auth_request_model/auth_enroll.dart';
import 'package:mobx/mobx.dart';
import '../../../core/base_view/ibase_view.dart';
import '../../../core/enums/networkEnum/network_enum.dart';
import '../../../core/enums/shared/shared_enums.dart';
import '../../../core/init/cache/ishared_manager.dart';
import '../../../core/init/cache/shared_manager.dart';
import '../../../core/init/cache/singleton_shared_pref/singleton_shared_pref.dart';
import '../../../core/init/network/connectivity/interface/inetwork_connectivity.dart';
import '../../../core/init/network/connectivity/network_connectivity.dart';
import '../../../core/enums/navigations_enum/navigation_enums.dart';
import '../../../core/token/token_management.dart';
import '../model/auth_response_model/user_enrol_response.dart';

part 'auth_view_model.g.dart';

// ignore: library_private_types_in_public_api
class AuthModelView = _AuthModelView with _$AuthModelView;

abstract class _AuthModelView with Store, IBaseView {
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
    //inspect(sharedPref?.getSharedObject);
    sharedManager = SharedPreferencesManager(sharedPref?.getSharedObject);
    checkUserToken();
  }

  @action
  void checkUserToken() {
    String? token = sharedManager?.getString(SharedKeyEnums.userTokenKey);
    if (token != null && token.isNotEmpty) {
      TokenManagement.instance.setToken(token);
      isTokenExists = true;
      navigationService.router.go(NavigationEnums.home.routeName);
    } else {
      isLoading = false;
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

  @action
  Future<void> registerUser() async {
    isLoading = true;
    final UserEnroll user = UserEnroll(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    try {
      final result = await projectDio?.post('/api/v1/mobile-pentest/auth/register', data: user.toJson());
      if (result?.data is Map<String, dynamic>) {
        final UserEnrollResult enrolResult = UserEnrollResult.fromJson(result?.data);
        final userToken = enrolResult.token;
        if (userToken != null) {
          isTokenExists = await sharedManager?.saveString(SharedKeyEnums.userTokenKey, userToken) ?? false;
          TokenManagement.instance.setToken(userToken);
          navigationService.router.go(NavigationEnums.home.routeName);
        }
      }
    } on Exception catch (e) {
      inspect(e);
    }
    isLoading = false;
  }

  @action
  Future<void> signInUser() async {
    isLoading = true;
    final UserEnroll user = UserEnroll(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    try {
      //* yapılan post istegi proje genelindek iServiceRequests'lerinden tureyen bie sınıfta yapılması gerekirdi
      final result = await projectDio?.post('/api/v1/mobile-pentest/auth/login', data: user.toJson());
      if (result?.data is Map<String, dynamic>) {
        final UserEnrollResult enrolResult = UserEnrollResult.fromJson(result?.data);
        final userToken = enrolResult.token;
        if (userToken != null) {
          isTokenExists = await sharedManager?.saveString(SharedKeyEnums.userTokenKey, userToken) ?? false;
          TokenManagement.instance.setToken(userToken);
          navigationService.router.go(NavigationEnums.home.routeName);
        }
      }
    } on Exception catch (e) {
      inspect(e);
    }
    isLoading = false;
  }
}
