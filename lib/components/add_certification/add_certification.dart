import 'package:flutter/material.dart';
import 'package:project_beta/components/add_certification/widgets/add_certification_mobile.dart';
import 'package:project_beta/src/extensions/responsive.dart';
import 'package:project_beta/src/template/responsive.dart';

class AddCertification extends StatelessWidget {
  static final pageLink = "/AddCertification";

  @override
  Widget build(BuildContext context) {
    return Responsive(
      tablet: AddCertificationMobile(),
      desktop: AddCertificationMobile(),
      mobile: AddCertificationMobile(),
    );
  }
}
