import 'package:a2sv_community_portal_mobile/core/network/network_info.dart';
import 'package:a2sv_community_portal_mobile/features/contest/data/datasources/contest_remote_datasource.dart';
import 'package:a2sv_community_portal_mobile/features/contest/data/repositories/contest_repository_impl.dart';
import 'package:a2sv_community_portal_mobile/features/contest/domain/usecases/get_past_contests.dart';
import 'package:a2sv_community_portal_mobile/features/contest/domain/usecases/get_upcoming_contests.dart';
import 'package:a2sv_community_portal_mobile/features/contest/presentation/bloc/bloc/previous_contests_bloc.dart';
import 'package:a2sv_community_portal_mobile/features/contest/presentation/bloc/bloc/upcoming_contests_bloc.dart';
import 'package:a2sv_community_portal_mobile/features/contest/presentation/widgets/previous_contests.dart';
import 'package:a2sv_community_portal_mobile/features/contest/presentation/widgets/upcoming_contests.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/upper_bar.dart';
import 'package:http/http.dart' as http;

class ContestPage extends StatelessWidget {
  final http.Client httpClient = http.Client();
  final InternetConnectionChecker internetConnectionChecker =
      InternetConnectionChecker();

  ContestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NetworkInfo networkInfo =
        NetworkInfoImpl(connectionChecker: internetConnectionChecker);

    final ContestRemoteDataSource contestRemoteDataSource =
        ContestRemoteDataSourceImpl(client: httpClient);

    final ContestRepositoryImpl contestRepository = ContestRepositoryImpl(
        networkInfo: networkInfo, remoteDataSource: contestRemoteDataSource);

    final GetPastContests getPreviousContests =
        GetPastContests(repository: contestRepository);
    final GetUpcomingContests getUpcomingContests =
        GetUpcomingContests(repository: contestRepository);

    return MultiBlocProvider(
      providers: [
        BlocProvider<UpcomingContestsBloc>(
            create: (context) =>
                UpcomingContestsBloc(getUpcomingContests: getUpcomingContests)
                  ..add(FetchUpcomingContests())),

        BlocProvider<PreviousContestsBloc>(
          create: (context) =>
              PreviousContestsBloc(getPreviousContests: getPreviousContests)
                ..add(FetchPreviousContests()),
        ),

        // Add more bloc providers for other blocs if needed
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1)),
        home: Scaffold(
          body: ListView(
            children: [
              UpperBar(),
              const SizedBox(height: 26),
              Container(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: const Text('Upcoming Contests',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(0, 0, 0, 0.92)))),
              const SizedBox(height: 26),
              UpcommingContests(),
              Container(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 16, bottom: 16),
                  child: const Text('Recent Contests',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(0, 0, 0, 0.92)))),
              const PreviousContests(),
              const SizedBox(
                height: 50,
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_max_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.code),
              label: 'Contest',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
        ),
      ),
      bottomNavigationBar: const MainBottomNavigationBar(),
    );
  }
}
