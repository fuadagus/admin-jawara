import 'package:admin_jawara/component/daftarbarang/daftarbaranglist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Kategori extends StatelessWidget {
  const Kategori({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              Get.to(
                  const DaftarBarangItem(
                    category: "Alat Silat dan Beladiri",
                  ),
                  transition: Transition.cupertino);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/Silat.jpg"))),
                child: const Center(
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
            onTap: () {
              Get.to(
                  const DaftarBarangItem(
                    category: "Alat Fitnes",
                  ),
                  transition: Transition.cupertino);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/fitnes.jpg"))),
                child: const Center(
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
            onTap: () {
              Get.to(
                  const DaftarBarangItem(
                    category: "Dekorasi Rumah",
                  ),
                  transition: Transition.cupertino);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/rumah.jpg"))),
                child: const Center(
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
    );
  }
}
