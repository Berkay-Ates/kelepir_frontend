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
import '../model/list_model.dart';

part 'list_model_view.g.dart';

// ignore: library_private_types_in_public_api
class ListModelView = _ListModelView with _$ListModelView;

abstract class _ListModelView with Store, IBaseView {
  //* user Tokeni kontrol edip eger token vars otomatik olarak hom sayfasına yonlendirecegiz
  late INetworkConnectivity networkConnectivity;
  ISharedPreferences? sharedManager;
  SingletonSharedPref? sharedPref;

  @observable
  ProductResults? productPosts;

  @observable
  NetworkConnectivityEnums? connectivityEnums;

  @observable
  bool isLoading = false;

  @observable
  bool isTokenExists = false;

  @override
  void setContext(context) => buildContext = context;

  @override
  void init() {
    sharedPref = SingletonSharedPref.instance;
    networkConnectivity = NetworkConnectivity();
    checkFirstTimeConnectivity();
    initAndSetShared();
    //getProducts();
  }

  Future<void> initAndSetShared() async {
    await sharedPref?.initShared(); //*singleton icerisindeki shared preferences objesi artık null degil
    //inspect(sharedPref?.getSharedObject);
    sharedManager = SharedPreferencesManager(sharedPref?.getSharedObject);
    checkUserToken();
    isLoading = false;
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
}
