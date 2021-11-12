import 'package:flutter/material.dart';
import 'package:admin_jawara/pages/homepage.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          height: 50,
          child: const Center(child: Text("innallaha ma'asshobirin")),
        ),
      ],
    );
  }
}
