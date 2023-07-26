import 'package:a2sv_community_portal_mobile/features/announcement_page/presentation/bloc/announcement_bloc.dart';
import 'package:a2sv_community_portal_mobile/core/routes/routes.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/presentation/bloc/application_bloc.dart';
import 'package:a2sv_community_portal_mobile/features/contest/presentation/bloc/bloc/previous_contests_bloc.dart';
import 'package:a2sv_community_portal_mobile/features/contest/presentation/bloc/bloc/upcoming_contests_bloc.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/presentation/bloc/notification_bloc.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/bloc/profile_bloc.dart';

import 'package:a2sv_community_portal_mobile/injections/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/authentication/presentation/bloc/login_bloc/login_bloc.dart';
import 'features/authentication/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UpcomingContestsBloc>(
          create: (_) =>
              sl<UpcomingContestsBloc>()..add(FetchUpcomingContestsEvent()),
        ),
        BlocProvider<PreviousContestsBloc>(
          create: (_) =>
              sl<PreviousContestsBloc>()..add(FetchPreviousContestsEvent()),
        ),
        BlocProvider<ApplicationBloc>(
          create: (_) => sl<ApplicationBloc>()..add(FetchDataEvent()),
        ),
        BlocProvider<LoginBloc>(
          create: (_) => sl<LoginBloc>(),
        ),
        BlocProvider<SignUpBloc>(
          create: (_) => sl<SignUpBloc>(),
        ),

        BlocProvider<AnnouncementBloc>(
          create: (_) => sl<AnnouncementBloc>()..add(GetAnnouncementEvent()),
        ),
        BlocProvider<NotificationBloc>(
          create: (_) => sl<NotificationBloc>()..add(GetNotificationsEvent()),
        ),
        // Add more bloc providers for other blocs if needed
        BlocProvider<ProfileBloc>(
          create: (context) => sl<ProfileBloc>(),
        )
      ],
      child: ResponsiveSizer(builder: (context, orientation, screenType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: routes(),
        );
      }),
    );
  }
}
