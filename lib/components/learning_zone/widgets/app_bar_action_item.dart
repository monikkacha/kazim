import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarActionItem extends StatelessWidget {
  final VoidCallback onActionClick;
  final IconData icon;

  const AppBarActionItem(
      {Key? key, required this.onActionClick, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onActionClick,
      child: Container(
          width: 46.0, height: 46.0, child: Center(child: Icon(icon))),
    );
  }
}
