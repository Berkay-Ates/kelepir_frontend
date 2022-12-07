// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashModelView on _SplashModelView, Store {
  late final _$connectivityEnumsAtom =
      Atom(name: '_SplashModelView.connectivityEnums', context: context);

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

  late final _$emailControllerAtom =
      Atom(name: '_SplashModelView.emailController', context: context);

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.reportRead();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.reportWrite(value, super.emailController, () {
      super.emailController = value;
    });
  }

  late final _$nameControllerAtom =
      Atom(name: '_SplashModelView.nameController', context: context);

  @override
  TextEditingController get nameController {
    _$nameControllerAtom.reportRead();
    return super.nameController;
  }

  @override
  set nameController(TextEditingController value) {
    _$nameControllerAtom.reportWrite(value, super.nameController, () {
      super.nameController = value;
    });
  }

  late final _$passwordControllerAtom =
      Atom(name: '_SplashModelView.passwordController', context: context);

  @override
  TextEditingController get passwordController {
    _$passwordControllerAtom.reportRead();
    return super.passwordController;
  }

  @override
  set passwordController(TextEditingController value) {
    _$passwordControllerAtom.reportWrite(value, super.passwordController, () {
      super.passwordController = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_SplashModelView.isLoading', context: context);

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

  late final _$isTokenExistsAtom =
      Atom(name: '_SplashModelView.isTokenExists', context: context);

  @override
  bool get isTokenExists {
    _$isTokenExistsAtom.reportRead();
    return super.isTokenExists;
  }

  @override
  set isTokenExists(bool value) {
    _$isTokenExistsAtom.reportWrite(value, super.isTokenExists, () {
      super.isTokenExists = value;
    });
  }

  late final _$checkFirstTimeConnectivityAsyncAction = AsyncAction(
      '_SplashModelView.checkFirstTimeConnectivity',
      context: context);

  @override
  Future<dynamic> checkFirstTimeConnectivity() {
    return _$checkFirstTimeConnectivityAsyncAction
        .run(() => super.checkFirstTimeConnectivity());
  }

  late final _$_SplashModelViewActionController =
      ActionController(name: '_SplashModelView', context: context);

  @override
  void checkUserToken() {
    final _$actionInfo = _$_SplashModelViewActionController.startAction(
        name: '_SplashModelView.checkUserToken');
    try {
      return super.checkUserToken();
    } finally {
      _$_SplashModelViewActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateFields(String? data) {
    final _$actionInfo = _$_SplashModelViewActionController.startAction(
        name: '_SplashModelView.validateFields');
    try {
      return super.validateFields(data);
    } finally {
      _$_SplashModelViewActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
connectivityEnums: ${connectivityEnums},
emailController: ${emailController},
nameController: ${nameController},
passwordController: ${passwordController},
isLoading: ${isLoading},
isTokenExists: ${isTokenExists}
    ''';
  }
}
