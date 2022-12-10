// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kelepir/core/ImageUpload/image_upload_manager.dart';
import 'package:kelepir/core/base_view/base_view_model.dart';
import 'package:kelepir/feature/mapView/view/map_view.dart';
import '../../../core/enums/navigations_enum/navigation_enums.dart';
import '../../../product/Base_Header/base_header.dart';
import '../../../product/constants/ic_sizes/icon_size.dart';
import '../../../product/constants/margins/margins.dart';
import '../../../product/constants/paddings/project_paddings.dart';
import '../../../product/enums/tabbar_enums.dart';
import '../../../product/widgets/appbar_widget/custom_appbar.dart';
import '../../../product/widgets/dummy_views.dart';
import '../../List_view/view/list_view.dart';
import '../view_model/home_model_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin, SheetMixin {
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
                floatingActionButton: Observer(builder: (_) {
                  return FloatingActionButton(
                      onPressed: () async {
                        final image = await showPhotoModelBottomSheet(context, modelView);
                      },
                      child: const Icon(Icons.add_a_photo_outlined));
                }),
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
                          children: [
                            Expanded(
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  modelView.setTabIndx(TabEnums.map.index, _tabController);
                                },
                                icon: Icon(TabEnums.map.getIcons()),
                                color: modelView.selectedIndx == TabEnums.map.index ? Colors.white : Colors.white54,
                                iconSize: modelView.selectedIndx == TabEnums.map.index
                                    ? ProjectIconSizes.iConTabbarSelected
                                    : ProjectIconSizes.iConTabbarnormal,
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  modelView.setTabIndx(TabEnums.list.index, _tabController);
                                },
                                icon: Icon(TabEnums.list.getIcons()),
                                color: modelView.selectedIndx == TabEnums.list.index ? Colors.white : Colors.white54,
                                iconSize: modelView.selectedIndx == TabEnums.list.index
                                    ? ProjectIconSizes.iConTabbarSelected
                                    : ProjectIconSizes.iConTabbarnormal,
                              ),
                            ),
                            const Spacer(),
                            Expanded(
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  modelView.setTabIndx(TabEnums.extra.index, _tabController);
                                },
                                icon: Icon(TabEnums.extra.getIcons()),
                                color: modelView.selectedIndx == TabEnums.extra.index ? Colors.white : Colors.white54,
                                iconSize: modelView.selectedIndx == TabEnums.extra.index
                                    ? ProjectIconSizes.iConTabbarSelected
                                    : ProjectIconSizes.iConTabbarnormal,
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  modelView.setTabIndx(TabEnums.profile.index, _tabController);
                                },
                                icon: Icon(TabEnums.profile.getIcons()),
                                color: modelView.selectedIndx == TabEnums.profile.index ? Colors.white : Colors.white54,
                                iconSize: modelView.selectedIndx == TabEnums.profile.index
                                    ? ProjectIconSizes.iConTabbarSelected
                                    : ProjectIconSizes.iConTabbarnormal,
                              ),
                            )
                          ],
                        ))),
                body: Observer(builder: (_) {
                  return TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: [
                      MapHome(),
                      ProductListView(modelView: modelView),
                      const DummyViews(infoText: 'page view'),
                      const DummyViews(infoText: 'Extra page'),
                    ],
                  );
                }),
              ));
        }),
      ),
    );
  }
}

mixin SheetMixin {
  Future<T?> showPhotoModelBottomSheet<T>(BuildContext context, HomeModelView modelView) {
    return showModalBottomSheet<T>(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      enableDrag: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Observer(builder: (_) {
            return modelView.isLoading
                ? const SizedBox(height: 200, child: Center(child: CircularProgressIndicator()))
                : Column(mainAxisSize: MainAxisSize.min, children: [
                    const BaseSheetHeader(),
                    TextButton(
                        onPressed: () async {
                          modelView.image = await ImageUploadManager().fetchFromGallery();
                          if (modelView.image?.path != null) {
                            await modelView.uploadImage(modelView.image!.path);
                            modelView.navigationService.router.go(NavigationEnums.image.routeName);
                          }
                        },
                        child: const Text('Gallery')),
                    TextButton(
                        onPressed: () async {
                          modelView.image = await ImageUploadManager().fetchFromCamera();
                          if (modelView.image?.path != null) {
                            await modelView.uploadImage(modelView.image!.path);
                            modelView.navigationService.router.go(NavigationEnums.image.routeName);
                          }
                        },
                        child: const Text('Camera')),
                  ]);
          }),
        );
      },
    );
  }
}

extension SizeExtension on BuildContext {
  double getWidth() {
    return MediaQuery.of(this).size.width;
  }
}
