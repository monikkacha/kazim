import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_beta/components/book_bank/book_bank_filter_screen.dart';
import 'package:project_beta/components/draft/draft_screen.dart';
import 'package:project_beta/components/landing/home_page.dart';
import 'package:project_beta/components/login_and_registration/create_account/create_account_screen.dart';
import 'package:project_beta/components/login_and_registration/create_new_password/create_new_password.dart';
import 'package:project_beta/components/login_and_registration/forgot_password/forgor_password_screen.dart';
import 'package:project_beta/components/login_and_registration/login/login_screen.dart';
import 'package:project_beta/components/login_and_registration/verification/verification_screen.dart';
import 'package:project_beta/components/more_screen/more_screen.dart';
import 'package:project_beta/components/profile/profile_screen.dart';
import 'package:project_beta/db/draft_data.dart';
import 'package:project_beta/network/api_service.dart';
import 'package:project_beta/services/draft/draft_getx_controller.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/utils/shared_preference_local_storage.dart';

import 'api_test_screen.dart';
import 'components/book_bank/add_book_screen.dart';
import 'components/book_bank/book_bank.dart';
import 'components/book_bank/select_category_screen.dart';
import 'components/book_details/book_details_screen.dart';
import 'components/learning_zone/widgets/learning_zone_mobile_screen.dart';
import 'components/login_and_registration/sign_up_as/sign_up_as.dart';
import 'components/post/add_post_screen.dart';
import 'constants/route_and_navigation.dart';
import 'package:project_beta/route/router_delegate.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'auth/google_authentication.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class GlobalVariable {
  static final GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    init();
    return LayoutBuilder(
      builder: (context, constraints) {
        ScreenUtils.init(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
        );

        // return GetMaterialApp(0.
        //   title: 'Project Beta',
        //   debugShowCheckedModeBanner: false,
        //   theme: AppTheme.init(context),
        //   color: AppColor.backgroundColor,
        //   home: LearningZoneMobileScreen(),
        //   initialRoute: '/',
        //   onGenerateRoute: RouteGenerator.generateRoute,
        //   navigatorKey: GlobalVariable.navState,
        // );

        // return GetMaterialApp.router(
        //     title: 'Project Beta',
        //     debugShowCheckedModeBanner: false,
        //     theme: AppTheme.init(context),
        //     color: AppColor.backgroundColor,
        //     routeInformationParser: BeamerParser(),
        //     routerDelegate:
        //         BeamerDelegate(locationBuilder: simpleLocationBuilder));

        return GetMaterialApp(
          title: 'Project Beta',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.init(context),
          color: AppColor.backgroundColor,
          home: ApiTestScreen(),
          initialRoute: '/',
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorKey: GlobalVariable.navState,
        );
      },
    );
  }

  // home: DraftScreen(),

  void init() async {
    await DraftDatabase.init();
    await SharedPreferenceLocalStorage.init();
    GoogleAuthentication.initializeFirebase();
    ApiService.getAuthToken();
  }
}
