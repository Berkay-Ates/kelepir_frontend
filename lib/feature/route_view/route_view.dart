import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:outline_search_bar/outline_search_bar.dart';

import '../home/view_model/home_model_view.dart';

class RouteView extends StatefulWidget {
  HomeModelView modelView;
  RouteView({super.key, required this.modelView});

  @override
  State<RouteView> createState() => _RouteViewState();
}

class _RouteViewState extends State<RouteView> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(25, 60, 25, 20),
              child: OutlineSearchBar(
                searchButtonIconColor: Colors.white,
                icon: Icon(FontAwesomeIcons.locationPin),
                borderWidth: 3,
                borderColor: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(24)),
                maxHeight: 48,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Expanded(
                child: SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ))),
                            onPressed: (() {}),
                            child: const SizedBox(
                                child: Center(
                                    child: Text('Yakınımda ara',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ))))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(20))),
                            child: const Center(
                                child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text('Ev Addresim',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  )),
                            ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ))),
                            onPressed: (() {}),
                            child: const SizedBox(
                                child: Center(
                                    child: Text('İş Adresim',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ))))),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Text('İhtiyaç Listem',
                  style: TextStyle(color: Colors.grey[600], fontSize: 36, fontWeight: FontWeight.bold)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0),
              child: SizedBox(
                width: 300,
                child: OutlineSearchBar(
                  hintText: 'Elma',
                  borderWidth: 1,
                  borderColor: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0),
              child: SizedBox(
                width: 300,
                child: OutlineSearchBar(
                  hintText: 'Ayçiçek Yağı',
                  borderWidth: 1,
                  borderColor: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0),
              child: SizedBox(
                width: 300,
                child: OutlineSearchBar(
                  hintText: 'Antep Fıstığı',
                  borderWidth: 1,
                  borderColor: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0),
              child: SizedBox(
                width: 300,
                child: OutlineSearchBar(
                  hintText: 'Çikolatalı gofret',
                  borderWidth: 1,
                  borderColor: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0),
              child: SizedBox(
                width: 300,
                child: OutlineSearchBar(
                  hintText: 'Elma',
                  borderWidth: 1,
                  borderColor: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: OutlineSearchBar(
                  hintText: 'Flutter bilen yazılımcı',
                  borderWidth: 1,
                  borderColor: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
              ),
            ),
            SizedBox(
                width: 300,
                child: ListTile(
                  leading: Checkbox(
                    onChanged: ((value) {}),
                    value: false,
                  ),
                  title: const Text(
                    'En Az Market',
                    style: TextStyle(fontSize: 24),
                  ),
                )),
            SizedBox(
                width: 300,
                child: ListTile(
                  leading: Checkbox(
                    onChanged: ((value) {}),
                    value: false,
                  ),
                  title: const Text(
                    'En Düşük Fiyat',
                    style: TextStyle(fontSize: 24),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 160,
                height: 60,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ))),
                    onPressed: (() {}),
                    child: const SizedBox(
                        child: Center(
                            child: Text('Rota Oluştur',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ))))),
              ),
            )
          ],
        ),
      );
    });
  }
}
