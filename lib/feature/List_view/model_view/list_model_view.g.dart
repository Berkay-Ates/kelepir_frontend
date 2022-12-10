// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_model_view.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListModelView on _ListModelView, Store {
  late final _$productPostsAtom =
      Atom(name: '_ListModelView.productPosts', context: context);

  @override
  ProductResults? get productPosts {
    _$productPostsAtom.reportRead();
    return super.productPosts;
  }

  @override
  set productPosts(ProductResults? value) {
    _$productPostsAtom.reportWrite(value, super.productPosts, () {
      super.productPosts = value;
    });
  }

  late final _$connectivityEnumsAtom =
      Atom(name: '_ListModelView.connectivityEnums', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: '_ListModelView.isLoading', context: context);

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
      Atom(name: '_ListModelView.isTokenExists', context: context);

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
      '_ListModelView.checkFirstTimeConnectivity',
      context: context);

  @override
  Future<dynamic> checkFirstTimeConnectivity() {
    return _$checkFirstTimeConnectivityAsyncAction
        .run(() => super.checkFirstTimeConnectivity());
  }

  late final _$_ListModelViewActionController =
      ActionController(name: '_ListModelView', context: context);

  @override
  void checkUserToken() {
    final _$actionInfo = _$_ListModelViewActionController.startAction(
        name: '_ListModelView.checkUserToken');
    try {
      return super.checkUserToken();
    } finally {
      _$_ListModelViewActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateFields(String? data) {
    final _$actionInfo = _$_ListModelViewActionController.startAction(
        name: '_ListModelView.validateFields');
    try {
      return super.validateFields(data);
    } finally {
      _$_ListModelViewActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productPosts: ${productPosts},
connectivityEnums: ${connectivityEnums},
isLoading: ${isLoading},
isTokenExists: ${isTokenExists}
    ''';
  }
}
