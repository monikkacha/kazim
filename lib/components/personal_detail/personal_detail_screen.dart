import 'package:flutter/material.dart';
import 'package:project_beta/components/personal_detail/widgets/personal_detail_mobile.dart';
import 'package:project_beta/src/extensions/responsive.dart';
import 'package:project_beta/src/template/responsive.dart';

class PersonalDetailScreen extends StatelessWidget {
  static final pageLink = "/PersonalDetailScreen";

  @override
  Widget build(BuildContext context) {
    return Responsive(
      tablet: PersonalDetailMobile(),
      mobile: PersonalDetailMobile(),
      desktop: PersonalDetailMobile(),
    );
  }
}
