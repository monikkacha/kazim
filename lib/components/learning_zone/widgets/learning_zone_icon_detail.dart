import 'package:flutter/cupertino.dart';
import 'package:project_beta/theme/app_theme.dart';

class LearningZoneIconDetail extends StatelessWidget {
  final String primaryText;
  final String secondaryText;
  final IconData icon;

  LearningZoneIconDetail(
      {required this.primaryText,
      required this.secondaryText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 32.0,
          width: 32.0,
          decoration: BoxDecoration(
              color: AppColor.primaryColor.withAlpha(50),
              borderRadius: BorderRadius.circular(100.0)),
          child: Center(
            child: Icon(
              icon,
              color: AppColor.primaryColor,
              size: 16.0,
            ),
          ),
        ),
        SizedBox(
          width: 12.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              primaryText,
              style: TextStyle(
                  color: AppColor.black,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              secondaryText,
              style: TextStyle(color: AppColor.doveGrey, fontSize: 10.0),
            ),
          ],
        ),
      ],
    );
  }
}
