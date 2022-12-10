import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class search_bar extends StatelessWidget {
  final TextEditingController _textEditingController;
  const search_bar(@required this._textEditingController);

  @override
  Widget build(BuildContext context) {
    return AnimSearchBar(
      width: MediaQuery.of(context).size.width * 0.9,
      textController: _textEditingController,
      onSuffixTap: () {},
    );
  }
}
