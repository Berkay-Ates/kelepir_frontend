import 'package:flutter/material.dart';
import 'package:kelepir/product/constants/ic_sizes/Icon_Size.dart';
import 'package:kelepir/product/constants/margins/margins.dart';
import 'package:kelepir/product/widgets/dummyViews.dart';
import '../../../product/enums/tabbar_enums.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late final _tabController;
  final String title = 'Home View';
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: Tabs.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: Tabs.values.length,
        child: Scaffold(
          appBar: AppBar(title: Text(title), elevation: 0, backgroundColor: Colors.transparent),
          floatingActionButton: FloatingActionButton(onPressed: (() {}), child: const Icon(Icons.add_a_photo_outlined)),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          drawer: Drawer(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
            color: Colors.redAccent,
            shape: const CircularNotchedRectangle(),
            notchMargin: ProjectMargins.nothcedMargin,
            child: TabBar(
                padding: EdgeInsets.zero,
                controller: _tabController,
                tabs: Tabs.values.map((e) => Tab(child: Icon(e.getIcons(), size: IconSizes.iConLargeSize))).toList()),
          ),
          body: TabBarView(
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
