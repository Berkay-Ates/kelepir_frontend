import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kelepir/core/base_view/base_view_model.dart';
import 'package:kelepir/core/token/token_management.dart';
import 'package:kelepir/feature/home/view/home_view.dart';
import 'package:kelepir/product/constants/paddings/project_paddings.dart';

import '../../../core/enums/networkEnum/network_enum.dart';
import '../../no_connection/no_connection.dart';
import '../model_view/image_model_view.dart';

class ImageView extends StatefulWidget {
  const ImageView({super.key});
  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  final GlobalKey<FormState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BaseView<ImageModelView>(
        viewModel: ImageModelView(),
        onModelReady: ((modelView) {
          modelView.init();
        }),
        onPageBuilder: ((context, modelView) {
          return Scaffold(
            appBar: AppBar(title: const Text('image upload')),
            body: Observer(
              builder: (_) => modelView.connectivityEnums == NetworkConnectivityEnums.offline
                  ? const NoConnectionView()
                  : modelView.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : SingleChildScrollView(
                          child: Form(
                            key: key,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: ProjectPaddings.normal),
                                    child: SizedBox(
                                        height: context.getWidth() * 0.5,
                                        child:
                                            Image.file(fit: BoxFit.cover, File(TokenManagement.instance.getImagePath))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: modelView.explonationController,
                                      validator: modelView.validateFields,
                                      minLines: 3,
                                      maxLines: 8,
                                      textInputAction: TextInputAction.next,
                                      decoration: const InputDecoration(
                                          label: Text('Explonation'),
                                          border:
                                              OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: modelView.productController,
                                      validator: modelView.validateFields,
                                      textInputAction: TextInputAction.next,
                                      decoration: const InputDecoration(
                                          label: Text('Product Category'),
                                          border:
                                              OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: modelView.brandController,
                                      validator: modelView.validateFields,
                                      textInputAction: TextInputAction.next,
                                      decoration: const InputDecoration(
                                          label: Text('Brand Name'),
                                          border:
                                              OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: modelView.storeNameController,
                                      validator: modelView.validateFields,
                                      textInputAction: TextInputAction.next,
                                      decoration: const InputDecoration(
                                          label: Text('Store Name'),
                                          border:
                                              OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: modelView.priceController,
                                      validator: modelView.validateFields,
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      decoration: const InputDecoration(
                                          label: Text('Price'),
                                          border:
                                              OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          modelView.postProduct();
                                        },
                                        child: const Text('upload')),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
            ),
          );
        }));
  }
}
