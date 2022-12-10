import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kelepir/core/ImageUpload/image_upload_manager.dart';
import 'package:kelepir/core/enums/shared/shared_enums.dart';
import 'package:kelepir/core/token/token_management.dart';
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
import '../../List_view/model/list_model.dart';

part 'home_model_view.g.dart';

class HomeModelView = _HomeModelView with _$HomeModelView;

abstract class _HomeModelView with Store, IBaseView {
  late INetworkConnectivity networkConnectivity;
  ISharedPreferences? sharedManager;
  SingletonSharedPref? sharedPref;

  @observable
  NetworkConnectivityEnums? connectivityEnums;

  @observable
  ImageUploadManager imageUploadManager = ImageUploadManager();

  @observable
  XFile? image;

  @observable
  List<ProductResults?> productPosts = [];

  @observable
  List images = [];

  @observable
  bool isMapScreen = true;

  @observable
  bool isLoading = false;

  @observable
  int selectedIndx = 0;

  @override
  void setContext(context) => buildContext = context;

  @override
  void init() {
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
      NavigationService.instance.router.go(NavigationEnums.register.routeName);
    } else {
      isLoading = false;
    }
    return result;
  }

  @action
  Future<void> getProducts() async {
    productPosts = [];
    isLoading = true;
    final String token = "Bearer ${TokenManagement.instance.getToken}";
    try {
      final response = await projectDio?.get('/getAll', options: Options(headers: {"Authorization": token}));
      inspect(response?.data);
      if (response?.data is List) {
        for (var element in response?.data) {
          final product = ProductResults.fromJson(element);
          productPosts.add(product);
          // final imageResponse = await getImage(product.imageId);
          // inspect(imageResponse);
          // images.add(imageResponse);
        }
      }
    } catch (e) {
      inspect('error accoured');
      inspect(e);
    }
    isLoading = false;
  }

  @action
  Future<dynamic?> getImage(String? imageId) async {
    final String token = "Bearer ${TokenManagement.instance.token}";
    final response =
        await projectDio?.get('/getImage/?imageId=$imageId', options: Options(headers: {"Authorization": token}));
    inspect(response);
    return response?.data;
  }

  @action
  Future<String?> uploadImage(String? file) async {
    isLoading = true;
    if (file == null) return null;
    var formData = FormData.fromMap({'file': await MultipartFile.fromFile(file)});
    final String token = "Bearer ${TokenManagement.instance.token}";
    final response =
        await projectDio?.post('/uploadFile', data: formData, options: Options(headers: {"Authorization": token}));

    if (response?.data['image_name'] != null) {
      TokenManagement.instance.setImageToken(response?.data['image_name']);
      TokenManagement.instance.setImagePath(file);
      inspect(response?.data['image_name']);
    }
    isLoading = false;
    return null;
  }

  @action
  void setTabIndx(int index, TabController tabController) {
    tabController.animateTo(index, duration: const Duration(seconds: 0));
    selectedIndx = index;
    selectedIndx == 0 ? isMapScreen = true : isMapScreen = false;
  }
}
