import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:project_beta/components/forum/widgets/user_forum_card.dart';
import 'package:project_beta/constants/dummy_constant.dart';
import 'package:project_beta/services/forum/forum_getx_controller.dart';
import 'package:project_beta/theme/app_theme.dart';

class UserForumWebScreen extends StatelessWidget {
  final Function? onTapped;

  UserForumWebScreen({this.onTapped});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Row(
        children: [
          Expanded(
            child: drawerMenu(context),
          ),
          Expanded(
            child: mainScreen(context),
            flex: 5,
          )
        ],
      ),
    );
  }

  Widget drawerMenu(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      decoration: BoxDecoration(color: AppColor.primaryColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 70.0,
                backgroundImage: NetworkImage(DummyConstants.dummyProfileImg),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                "Jorden William",
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              ),
              SizedBox(
                height: 12.0,
              ),
              drawerTab(title: "Home", icon: Icons.home, onClick: () {}),
              drawerTab(title: "Profile", icon: Icons.person, onClick: () {}),
              drawerTab(title: "Syllabus", icon: Icons.book, onClick: () {}),
              drawerTab(
                  title: "Settings", icon: Icons.settings, onClick: () {}),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            height: 40.0,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColor.primaryDarkColor,
                borderRadius: BorderRadius.circular(4.0)),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Row(
                children: [
                  Icon(
                    Icons.power_settings_new_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    "Logout",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget drawerTab({required icon, required title, required onClick}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 24.0,
              ),
              SizedBox(
                width: 6.0,
              ),
              Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget mainScreen(context) {
    return GetBuilder<ForumGetXController>(
      init: ForumGetXController(),
      builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 80.0),
                height: 80.0,
                decoration: BoxDecoration(color: AppColor.primaryLightColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Home",
                      style: TextStyle(
                          color: AppColor.primaryDarkColor,
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.notifications_outlined,
                          size: 32.0,
                          color: AppColor.primaryDarkColor,
                        ),
                        SizedBox(
                          width: 40.0,
                        ),
                        Icon(
                          Icons.person_outline_outlined,
                          size: 32.0,
                          color: AppColor.primaryDarkColor,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // onTapped!(index);
                          Beamer.of(context).beamToNamed('/details/${index}');
                        },
                        child: UserForumCard(
                            userForumModel: controller.data[index]),
                      );
                    }),
              )
            ],
          ),
        );
      },
    );
  }
}
