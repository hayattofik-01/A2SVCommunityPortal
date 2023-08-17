import 'package:a2sv_community_portal_mobile/features/announcement_page/presentation/screen/announcement.dart';
import 'package:a2sv_community_portal_mobile/features/routes/routes.dart';
import 'package:go_router/go_router.dart';

GoRouter getRoutes(authBloc) {
  return GoRouter(routes: <GoRoute>[
//     // GoRoute(path: Routes.HOME, builder: (context, state) => MainScreen()),
//     GoRoute(
//         path: Routes.HOME,
//         builder: (context, state) => ,
//         ),
//     GoRoute(
//       path: Routes.LOGIN,
//       builder: (context, state) => ,
//     ),
//     GoRoute(
//       path: Routes.SIGNUP,
//       builder: (context, state) => ,
//     ),
//     GoRoute(
//       path: Routes.SPLASH,
//       builder: (context, state) => ,
//     ),
//     GoRoute(
//       path: Routes.PROFILE,
//       builder: (context, state) => ,
//     ),
//     GoRoute(
//       path: Routes.EDITPROFILE,
//       builder: (context, state) => ,
//     ),

//     GoRoute(
//       path: Routes.NOTIFICATION,
//       builder: (context, state) => ,
//     ),
    GoRoute(
      path: Routes.ANNOUNCEMENTS,
      builder: (context, state) => AnnouncementPage(),
    ),
    GoRoute(
      path: Routes.ANNOUNCEMENTDETAILS,
      builder: (context, state) => AnnouncementPage(),
    ),
//     GoRoute(
//       path: Routes.CONTESTS,
//       builder: (context, state) => ,
//     ),
//     GoRoute(
//       path: Routes.CONTESTDETAILS,
//       builder: (context, state) =>  ,
//     ),
//         GoRoute(
//       path: Routes.CONTESTDETAILS,
//       builder: (context, state) =>  ,
//     ),
//         GoRoute(
//       path: Routes.PROGRESS,
//       builder: (context, state) =>  ,
//     ),
//         GoRoute(
//       path: Routes.APPLICATION,
//       builder: (context, state) =>  ,
//     ),
//         GoRoute(
//       path: Routes.APPLICATION1,
//       builder: (context, state) =>  ,
//     ),
  ]);
}
