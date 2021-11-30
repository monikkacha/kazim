import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_beta/constants/app_assets.dart';
import 'package:project_beta/src/models/user_forum_model.dart';
import 'package:project_beta/theme/app_theme.dart';

class UserForumCard extends StatelessWidget {
  final UserForumModel userForumModel;

  const UserForumCard({Key? key, required this.userForumModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12.0),
      decoration: BoxDecoration(
          color: AppColor.white, borderRadius: BorderRadius.circular(14.0)),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AppAssets.female,
                height: 40.0,
                width: 40.0,
              ),
              SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Alex Gender",
                          style: GoogleFonts.barlow(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 20.0),
                        ),
                        Text(
                          "5 days ago",
                          style: TextStyle(
                              color: AppColor.greenSpring,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Spacer(),
                    Text(
                      userForumModel.category,
                      style: TextStyle(
                          color: AppColor.fuelYellow,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 12.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                userForumModel.title,
                style: GoogleFonts.barlow(
                  fontWeight: FontWeight.w600,
                  color: AppColor.primaryColor,
                  fontSize: 16.0,
                ),
                // Text(
                //   userForumModel.title,
                //   style: TextStyle(
                //       color: AppColor.primaryColor,
                //       fontSize: 16.0,
                //       fontWeight: FontWeight.w900),
              ),
            ],
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(
            userForumModel.postData,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
                fontWeight: FontWeight.w700, color: AppColor.greenSpring),
          ),
          SizedBox(
            height: 5.0,
          ),
          Divider(
            color: AppColor.gallery,
            thickness: 2.0,
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite,
                color: AppColor.fuelYellow,
                size: 20.0,
              ),
              SizedBox(
                width: 4.0,
              ),
              GestureDetector(
                onTap: () {
                  print("Like clicked");
                },
                child: Text(
                  "200k Likes",
                  style: GoogleFonts.barlow(
                      color: AppColor.primaryColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Icon(
                Icons.question_answer,
                color: AppColor.fuelYellow,
                size: 20.0,
              ),
              SizedBox(
                width: 4.0,
              ),
              GestureDetector(
                onTap: () {
                  print("Comment clicked");
                },
                child: Text(
                  "100k Comments",
                  style: GoogleFonts.barlow(
                      color: AppColor.primaryColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
