// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kelepir/product/constants/ic_sizes/icon_size.dart';
import 'package:outline_search_bar/outline_search_bar.dart';

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
          : Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(25, 60, 25, 10),
                  child: OutlineSearchBar(
                    borderWidth: 3,
                    borderColor: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    maxHeight: 48,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.modelView.productPosts.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 10.0),
                      child: Card(
                        elevation: 6,
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 6.0),
                              child: SizedBox(
                                  height: 90,
                                  width: 90,
                                  child: Image.network(
                                      'https://drive.deta.sh/v1/a0tzl87y/images/files/download?name=${widget.modelView.productPosts[index]?.imageId}.png',
                                      headers: const {
                                        'X-API-Key':
                                            'a0tzl87y_FGH1br2csiSv9b4AhjTRKGQeJbmcd92U'
                                      },
                                      fit: BoxFit.fill)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 1.0),
                                    child: Column(
                                      children: const [
                                        Icon(FontAwesomeIcons.locationPin,
                                            size:
                                                ProjectIconSizes.iConListSize),
                                        Icon(FontAwesomeIcons.brandsFontAwesome,
                                            size:
                                                ProjectIconSizes.iConListSize),
                                        Icon(FontAwesomeIcons.comment,
                                            size:
                                                ProjectIconSizes.iConListSize),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                            '${widget.modelView.productPosts[index]?.latitude.toString().substring(0, 5)},${widget.modelView.productPosts[index]?.longtitute.toString().substring(0, 5)}',
                                            overflow: TextOverflow.fade),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                            widget.modelView.productPosts[index]
                                                    ?.brand ??
                                                'Error',
                                            overflow: TextOverflow.fade),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                            widget.modelView.productPosts[index]
                                                    ?.product ??
                                                'Error',
                                            overflow: TextOverflow.fade),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Padding(
                                padding: const EdgeInsets.only(bottom: 24.0),
                                child: Text(
                                    '${widget.modelView.productPosts[index]?.price} ₺',
                                    overflow: TextOverflow.fade,
                                    textAlign: TextAlign.right,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge)),
                          ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
    });
  }
}
