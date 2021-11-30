import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_beta/network/api_service.dart';
import 'package:project_beta/src/common_widgets/app_button.dart';
import 'package:project_beta/src/extensions/common_extension.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/src/template/responsive.dart';
import 'package:project_beta/theme/app_theme.dart';

class ApiTestScreen extends StatelessWidget {
  const ApiTestScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: ApiTestMobile(),
      desktop: ApiTestMobile(),
      tablet: ApiTestMobile(),
    );
  }
}

class ApiTestMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Testing Api"),
      ),
      body: Container(
        child: GetBuilder<ApiTestGetXController>(
          init: ApiTestGetXController(),
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              child: ListView(
                children: [
                  AppButton(
                    height: 24.h,
                    label: 'CREATE',
                    onTap: () => controller.createPost(),
                    backgroundColor: AppColor.primaryColor,
                    textColor: AppColor.backgroundColor,
                    fontWeight: FontWeight.w500,
                  ).setMarginOnly(
                    bottom: 8.h,
                    top: 12.h,
                  ),
                  AppButton(
                    height: 24.h,
                    label: 'UPDATE',
                    onTap: () => controller.updatePost(),
                    backgroundColor: AppColor.primaryColor,
                    textColor: AppColor.backgroundColor,
                    fontWeight: FontWeight.w500,
                  ).setMarginOnly(
                    bottom: 8.h,
                    top: 12.h,
                  ),
                  AppButton(
                    height: 24.h,
                    label: 'DELETE',
                    onTap: () => controller.deletePost(),
                    backgroundColor: AppColor.primaryColor,
                    textColor: AppColor.backgroundColor,
                    fontWeight: FontWeight.w500,
                  ).setMarginOnly(
                    bottom: 8.h,
                    top: 12.h,
                  ),
                  AppButton(
                    height: 24.h,
                    label: 'GET POST SEARCH',
                    onTap: () => controller.postSearch(),
                    backgroundColor: AppColor.primaryColor,
                    textColor: AppColor.backgroundColor,
                    fontWeight: FontWeight.w500,
                  ).setMarginOnly(
                    bottom: 8.h,
                    top: 12.h,
                  ),
                  AppButton(
                    height: 24.h,
                    label: 'GET POST COMMENTS',
                    onTap: () => controller.postComments(),
                    backgroundColor: AppColor.primaryColor,
                    textColor: AppColor.backgroundColor,
                    fontWeight: FontWeight.w500,
                  ).setMarginOnly(
                    bottom: 8.h,
                    top: 12.h,
                  ),
                  AppButton(
                    height: 24.h,
                    label: 'GET POST ALL',
                    onTap: () => controller.getAllPosts(),
                    backgroundColor: AppColor.primaryColor,
                    textColor: AppColor.backgroundColor,
                    fontWeight: FontWeight.w500,
                  ).setMarginOnly(
                    bottom: 8.h,
                    top: 12.h,
                  ),
                  AppButton(
                    height: 24.h,
                    label: 'CREATE POST LIKE',
                    onTap: () => controller.likePost(),
                    backgroundColor: AppColor.primaryColor,
                    textColor: AppColor.backgroundColor,
                    fontWeight: FontWeight.w500,
                  ).setMarginOnly(
                    bottom: 8.h,
                    top: 12.h,
                  ),
                  AppButton(
                    height: 24.h,
                    label: 'IS VERIFIED',
                    onTap: () => controller.isVerified(),
                    backgroundColor: AppColor.primaryColor,
                    textColor: AppColor.backgroundColor,
                    fontWeight: FontWeight.w500,
                  ).setMarginOnly(
                    bottom: 8.h,
                    top: 12.h,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ApiTestGetXController extends GetxController {
  createPost() async {
    var data = {
      'category_id': '4',
      'subject': 'Testing Post',
      'description': 'This is the testing description',
      'hashTag': '#test #debug #code'
    };

    var response = await ApiService.addPostData(data: data);
    print(response.toString());
  }

  updatePost() async {
    var data = {
      'category_id': '4',
      'subject': 'Testing Post Updated',
      'description': 'This is the updated description',
      'hashTag': '#test #debug #code',
    };

    var id = 3;
    var response = await ApiService.updatePostData(data: data, id: id);
    print(response.toString());
  }

  deletePost() async {
    var id = 2;
    var response = await ApiService.deletePostData(id: id);
    print(response.toString());
  }

  postSearch() async {
    var data = {
      'hashTag': '#test',
      'category': '4',
      'subject': 'test',
    };
    var response = await ApiService.getPostSearch(data: data);
    print(response.toString());
  }

  postComments() async {
    var id = 1;
    var response = await ApiService.postComments(id: id);
    print(response.toString());
  }

  getAllPosts() async {
    var response = await ApiService.getAllPost();
    print(response.toString());
  }

  likePost() async {
    var data = {
      'module_type': 'posts',
      'post_id': '4',
      'user_id': '1',
    };
    var response = await ApiService.likePost(data: data);
    print(response.toString());
  }

  isVerified() async {
    var response = await ApiService.isVerified(id: "1");
    print(response.toString());
  }
}
