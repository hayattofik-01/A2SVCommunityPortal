import 'package:a2sv_community_portal_mobile/features/application_page/presentation/bloc/application_bloc.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/presentation/screen/home.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/presentation/screens/login_page.dart';
import 'package:a2sv_community_portal_mobile/features/contest/presentation/pages/upcoming_and_recent_contest_page.dart';
import 'package:a2sv_community_portal_mobile/features/contest/presentation/bloc/bloc/previous_contests_bloc.dart';
import 'package:a2sv_community_portal_mobile/features/contest/presentation/bloc/bloc/upcoming_contests_bloc.dart';

import 'package:a2sv_community_portal_mobile/injections/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/authentication/presentation/bloc/login_bloc/login_bloc.dart';
import 'features/authentication/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';

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
        ),  BlocProvider<LoginBloc>(
            create: (_) => sl<LoginBloc>(),
          ),
          BlocProvider<SignUpBloc>(
            create: (_) => sl<SignUpBloc>(),
          ),
        // Add more bloc providers for other blocs if needed
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
