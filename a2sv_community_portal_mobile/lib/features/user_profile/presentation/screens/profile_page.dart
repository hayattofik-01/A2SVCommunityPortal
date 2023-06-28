import 'package:a2sv_community_portal_mobile/core/utils/widgets/bottom_bar.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/bio_card.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/developers_handel_card.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/education_card.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/socials_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/profile_bloc.dart';
import '../widgets/title_bar.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(const GetProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                TitleBar(
                  title: "Profile",
                  iconName: "edit_icon",
                  action: () {
                    if (state is ProfileLoadedState) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfilePage(
                                    user: state.user,
                                  )));
                    }
                  },
                ),
                if (state is ProfileLoadedState)
                  Expanded(
                    child: ListView(
                      children: [
                        BioCard(
                            name: state.user.fullName,
                            country: state.user.country ?? "Country",
                            email: state.user.email,
                            shortBio: state.user.shortBio ?? "No Bio",
                            resume: "some link",
                            phoneNumber: state.user.phoneNumber,
                            profilePicture: state.user.profilePicture ?? "No",
                            user: state.user),
                        EducationCard(
                          department:
                              state.user.department ?? "Unknown Department",
                          university:
                              state.user.university ?? "Unknown University",
                          graduationYear: state.user.graduationYear ?? 3333,
                        ),
                        DeveloperHandelCard(
                          codeforcesHandle: state.user.codeforcesHandle,
                          leetCodeHandle:
                              state.user.leetCodeHandle ?? "No Handle",
                          hackerrankHandle:
                              state.user.hackerrankHandle ?? "No Handle",
                          gitHubHandle: state.user.gitHubHandle ?? "No Handle",
                        ),
                        SocialCard(
                          telegramHandle: state.user.telegramUsername,
                          linkedInHandle:
                              state.user.linkedInHandle ?? "No Handle",
                        ),
                      ],
                    ),
                  ),
                if (state is UpLoadingState)
                  const Expanded(
                      child: Center(
                          child: Text(
                    'Uploading...',
                    style: TextStyle(fontFamily: 'Urbanist', fontSize: 20),
                  ))),
                if (state is ProfileLoadingState)
                  const Expanded(
                      child: Center(child: CircularProgressIndicator())),
                if (state is ProfileFailureState)
                  ElevatedButton(
                      onPressed: () {
                        context
                            .read<ProfileBloc>()
                            .add(const GetProfileEvent());
                      },
                      child: const Expanded(
                          child: Center(child: Text('Try again')))),
              ],
            ),
          ),
          bottomNavigationBar: const MainBottomNavigationBar(),
        );
      },
    );
  }
}
