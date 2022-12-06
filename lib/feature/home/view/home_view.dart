import 'package:flutter/material.dart';
import 'package:kelepir/product/constants/ic_sizes/icon_size.dart';
import 'package:kelepir/product/constants/margins/margins.dart';
import 'package:kelepir/product/constants/paddings/project_paddings.dart';
import 'package:kelepir/product/widgets/dummyViews.dart';
import 'package:kelepir/product/constants/durations/project_durations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../product/enums/tabbar_enums.dart';

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
            alignment: Alignment.topRight,
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
              Searchbar(),
            ],
          ),
        ));
  }
}

class Searchbar extends StatefulWidget {
  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  bool _searchbartoggle = false;
  FocusNode searchBarFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: ProjectDurations.lowDuration,
      firstChild: Padding(
        padding: EdgeInsets.fromLTRB(0, ProjectMargins.searchBarMargin * 2,
            ProjectMargins.searchBarMargin, 0),
        child: Container(
          height: ProjectIconSizes.iConSearchBar,
          width: MediaQuery.of(context).size.width * 0.90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  _searchbartoggle = !_searchbartoggle;
                  setState(() {});
                },
                icon: Icon(
                  FontAwesomeIcons.circleXmark,
                ),
              ),
              Expanded(
                child: TextField(
                  focusNode: searchBarFocus,
                  textInputAction: TextInputAction.none,
                  autofocus: _searchbartoggle,
                  decoration: InputDecoration(
                    hintText: 'Buradan arayın',
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      secondChild: InkWell(
        onTap: () async {
          _searchbartoggle = !_searchbartoggle;
          setState(() {});
          await Future.delayed(ProjectDurations.lowDuration);
          searchBarFocus.requestFocus();
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
              0,
              ProjectMargins.searchBarMargin * 2,
              ProjectMargins.searchBarMargin,
              0),
          child: Container(
            height: ProjectIconSizes.iConSearchBar,
            width: ProjectIconSizes.iConSearchBar,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(ProjectIconSizes.iConSearchBar),
            ),
            child: const Icon(
              Icons.search,
            ),
          ),
        ),
      ),
      crossFadeState: _searchbartoggle
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
    );
  }
}

extension SizeExtension on BuildContext {
  double getheight() {
    return MediaQuery.of(this).size.height;
  }
}
