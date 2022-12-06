import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class BaseView<T extends Store> extends StatefulWidget {
  const BaseView({
    super.key,
    required this.viewModel,
    required this.onModelReady,
    required this.onPageBuilder,
    this.onDispose,
  });

  final T viewModel;
  final void Function(T modelView) onModelReady;
  final Widget Function(BuildContext context, T modelView) onPageBuilder;
  final VoidCallback? onDispose;

  @override
  State<BaseView> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store> extends State<BaseView<T>> {
  late T modelView;

  @override
  void initState() {
    modelView = widget.viewModel;
    widget.onModelReady(modelView); //* modeli aldık initialize ettik ve sonra geri verdik
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, modelView);
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) {
      widget.onDispose?.call();
    }
  }
}
