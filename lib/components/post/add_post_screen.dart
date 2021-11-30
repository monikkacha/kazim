import 'package:flutter/cupertino.dart';
import 'package:project_beta/components/post/widgets/add_post_screen_mobile.dart';
import 'package:project_beta/db/table/draft_table.dart';
import 'package:project_beta/src/extensions/responsive.dart';
import 'package:project_beta/src/template/responsive.dart';

class AddPostScreen extends StatelessWidget {
  static const pageLink = "/AddPostScreen";

  @override
  Widget build(BuildContext context) {
    return Responsive(
      tablet: AddPostScreenMobile(),
      mobile: AddPostScreenMobile(),
      desktop: AddPostScreenMobile(),
    );
  }
}
