import 'package:flutter/cupertino.dart';
import 'package:project_beta/components/learning_zone/widgets/learning_zone_mobile_screen.dart';
import 'package:project_beta/src/extensions/responsive.dart';
import 'package:project_beta/src/template/responsive.dart';

class LearningZoneScreen extends StatelessWidget {
  static const pageLink = "/LearningZoneScreen";

  const LearningZoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: LearningZoneMobileScreen(),
      tablet: LearningZoneMobileScreen(),
      desktop: LearningZoneMobileScreen(),
    );
  }
}
