// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthModelView on _AuthModelView, Store {
  late final _$connectivityEnumsAtom =
      Atom(name: '_AuthModelView.connectivityEnums', context: context);

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
      Atom(name: '_AuthModelView.emailController', context: context);

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
      Atom(name: '_AuthModelView.nameController', context: context);

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
      Atom(name: '_AuthModelView.passwordController', context: context);

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
      Atom(name: '_AuthModelView.isLoading', context: context);

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
      Atom(name: '_AuthModelView.isTokenExists', context: context);

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
      '_AuthModelView.checkFirstTimeConnectivity',
      context: context);

  @override
  Future<dynamic> checkFirstTimeConnectivity() {
    return _$checkFirstTimeConnectivityAsyncAction
        .run(() => super.checkFirstTimeConnectivity());
  }

  late final _$registerUserAsyncAction =
      AsyncAction('_AuthModelView.registerUser', context: context);

  @override
  Future<void> registerUser() {
    return _$registerUserAsyncAction.run(() => super.registerUser());
  }

  late final _$signInUserAsyncAction =
      AsyncAction('_AuthModelView.signInUser', context: context);

  @override
  Future<void> signInUser() {
    return _$signInUserAsyncAction.run(() => super.signInUser());
  }

  late final _$_AuthModelViewActionController =
      ActionController(name: '_AuthModelView', context: context);

  @override
  void checkUserToken() {
    final _$actionInfo = _$_AuthModelViewActionController.startAction(
        name: '_AuthModelView.checkUserToken');
    try {
      return super.checkUserToken();
    } finally {
      _$_AuthModelViewActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateFields(String? data) {
    final _$actionInfo = _$_AuthModelViewActionController.startAction(
        name: '_AuthModelView.validateFields');
    try {
      return super.validateFields(data);
    } finally {
      _$_AuthModelViewActionController.endAction(_$actionInfo);
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
