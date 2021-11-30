import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_beta/components/forum/widgets/add_post_floating_action_btn.dart';
import 'package:project_beta/components/forum/widgets/filter_bottom_sheet.dart';
import 'package:project_beta/components/forum/widgets/user_forum_card.dart';
import 'package:project_beta/components/post/add_post_screen.dart';
import 'package:project_beta/constants/app_assets.dart';
import 'package:project_beta/constants/app_routes.dart';
import 'package:project_beta/services/forum/forum_getx_controller.dart';
import 'package:project_beta/constants/lang_constants.dart';
import 'package:project_beta/theme/app_theme.dart';

class UserForumMobileScreen extends StatelessWidget {
  static const pageLink = "/UserDiscussionForum";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pampas,
      appBar: AppBar(
        toolbarHeight: 100.0,
        elevation: 0.0,
        backgroundColor: AppColor.pampas,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: AppColor.desertStorm, width: 2.0))),
          child: Column(
            children: [
              SizedBox(
                height: 88.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.keyboard_backspace,
                        color: AppColor.primaryColor,
                        size: 36.0,
                      ),
                    ),
                    Text(
                      LanguageConstants.studentForum.toUpperCase(),
                      style: GoogleFonts.barlow(
                          fontSize: 22.0,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w500),
                    ),
                    InkWell(
                      onTap: () {
                        FilterBottomSheet.get(context);
                      },
                      child: SvgPicture.asset(
                        AppAssets.filter,
                        height: 24.0,
                        width: 24.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: AddPostFloatingActionButton(
          onTap: () => Beamer.of(context).beamToNamed(AppRoutes.addPostScreen)),
      body: SingleChildScrollView(
        child: GetBuilder<ForumGetXController>(
          init: ForumGetXController(),
          builder: (controller) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Beamer.of(context).beamToNamed('/details/${index}');
                      },
                      child:
                          UserForumCard(userForumModel: controller.data[index]),
                    );
                  }),
            );
          },
        ),
      ),
    );
  }
}
