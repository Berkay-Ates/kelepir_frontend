// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../home/view_model/home_model_view.dart';

class ProductListView extends StatefulWidget {
  HomeModelView modelView;
  ProductListView({Key? key, required this.modelView}) : super(key: key);
  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  Widget build(BuildContext context) {
    widget.modelView.getProducts();
    return Observer(builder: (_) {
      return widget.modelView.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: widget.modelView.productPosts.length,
              itemBuilder: (context, index) => Card(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: SizedBox(
                          height: 90,
                          width: 90,
                          child: Image.network(
                              'https://drive.deta.sh/v1/a0tzl87y/images/files/download?name=${widget.modelView.productPosts[index]?.imageId}.png',
                              headers: const {'X-API-Key': 'a0tzl87y_FGH1br2csiSv9b4AhjTRKGQeJbmcd92U'},
                              fit: BoxFit.fill)),
                    ),
                    Row(
                      children: [
                        Column(
                          children: const [
                            Icon(Icons.pin_drop_rounded),
                            Icon(Icons.brightness_auto_rounded),
                          ],
                        ),
                        Column(
                          children: [
                            Text(widget.modelView.productPosts[index]?.price ?? 'Error', overflow: TextOverflow.fade),
                            Text(widget.modelView.productPosts[index]?.brand ?? 'Error', overflow: TextOverflow.fade),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: Text('${widget.modelView.productPosts[index]?.price} ₺',
                            style: Theme.of(context).textTheme.headline6)),
                  ]),
                ),
              ),
            );
    });
  }
}
