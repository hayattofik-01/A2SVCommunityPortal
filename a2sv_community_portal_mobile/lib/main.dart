import 'package:a2sv_community_portal_mobile/features/contest/presentation/pages/upcoming_and_recent_contest_page.dart';
import 'package:a2sv_community_portal_mobile/features/contest/presentation/bloc/bloc/previous_contests_bloc.dart';
import 'package:a2sv_community_portal_mobile/features/contest/presentation/bloc/bloc/upcoming_contests_bloc.dart';

import 'package:a2sv_community_portal_mobile/injections/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        // Add more bloc providers for other blocs if needed
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ContestPage(),
      ),
    );
  }
}
