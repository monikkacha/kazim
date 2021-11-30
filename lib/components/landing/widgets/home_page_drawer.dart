import 'package:flutter/material.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 10,
          width: 10,
          color: Colors.blueAccent,
        ),
        Container(
          height: 10,
          width: 10,
          color: Colors.blueAccent,
        ),
        Container(
          height: 10,
          width: 10,
          color: Colors.blueAccent,
        )
      ],
    );
  }
}
