import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_beta/components/forum/widgets/user_forum_mobile_screen.dart';
import 'package:project_beta/components/forum/widgets/user_forum_web_screen.dart';
import 'package:project_beta/src/extensions/responsive.dart';
import 'package:project_beta/src/template/responsive.dart';

class UserForumScreen extends StatelessWidget {
  static const pageLink = "/UserDiscussionForum";
  final Function? onTapped;

  UserForumScreen({this.onTapped});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: UserForumMobileScreen(),
      tablet: UserForumMobileScreen(),
      desktop: UserForumWebScreen(onTapped: () {}),
    );
  }
}
