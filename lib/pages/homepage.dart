import 'package:admin_jawara/component/header.dart';
import 'package:admin_jawara/controller/controller.dart';
import 'package:admin_jawara/pages/daftarbarang.dart';
import 'package:admin_jawara/pages/dashboard.dart';
import 'package:admin_jawara/pages/stokkeluar.dart';
import 'package:admin_jawara/pages/stokmasuk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _headerController = HeaderController();
  PageController page = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: GradientAppBar("Jawara Beladiri Store"),
        preferredSize: Size.fromHeight(50),
      ),
      // title: Text(
      //   "ADMIN JAWARA",
      //   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber),
      // ),
      // // bottom: PreferredSize(
      // //   child: HeaderAppbar(),
      // //   preferredSize: const Size.fromHeight(48.0),
      // // ),
      // backgroundColor: Gradient([Colors.blue, Colors.amber]),
      // elevation: 0,
      // //   title: const Text("Admin Jawara"),
      // centerTitle: true,

      body: Column(
        children: [
          Container(
            height: 20,
          ),
          Expanded(
            child: Row(
              children: [
                SideMenu(
                    style: SideMenuStyle(
                      displayMode: SideMenuDisplayMode.auto,
                      hoverColor: Colors.blue[100],
                      selectedColor: Colors.lightBlue,
                      selectedTitleTextStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      selectedIconColor: Colors.white,
                    ),
                    items: [
                      SideMenuItem(
                          onTap: () {
                            page.jumpToPage(0);
                            // HeaderController().changeHeaderIndex(0);
                          },
                          title: "Dashboard",
                          icon: Icons.home,
                          priority: 0),
                      SideMenuItem(
                          onTap: () {
                            page.jumpToPage(1);
                            // HeaderController().changeHeaderIndex(1);
                          },
                          title: "Daftar Stok",
                          icon: Icons.list,
                          priority: 1),
                      SideMenuItem(
                          onTap: () {
                            page.jumpToPage(2);
                            // HeaderController().changeHeaderIndex(2);
                          },
                          title: "Stok Keluar",
                          icon: Icons.outbox,
                          priority: 2),
                      SideMenuItem(
                          onTap: () {
                            page.jumpToPage(3);
                            // HeaderController().changeHeaderIndex(3);
                          },
                          title: "Stok Masuk",
                          icon: Icons.inbox,
                          priority: 3),
                      SideMenuItem(
                          onTap: () {
                            page.jumpToPage(4);
                            // HeaderController().changeHeaderIndex(4);
                          },
                          title: "Orderan WA",
                          icon: Icons.navigation_rounded,
                          priority: 4),
                    ],
                    controller: page),
                Expanded(
                    child: PageView(
                  controller: page,
                  children: const [
                    Dashboard(),
                    DaftarBarang(),
                    StokKeluar(),
                    StokMasuk(),
                    Center(child: Text("Sek Miker")),
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
