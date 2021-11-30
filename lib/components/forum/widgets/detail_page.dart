import 'package:flutter/material.dart';
import 'package:project_beta/components/forum/widgets/detail_screen.dart';

class DetailPage extends Page {
  // final int? index;
  // const DetailPage({this.index});

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        // return DetailScreen(index);
        return Container();
      },
    );
  }
}
