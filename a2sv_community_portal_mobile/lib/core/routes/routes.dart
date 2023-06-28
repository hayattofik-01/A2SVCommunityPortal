import 'package:a2sv_community_portal_mobile/features/authentication/presentation/screens/login_page.dart';
import 'package:a2sv_community_portal_mobile/features/contest/domain/entities/contest.dart';
import 'package:a2sv_community_portal_mobile/features/contest/presentation/pages/contest_detail.dart';
import 'package:a2sv_community_portal_mobile/features/contest/presentation/pages/upcoming_and_recent_contest_page.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/presentation/pages/notifications_page.dart';
import 'package:a2sv_community_portal_mobile/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:a2sv_community_portal_mobile/features/splash/presentation/pages/splash_page.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/domain/entities/user_entity.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/screens/edit_profile_page.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/screens/profile_page.dart';
import 'package:a2sv_community_portal_mobile/main_Home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRouter routes() => GoRouter(
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) =>
              const MaterialPage(child: SplashScreen()),
        ),

        GoRoute(
          path: '/home',
          pageBuilder: (context, state) =>
              const MaterialPage(child: MyHomePage()),
        ),

        GoRoute(
          path: '/home/notifications',
          pageBuilder: (context, state) =>
              MaterialPage(child: NotificationPage()),
        ),

        GoRoute(
          path: '/onboarding',
          pageBuilder: (context, state) =>
              MaterialPage(child: OnboardingPage()),
        ),
        GoRoute(
          path: '/login',
          pageBuilder: (context, state) =>
              const MaterialPage(child: LoginPage()),
        ),

        GoRoute(
          path: '/profile',
          pageBuilder: (context, state) =>
              const MaterialPage(child: ProfilePage()),
        ),

        GoRoute(
          path: '/profile/editProfile',
          pageBuilder: (context, state) => MaterialPage(
              child: EditProfilePage(
            user: state.extra as UserEntity,
          )),
        ),

        GoRoute(
          path: '/contests',
          pageBuilder: (context, state) => MaterialPage(child: ContestPage()),
        ),

        GoRoute(
          path: '/contests/notifications',
          pageBuilder: (context, state) =>
              MaterialPage(child: NotificationPage()),
        ),

        GoRoute(
            path: '/contests/detail',
            pageBuilder: (context, state) {
              final contests = state.extra as Contest;
              return MaterialPage(
                  child: ContestDetails(
                contest: contests,
              ));
            }),

        // Add more routes for other pages if needed
      ],
      // errorPageBuilder: (context, state) => ErrorPage()ilder: (context, state) => ErrorPage()
    );
