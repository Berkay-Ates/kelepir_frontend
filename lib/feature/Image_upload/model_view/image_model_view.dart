import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kelepir/core/enums/navigations_enum/navigation_enums.dart';
import 'package:kelepir/core/token/token_management.dart';
import 'package:kelepir/feature/Image_upload/model/image_model.dart';
import 'package:mobx/mobx.dart';
import '../../../core/base_view/ibase_view.dart';
import '../../../core/enums/networkEnum/network_enum.dart';
import '../../../core/init/cache/ishared_manager.dart';
import '../../../core/init/cache/shared_manager.dart';
import '../../../core/init/cache/singleton_shared_pref/singleton_shared_pref.dart';
import '../../../core/init/network/connectivity/interface/inetwork_connectivity.dart';
import '../../../core/init/network/connectivity/network_connectivity.dart';

part 'image_model_view.g.dart';

// ignore: library_private_types_in_public_api
class ImageModelView = _ImageModelView with _$ImageModelView;

abstract class _ImageModelView with Store, IBaseView {
  late INetworkConnectivity networkConnectivity;
  ISharedPreferences? sharedManager;
  SingletonSharedPref? sharedPref;

  @observable
  NetworkConnectivityEnums? connectivityEnums;

  @observable
  TextEditingController explonationController = TextEditingController();

  @observable
  TextEditingController productController = TextEditingController();

  @observable
  TextEditingController brandController = TextEditingController();

  @observable
  TextEditingController priceController = TextEditingController();

  @observable
  TextEditingController storeNameController = TextEditingController();

  @observable
  bool isMapScreen = true;

  @observable
  bool isLoading = false;

  @override
  void setContext(context) => buildContext = context;

  @override
  void init() {
    sharedPref = SingletonSharedPref.instance;
    networkConnectivity = NetworkConnectivity();
    checkFirstTimeConnectivity();
    initAndSetShared();
  }

  @action
  String? validateFields(String? data) {
    return (data?.isNotEmpty ?? false) ? null : 'this field could not be empty';
  }

  Future<void> initAndSetShared() async {
    await sharedPref?.initShared();
    //*singleton icerisindeki shared preferences objesi artık null degil auth kısmında atanmıs vaziyette
    sharedManager = SharedPreferencesManager(sharedPref?.getSharedObject);
  }

  @action
  Future<void> postProduct() async {
    isLoading = true;
    final location = await getUserCurrentLocation();

    final imageModel = ImagePostModel(
      data: explonationController.text,
      product: productController.text,
      brand: brandController.text,
      price: priceController.text,
      store_name: brandController.text,
      imageId: TokenManagement.instance.getImageToken,
      latitude: location?.latitude ?? 41.0272078,
      longtitute: location?.longitude ?? 28.8895722,
    );
    inspect(imageModel.toJson());
    inspect(TokenManagement.instance.getImageToken);
    final String token = "Bearer ${TokenManagement.instance.token}";
    try {
      final response = await projectDio?.post('/newPost',
          data: imageModel.toJson(), options: Options(headers: {"Authorization": token}));
      navigationService.router.go(NavigationEnums.home.routeName);
    } catch (e) {
      inspect(e);
      isLoading = false;
    }

    isLoading = false;
  }

  @action
  Future checkFirstTimeConnectivity() async {
    connectivityEnums = await networkConnectivity.checkNetworkConnectivity();
  }

  Future<Position?> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value) async {
      if (value.name != LocationPermission.denied) {
        Position location = await GeolocatorPlatform.instance.getCurrentPosition();
        return location;
      }
    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      inspect("ERROR$error");
      return null;
    });
    return await Geolocator.getCurrentPosition();
  }
}
