// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../home/view_model/home_model_view.dart';

class UserSettings extends StatelessWidget {
  final HomeModelView modelView;
  const UserSettings({Key? key, required this.modelView}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Padding(
        padding: const EdgeInsets.only(top: 54.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Profil', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold))),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, bottom: 24),
              child: Row(
                children: [
                  SizedBox(height: 160, width: 160, child: Image.asset('assets/icons/kelepir_logo.png')),
                  const Expanded(
                    child: Text('Kelepir',
                        textAlign: TextAlign.center, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 32.0, bottom: 16, right: 18),
                  child: Container(
                    decoration:
                        const BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(18))),
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: const [
                        Text('Yayınlanan Ürün',
                            style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                        Text('12', style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold))
                      ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Container(
                    decoration:
                        const BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(18))),
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: const [
                        Text(' up 👍 ',
                            style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                        Text('12', style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold))
                      ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Container(
                    decoration:
                        const BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(18))),
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: const [
                        Text('down 👎',
                            style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                        Text('12', style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold))
                      ]),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, bottom: 16),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
                Padding(padding: EdgeInsets.only(right: 8.0), child: Icon(Icons.settings, size: 36)),
                Text('Tercihler', style: TextStyle(fontSize: 28))
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, bottom: 16),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
                Padding(padding: EdgeInsets.only(right: 8.0), child: Icon(Icons.map_outlined, size: 36)),
                Text('Kayıtlı Adreslerin', style: TextStyle(fontSize: 28))
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, bottom: 16),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
                Padding(padding: EdgeInsets.only(right: 8.0), child: Icon(Icons.notifications, size: 36)),
                Text('Bildirim Ayarları', style: TextStyle(fontSize: 28))
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, bottom: 16),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
                Padding(padding: EdgeInsets.only(right: 8.0), child: Icon(Icons.language, size: 36)),
                Text('Dil: Türkçe', style: TextStyle(fontSize: 28))
              ]),
            ),
            TextButton(
                onPressed: modelView.deleteToken,
                child: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                )),
          ],
        ),
      );
    });
  }
}
