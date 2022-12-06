import 'package:flutter/material.dart';
import 'package:kelepir/core/enums/shared/shared_enums.dart';
import 'package:kelepir/core/init/cache/shared_manager.dart';
import 'package:kelepir/core/init/navigation/navigation_service.dart';
import 'package:kelepir/product/constants/ic_sizes/icon_size.dart';
import 'package:kelepir/product/constants/margins/margins.dart';
import 'package:kelepir/product/constants/paddings/project_paddings.dart';
import 'package:kelepir/product/widgets/dummyViews.dart';
import '../../../core/enums/navigations_enum/navigation_enums.dart';
import '../../../core/init/cache/singleton_shared_pref/singleton_shared_pref.dart';
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

  Future deleteToken() async {
    SharedPreferencesManager preferencesManager =
        SharedPreferencesManager(SingletonSharedPref.instance?.getSharedObject);
    try {
      final isTokenDeleted = await preferencesManager.delete(SharedKeyEnums.userTokenKey);

      if (isTokenDeleted) {
        NavigationService.instance.router.go(NavigationEnums.auth.routeName);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: TabEnums.values.length,
        child: Scaffold(
          extendBody: true,
          appBar: AppBar(
            centerTitle: true,
            title: Text(title),
            elevation: 0,
          ),
          floatingActionButton: FloatingActionButton(onPressed: (() {}), child: const Icon(Icons.add_a_photo_outlined)),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          drawer: Drawer(
            child: Padding(
              padding: const EdgeInsets.all(ProjectPaddings.smallx3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Here we will put some notification and similar stuff', textAlign: TextAlign.center),
                  TextButton(
                      onPressed: () {
                        deleteToken();
                      },
                      child: const Text('Logout'))
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
                    .map((e) => Container(
                          color: e.index.isEven ? Colors.pink : Colors.amber,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                setTabIndx(e.index);
                                setState(() {});
                              },
                              icon: Icon(e.getIcons()),
                              color: _selectedIndx == e.index ? Colors.white : Colors.white54,
                              iconSize: _selectedIndx == e.index
                                  ? ProjectIconSizes.iConTabbarSelected
                                  : ProjectIconSizes.iConTabbarnormal,
                            ),
                          ),
                        ))
                    .toList()),
          ),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: const [
              DummyViews(infoText: 'Map page'),
              DummyViews(infoText: 'List page'),
              DummyViews(infoText: 'Profile page'),
              DummyViews(infoText: 'Extra page'),
            ],
          ),
        ));
  }
}
