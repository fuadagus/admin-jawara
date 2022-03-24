import 'package:admin_jawara/component/daftarbarang/daftarbaranglist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Kategori extends StatelessWidget {
  const Kategori({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Container(
          height: 250,
          child: Expanded(
            child: InkWell(
              onTap: () {
                Get.to(
                    const DaftarBarangItem(
                      category: "Senjata Beladiri",
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
                          image: AssetImage("assets/images/senjata.jpg"))),
                  child: const Center(
                      child: Text(
                    "Senjata Beladiri",
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
        ),
        Container(
          height: 250,
          child: Expanded(
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
        ),
        Container(
          height: 250,
          child: Expanded(
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
                    "Alat Fitnes & Olahraga",
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
        ),
        Container(
          height: 250,
          child: Expanded(
            child: InkWell(
              onTap: () {
                Get.to(
                    const DaftarBarangItem(
                      category: "Hobi",
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
                          image: AssetImage("assets/images/hobi.jpg"))),
                  child: const Center(
                      child: Text(
                    "Hobi",
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
        ),
        Container(
          height: 250,
          child: Expanded(
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
                    "Dekorasi Rumah & Perabotan",
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
        ),
        Container(
          height: 250,
          child: Expanded(
            child: InkWell(
              onTap: () {
                Get.to(
                    const DaftarBarangItem(
                      category: "Atribut Silat",
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
                          image: AssetImage("assets/images/atribut.jpg"))),
                  child: const Center(
                      child: Text(
                    "Atribut Silat",
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
        ),
        Container(
          height: 250,
          child: Expanded(
            child: InkWell(
              onTap: () {
                Get.to(
                    const DaftarBarangItem(
                      category: "Esensial",
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
                          image: AssetImage("assets/images/Essens.jpg"))),
                  child: const Center(
                      child: Text(
                    "Esensial",
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
        ),
      ],
    );
  }
}
