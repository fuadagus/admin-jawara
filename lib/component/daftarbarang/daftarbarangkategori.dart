import 'package:admin_jawara/component/daftarbarang/daftarbaranglist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Kategori extends StatelessWidget {
  const Kategori({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Get.to(
                    DaftarBarangItem(
                      category: "items",
                    ),
                    transition: Transition.cupertino);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/Silat.jpg"))),
                  child: Center(
                      child: Text(
                    "Alat Silat dan Beladiri",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/fitnes.jpg"))),
                  child: Center(
                      child: Text(
                    "Alat Fitnes",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/rumah.jpg"))),
                  child: Center(
                      child: Text(
                    "Dekorasi Rumah",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
