import 'package:flutter/material.dart';

class DummyViews extends StatefulWidget {
  const DummyViews({super.key, required this.infoText});
  @override
  State<DummyViews> createState() => _DummyViewsState();
  final infoText;
}

class _DummyViewsState extends State<DummyViews> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text(widget.infoText), Text(widget.infoText), Text(widget.infoText), Text(widget.infoText)],
    );
  }
}
