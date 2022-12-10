// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model_view.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ImageModelView on _ImageModelView, Store {
  late final _$connectivityEnumsAtom =
      Atom(name: '_ImageModelView.connectivityEnums', context: context);

  @override
  NetworkConnectivityEnums? get connectivityEnums {
    _$connectivityEnumsAtom.reportRead();
    return super.connectivityEnums;
  }

  @override
  set connectivityEnums(NetworkConnectivityEnums? value) {
    _$connectivityEnumsAtom.reportWrite(value, super.connectivityEnums, () {
      super.connectivityEnums = value;
    });
  }

  late final _$explonationControllerAtom =
      Atom(name: '_ImageModelView.explonationController', context: context);

  @override
  TextEditingController get explonationController {
    _$explonationControllerAtom.reportRead();
    return super.explonationController;
  }

  @override
  set explonationController(TextEditingController value) {
    _$explonationControllerAtom.reportWrite(value, super.explonationController,
        () {
      super.explonationController = value;
    });
  }

  late final _$productControllerAtom =
      Atom(name: '_ImageModelView.productController', context: context);

  @override
  TextEditingController get productController {
    _$productControllerAtom.reportRead();
    return super.productController;
  }

  @override
  set productController(TextEditingController value) {
    _$productControllerAtom.reportWrite(value, super.productController, () {
      super.productController = value;
    });
  }

  late final _$brandControllerAtom =
      Atom(name: '_ImageModelView.brandController', context: context);

  @override
  TextEditingController get brandController {
    _$brandControllerAtom.reportRead();
    return super.brandController;
  }

  @override
  set brandController(TextEditingController value) {
    _$brandControllerAtom.reportWrite(value, super.brandController, () {
      super.brandController = value;
    });
  }

  late final _$priceControllerAtom =
      Atom(name: '_ImageModelView.priceController', context: context);

  @override
  TextEditingController get priceController {
    _$priceControllerAtom.reportRead();
    return super.priceController;
  }

  @override
  set priceController(TextEditingController value) {
    _$priceControllerAtom.reportWrite(value, super.priceController, () {
      super.priceController = value;
    });
  }

  late final _$storeNameControllerAtom =
      Atom(name: '_ImageModelView.storeNameController', context: context);

  @override
  TextEditingController get storeNameController {
    _$storeNameControllerAtom.reportRead();
    return super.storeNameController;
  }

  @override
  set storeNameController(TextEditingController value) {
    _$storeNameControllerAtom.reportWrite(value, super.storeNameController, () {
      super.storeNameController = value;
    });
  }

  late final _$isMapScreenAtom =
      Atom(name: '_ImageModelView.isMapScreen', context: context);

  @override
  bool get isMapScreen {
    _$isMapScreenAtom.reportRead();
    return super.isMapScreen;
  }

  @override
  set isMapScreen(bool value) {
    _$isMapScreenAtom.reportWrite(value, super.isMapScreen, () {
      super.isMapScreen = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ImageModelView.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$postProductAsyncAction =
      AsyncAction('_ImageModelView.postProduct', context: context);

  @override
  Future<void> postProduct() {
    return _$postProductAsyncAction.run(() => super.postProduct());
  }

  late final _$checkFirstTimeConnectivityAsyncAction = AsyncAction(
      '_ImageModelView.checkFirstTimeConnectivity',
      context: context);

  @override
  Future<dynamic> checkFirstTimeConnectivity() {
    return _$checkFirstTimeConnectivityAsyncAction
        .run(() => super.checkFirstTimeConnectivity());
  }

  late final _$_ImageModelViewActionController =
      ActionController(name: '_ImageModelView', context: context);

  @override
  String? validateFields(String? data) {
    final _$actionInfo = _$_ImageModelViewActionController.startAction(
        name: '_ImageModelView.validateFields');
    try {
      return super.validateFields(data);
    } finally {
      _$_ImageModelViewActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
connectivityEnums: ${connectivityEnums},
explonationController: ${explonationController},
productController: ${productController},
brandController: ${brandController},
priceController: ${priceController},
storeNameController: ${storeNameController},
isMapScreen: ${isMapScreen},
isLoading: ${isLoading}
    ''';
  }
}
