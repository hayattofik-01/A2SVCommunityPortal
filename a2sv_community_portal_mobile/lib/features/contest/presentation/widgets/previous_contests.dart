import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:a2sv_community_portal_mobile/core/utils/format_date_and_time.dart';
import 'package:a2sv_community_portal_mobile/features/contest/presentation/bloc/bloc/previous_contests_bloc.dart';
import 'package:a2sv_community_portal_mobile/features/contest/presentation/widgets/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreviousContests extends StatelessWidget {
  const PreviousContests({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreviousContestsBloc, PreviousContestsState>(
      builder: (context, state) {
        if (state is PreviousContestsLoading) {
          return Container(
            alignment: Alignment.center,
            width: 50,
            height: 50,
            child: const CircularProgressIndicator(),
          );
        } else if (state is PreviousContestsLoaded) {
          if (state.previousContests.isEmpty) {
            return Container(
              padding: const EdgeInsets.only(top: 50),
              child: const Center(
                child: Text(
                  "No Recent Contests",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: greyTextColor),
                ),
              ),
            );
          } else {
            return Column(
              children: <Widget>[
                for (var contest in state.previousContests)
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: CustomListTile(
                      header: contest.title,
                      date: formatDateAndTime(contest.date)['date'] ?? "",
                      time: formatDateAndTime(contest.date)['time'] ?? "",
                    ),
                  )
              ],
            );
          }
        } else if (state is PreviousContestsError) {
          return Text(state.message);
        } else {
          return Container();
        }
      },
    );
  }
}
