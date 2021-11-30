import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_beta/constants/app_icons.dart';
import 'package:project_beta/src/common_widgets/app_list_tyle.dart';
import 'package:project_beta/src/extensions/common_extension.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/theme/app_theme.dart';

class SliverAppBarTemplate extends StatelessWidget {
  final double expandedHeight;
  final String title;
  final String subTitle;
  final Widget body;
  final double? fontSize;
  final double? subTitleFontSize;
  final double? bottomHeight;
  final Widget? trailingWidget;
  final Color backgroundColor;
  final bool trialWidgetEnabled;

  const SliverAppBarTemplate({
    this.expandedHeight: 0,
    this.title: '',
    this.subTitle: '',
    required this.body,
    this.backgroundColor: AppColor.primaryColor,
    this.trailingWidget,
    this.fontSize,
    this.trialWidgetEnabled: false,
    this.subTitleFontSize,
    this.bottomHeight: 4,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: expandedHeight,
              pinned: true,
              elevation: 5,
              floating: true,
              leading: Container(),
              backgroundColor: backgroundColor,
              flexibleSpace: Stack(
                children: [
                  Container(
                    color: AppColor.primaryColor,
                    child: FlexibleSpaceBar(
                      centerTitle: true,
                      collapseMode: CollapseMode.parallax,
                      titlePadding: EdgeInsets.zero,
                      title: trialWidgetEnabled == false
                          ? AppListTile(
                              title: title,
                              subTitle: subTitle,
                              titleTextStyle: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    color: AppColor.backgroundColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: fontSize,
                                  ),
                              subTitleTextStyle: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                    color: AppColor.backgroundColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: subTitleFontSize,
                                  ),
                            ).setMarginOnly(
                              top: 16.h,
                              bottom: 4.h,
                            )
                          : Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                          color: AppColor.backgroundColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: fontSize,
                                        ),
                                  ),
                                ),
                                trailingWidget!,
                              ],
                            ).setMarginOnly(
                              right: 24.w,
                              left: 24.w,
                              bottom: bottomHeight!.h,
                            ),
                    ).setMarginOnly(
                      top: 22.h,
                    ),
                  )
                ],
              ),
            ),
          ];
        },
        body: Stack(
          children: [
            Container(
              color: AppColor.primaryColor,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 4.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(64.w),
                  topRight: Radius.circular(64.w),
                ),
                color: AppColor.backgroundColor,
              ),
              child: body,
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarTemplate extends StatelessWidget {
  final double? toolbarHeight;
  final double? elevation;
  final Widget? suffixWidget;
  final Widget? body;
  final String? title;
  final bool? isDrawer;
  final bool? centerTitle;
  final Color? backGroundColor;
  final Widget? drawerWidget;
  final Widget? floatingActionButton;

  const AppBarTemplate({
    this.toolbarHeight: 32,
    this.elevation,
    this.title,
    this.suffixWidget,
    this.isDrawer: false,
    this.body,
    this.drawerWidget,
    this.backGroundColor,
    this.centerTitle: true,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      backgroundColor: backGroundColor,
      drawer: isDrawer == true
          ? Drawer(
              child: drawerWidget,
            )
          : SizedBox(),
      appBar: AppBar(
        elevation: 0.7,
        centerTitle: centerTitle,
        toolbarHeight: toolbarHeight!.h,
        toolbarOpacity: 1,
        backgroundColor: backGroundColor,
        title: Text(
          title!,
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w700,
              ),
        ),
        leading: isDrawer == true
            ? Builder(
                builder: (context) {
                  return IconButton(
                    icon: Icon(
                      AppIcons.burgerIcon,
                      color: AppColor.primaryColor,
                      size: 24.w,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  ).setMarginOnly(
                    left: 24.w,
                  );
                },
              )
            : IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColor.primaryColor,
                  size: 28.w,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ).setMarginOnly(
                left: 24.w,
              ),
        actions: [suffixWidget!],
      ),
      body: body,
    );
  }
}
