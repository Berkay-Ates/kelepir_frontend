import 'package:flutter/material.dart';
import 'package:kelepir/product/constants/ic_sizes/icon_size.dart';
import 'package:kelepir/product/constants/margins/margins.dart';
import 'package:kelepir/product/constants/paddings/project_paddings.dart';
import 'package:kelepir/product/widgets/dummyViews.dart';
import 'package:kelepir/product/constants/durations/project_durations.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import '../../../product/enums/tabbar_enums.dart';
import 'dart:math';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late final _tabController;
  int _selectedIndx = 0;
  final String title = 'Home View';
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: TabEnums.values.length, vsync: this);
  }

  void setTabIndx(int index) {
    _tabController.animateTo(index);
    _selectedIndx = index;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: TabEnums.values.length,
        child: Scaffold(
          extendBody: true,
          appBar: null,
          floatingActionButton: FloatingActionButton(
              onPressed: (() {}),
              child: const Icon(Icons.add_a_photo_outlined)),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          drawer: Drawer(
            child: Padding(
              padding: const EdgeInsets.all(ProjectPaddings.smallx3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Here we will put some notification and similar stuff',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.blue[800],
            shape: const CircularNotchedRectangle(),
            notchMargin: ProjectMargins.nothcedMargin,
            child: Row(
                children: TabEnums.values
                    .map((e) => Expanded(
                        flex: 1,
                        child: Tab(
                          iconMargin:
                              const EdgeInsets.all(ProjectMargins.smallMargin),
                          icon: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setTabIndx(e.index);
                              setState(() {});
                            },
                            icon: Icon(e.getIcons()),
                            color: _selectedIndx == e.index
                                ? Colors.white
                                : Colors.white54,
                            iconSize: _selectedIndx == e.index
                                ? ProjectIconSizes.iConTabbarSelected
                                : ProjectIconSizes.iConTabbarnormal,
                          ),
                        )))
                    .toList()),
          ),
          body: Stack(
            children: [
              TabBarView(
                controller: _tabController,
                children: const [
                  DummyViews(infoText: 'Map page'),
                  DummyViews(infoText: 'List page'),
                  DummyViews(infoText: 'Profile page'),
                  DummyViews(infoText: 'Extra page'),
                ],
              ),
              MyApp(),
            ],
          ),
        ));
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

int toggle = 0;

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: ProjectMargins.searchBarMargin * 1.5,
          left: ProjectMargins.searchBarMargin),
      child: AnimSearchBar(
        width: MediaQuery.of(context).size.width * 0.9,
        textController: _textEditingController,
        onSuffixTap: () {
          setState(() {
            _textEditingController.clear();
          });
        },
      ),
    );
  }
}

extension SizeExtension on BuildContext {
  double getheight() {
    return MediaQuery.of(this).size.height;
  }
}
