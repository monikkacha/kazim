import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:project_beta/components/book_bank/add_book_screen.dart';
import 'package:project_beta/components/book_bank/book_bank.dart';
import 'package:project_beta/components/book_bank/book_bank_filter_screen.dart';
import 'package:project_beta/components/book_bank/select_category_screen.dart';
import 'package:project_beta/components/book_details/book_details_screen.dart';
import 'package:project_beta/components/draft/draft_screen.dart';
import 'package:project_beta/components/forum/widgets/detail_screen.dart';
import 'package:project_beta/components/landing/home_page.dart';
import 'package:project_beta/components/learning_zone/widgets/select_category.dart';
import 'package:project_beta/components/learning_zone_detail/learning_zone_detail.dart';
import 'package:project_beta/components/login_and_registration/create_account/create_account_screen.dart';
import 'package:project_beta/components/login_and_registration/create_new_password/create_new_password.dart';
import 'package:project_beta/components/login_and_registration/forgot_password/forgor_password_screen.dart';
import 'package:project_beta/components/login_and_registration/login/login_screen.dart';
import 'package:project_beta/components/login_and_registration/sign_up_as/sign_up_as.dart';
import 'package:project_beta/components/more_screen/more_screen.dart';
import 'package:project_beta/components/post/add_post_screen.dart';
import 'package:project_beta/components/profile/profile_screen.dart';
import 'package:project_beta/components/update_post/update_post_screen.dart';
import 'package:project_beta/constants/app_routes.dart';

final simpleLocationBuilder = SimpleLocationBuilder(
  routes: {
    '/': (context, state) => AddPostScreen(),
    // '/': (context, state) => LoginScreen(),
    // '/': (context, state) => CreateAccountScreen(),
    // '/': (context, state) => UserForumScreen(),
    // '/': (context, state) => UserForumScreen(),
    AppRoutes.home: (context, state) {
      return BeamPage(
        popToNamed: '/',
        type: BeamPageType.fadeTransition,
        child: HomePage(),
        key: ValueKey('Home'),
        title: 'Home',
      );
    },
    AppRoutes.signUpAs: (context, state) {
      return BeamPage(
        popToNamed: '/',
        type: BeamPageType.fadeTransition,
        child: SignUpAsScreen(),
        key: ValueKey('Sign Up As'),
        title: 'Sign Up As',
      );
    },
    AppRoutes.login: (context, state) {
      return BeamPage(
        popToNamed: '/',
        type: BeamPageType.fadeTransition,
        child: LoginScreen(),
        key: ValueKey('Login'),
        title: 'Login',
      );
    },
    AppRoutes.createAccount: (context, state) {
      return BeamPage(
        popToNamed: '/',
        type: BeamPageType.fadeTransition,
        child: CreateAccountScreen(),
        key: ValueKey('Create Account'),
        title: 'Create Account',
      );
    },
    AppRoutes.forgotPassword: (context, state) {
      return BeamPage(
        popToNamed: '/',
        type: BeamPageType.fadeTransition,
        child: ForgotPasswordScreen(),
        key: ValueKey('Forgot Password'),
        title: 'Forgot Password',
      );
    },
    AppRoutes.createNewPassword: (context, state) {
      return BeamPage(
        popToNamed: '/',
        type: BeamPageType.fadeTransition,
        child: CreateNewPassword(),
        key: ValueKey('Create new password'),
        title: 'Create new password',
      );
    },
    AppRoutes.profile: (context, state) {
      return BeamPage(
        popToNamed: '/',
        type: BeamPageType.fadeTransition,
        child: ProfileScreen(),
        key: ValueKey('Profile'),
        title: 'Profile',
      );
    },
    AppRoutes.bookBank: (context, state) {
      return BeamPage(
        popToNamed: '/',
        type: BeamPageType.fadeTransition,
        child: BookBankScreen(),
        key: ValueKey('Book Bank'),
        title: 'Book Bank',
      );
    },
    AppRoutes.selectCategory: (context, state) {
      return BeamPage(
        popToNamed: '/',
        type: BeamPageType.fadeTransition,
        child: SelectCategoryScreen(),
        key: ValueKey('Select Category'),
        title: 'Select Category',
      );
    },
    AppRoutes.bookBankFilter: (context, state) {
      return BeamPage(
        popToNamed: '/',
        type: BeamPageType.fadeTransition,
        child: BookBankFilterScreen(),
        key: ValueKey('Book Bank Filter'),
        title: 'Book Bank Filter',
      );
    },
    AppRoutes.addBook: (context, state) {
      return BeamPage(
        popToNamed: '/',
        type: BeamPageType.fadeTransition,
        child: AddBookScreen(),
        key: ValueKey('Add Book'),
        title: 'Add Book',
      );
    },
    AppRoutes.bookDetails: (context, state) {
      return BeamPage(
        popToNamed: '/',
        type: BeamPageType.fadeTransition,
        child: BookDetailsScreen(),
        key: ValueKey('Book Detail'),
        title: 'Book Detail',
      );
    },
    AppRoutes.more: (context, state) {
      return BeamPage(
        popToNamed: '/',
        type: BeamPageType.fadeTransition,
        child: MoreScreen(),
        key: ValueKey('More'),
        title: 'More',
      );
    },
    AppRoutes.addCertificate: (context, state) {
      return BeamPage(
        popToNamed: '/',
        type: BeamPageType.fadeTransition,
        child: LoginScreen(),
        key: ValueKey('Add Certificate'),
        title: 'Add Certificate',
      );
    },
    AppRoutes.learningZoneDetail: (context, state) {
      return BeamPage(
        popToNamed: '/',
        type: BeamPageType.fadeTransition,
        child: LearningZoneDetailScreen(),
        key: ValueKey('Detail'),
        title: 'Detail',
      );
    },
    AppRoutes.learningSelectCategory: (context, state) {
      return BeamPage(
        popToNamed: '/',
        type: BeamPageType.fadeTransition,
        child: LearningSelectCategoryScreen(),
        key: ValueKey('Select Category'),
        title: 'Select Category',
      );
    },
    AppRoutes.addPostScreen: (context, state) {
      return BeamPage(
        popToNamed: '/',
        type: BeamPageType.fadeTransition,
        child: AddPostScreen(),
        key: ValueKey('Add Post'),
        title: 'Add Post',
      );
    },
    AppRoutes.draftScreen: (context, state) {
      return BeamPage(
        popToNamed: '/',
        type: BeamPageType.fadeTransition,
        child: DraftScreen(),
        key: ValueKey('Drafts'),
        title: 'Saved Drafts',
      );
    },
    '/details/:id': (context, state) {
      final index = state.pathParameters['id']!;
      return BeamPage(
        popToNamed: '/',
        type: BeamPageType.fadeTransition,
        child: DetailScreen(int.parse(index)),
        key: ValueKey('book-$index'),
        title: 'A Book #$index',
      );
    },
    AppRoutes.updatePostScreen + '/:id': (context, state) {
      final id = state.pathParameters['id']!;
      return BeamPage(
        popToNamed: '/',
        type: BeamPageType.fadeTransition,
        child: UpdatePostScreen(id: id),
        key: ValueKey('Post'),
        title: 'Post',
      );
    }
  },
);
