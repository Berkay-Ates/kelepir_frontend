// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:kelepir/core/base_view/base_view_model.dart';

import '../../../product/constants/ic_sizes/icon_size.dart';
import '../../../product/constants/margins/margins.dart';
import '../../../product/constants/paddings/project_paddings.dart';
import '../../../product/enums/tabbar_enums.dart';
import '../../../product/widgets/appbar_widget/custom_appbar.dart';
import '../../../product/widgets/dummy_views.dart';
import '../view_model/home_model_view.dart';

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
    _tabController = TabController(length: TabEnums.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseView<HomeModelView>(
        viewModel: HomeModelView(),
        onModelReady: ((modelView) {
          modelView.init();
        }),
        onPageBuilder: ((context, modelView) {
          return DefaultTabController(
              length: TabEnums.values.length,
              child: Scaffold(
                extendBody: true,
                appBar: CustomAppBar(
                  context: context,
                  appBar: Observer(
                    builder: (_) =>
                        modelView.isMapScreen ? const SizedBox.shrink() : AppBar(centerTitle: true, title: Text(title)),
                  ),
                ),
                floatingActionButton:
                    FloatingActionButton(onPressed: (() {}), child: const Icon(Icons.add_a_photo_outlined)),
                floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
                drawer: Drawer(
                  child: Padding(
                    padding: const EdgeInsets.all(ProjectPaddings.smallx3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Here we will put some notification and similar stuff', textAlign: TextAlign.center),
                        TextButton(onPressed: modelView.deleteToken, child: const Text('Logout'))
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: Observer(
                    builder: (_) => BottomAppBar(
                          color: Colors.blue[800],
                          shape: const CircularNotchedRectangle(),
                          notchMargin: ProjectMargins.nothcedMargin,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: TabEnums.values
                                  .map((e) => IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          modelView.setTabIndx(e.index, _tabController);
                                        },
                                        icon: Icon(e.getIcons()),
                                        color: modelView.selectedIndx == e.index ? Colors.white : Colors.white54,
                                        iconSize: modelView.selectedIndx == e.index
                                            ? ProjectIconSizes.iConTabbarSelected
                                            : ProjectIconSizes.iConTabbarnormal,
                                      ))
                                  .toList()),
                        )),
                body: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: const [
                    DummyViews(infoText: 'MapView'),
                    DummyViews(infoText: 'List page'),
                    DummyViews(infoText: 'Profile page'),
                    DummyViews(infoText: 'Extra page'),
                  ],
                ),
              ));
        }),
      ),
    );
  }
}
