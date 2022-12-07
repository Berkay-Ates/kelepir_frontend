// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model_view.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeModelView on _HomeModelView, Store {
  late final _$connectivityEnumsAtom =
      Atom(name: '_HomeModelView.connectivityEnums', context: context);

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

  late final _$isMapScreenAtom =
      Atom(name: '_HomeModelView.isMapScreen', context: context);

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
      Atom(name: '_HomeModelView.isLoading', context: context);

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

  late final _$selectedIndxAtom =
      Atom(name: '_HomeModelView.selectedIndx', context: context);

  @override
  int get selectedIndx {
    _$selectedIndxAtom.reportRead();
    return super.selectedIndx;
  }

  @override
  set selectedIndx(int value) {
    _$selectedIndxAtom.reportWrite(value, super.selectedIndx, () {
      super.selectedIndx = value;
    });
  }

  late final _$checkFirstTimeConnectivityAsyncAction = AsyncAction(
      '_HomeModelView.checkFirstTimeConnectivity',
      context: context);

  @override
  Future<dynamic> checkFirstTimeConnectivity() {
    return _$checkFirstTimeConnectivityAsyncAction
        .run(() => super.checkFirstTimeConnectivity());
  }

  late final _$deleteTokenAsyncAction =
      AsyncAction('_HomeModelView.deleteToken', context: context);

  @override
  Future<bool> deleteToken() {
    return _$deleteTokenAsyncAction.run(() => super.deleteToken());
  }

  late final _$_HomeModelViewActionController =
      ActionController(name: '_HomeModelView', context: context);

  @override
  void setTabIndx(int index, TabController tabController) {
    final _$actionInfo = _$_HomeModelViewActionController.startAction(
        name: '_HomeModelView.setTabIndx');
    try {
      return super.setTabIndx(index, tabController);
    } finally {
      _$_HomeModelViewActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
connectivityEnums: ${connectivityEnums},
isMapScreen: ${isMapScreen},
isLoading: ${isLoading},
selectedIndx: ${selectedIndx}
    ''';
  }
}
