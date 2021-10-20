import 'package:admin_jawara/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController page = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Jawara"),
        centerTitle: true,
      ),
      body: Row(
        children: [
          SideMenu(
              style: SideMenuStyle(
                displayMode: SideMenuDisplayMode.auto,
                hoverColor: Colors.blue[100],
                selectedColor: Colors.lightBlue,
                selectedTitleTextStyle: TextStyle(color: Colors.white),
                selectedIconColor: Colors.white,
              ),
              items: [
                SideMenuItem(
                    onTap: () {
                      page.jumpToPage(0);
                    },
                    title: "Dashboard",
                    icon: Icons.home,
                    priority: 0),
                SideMenuItem(
                    onTap: () {
                      page.jumpToPage(1);
                    },
                    title: "Stok Keluar",
                    icon: Icons.outbox,
                    priority: 1),
                SideMenuItem(
                    onTap: () {
                      page.jumpToPage(2);
                    },
                    title: "Stok Masuk",
                    icon: Icons.inbox,
                    priority: 2),
                SideMenuItem(
                    onTap: () {
                      page.jumpToPage(3);
                    },
                    title: "Orderan WA",
                    icon: Icons.navigation_rounded,
                    priority: 3),
              ],
              controller: page),
          Expanded(
              child: PageView(
            controller: page,
            children: [
              Container(child: Dashboard()
                  //  Center(child: Text("Halaman Dashboard")),
                  ),
              Container(
                child: Center(child: Text("Stok Keluar")),
              ),
              Container(
                child: Center(child: Text("Stok Masuk")),
              ),
              Container(
                child: Center(child: Text("Orderan WA")),
              )
            ],
          ))
        ],
      ),
    );
  }
}
