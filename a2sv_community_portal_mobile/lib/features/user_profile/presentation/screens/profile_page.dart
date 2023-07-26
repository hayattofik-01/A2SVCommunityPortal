import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/bio_card.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/developers_handel_card.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/education_card.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/socials_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/profile_bloc.dart';
import '../widgets/title_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is UploadingFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Failed To update your Profile Picture')),
          );
        }
        if (state is UpLoadedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Updated your Profile Picture')),
          );
        }
        if (state is ProfileFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to laod your profile')),
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: whiteColor,
            body: SafeArea(
              child: Column(
                children: [
                  TitleBar(
                    title: "Profile",
                    iconName: "edit_icon",
                    action: () {
                      if (state is ProfileLoadedState) {
                        context.push('/profile/editProfile', extra: state.user);
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
                            gitHubHandle:
                                state.user.gitHubHandle ?? "No Handle",
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
                    Expanded(
                        child: Center(
                            child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Uploading',
                          style: TextStyle(
                              fontFamily: 'Urbanist', fontSize: 20.sp),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const SpinKitThreeBounce(
                          size: 25,
                          color: Colors.black,
                        )
                      ],
                    ))),
                  if (state is ProfileLoadingState)
                    const Expanded(
                        child: Center(child: CircularProgressIndicator())),
                  if (state is ProfileFailureState)
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            context
                                .read<ProfileBloc>()
                                .add(const GetProfileEvent());
                          },
                          child: Center(
                              child: Text(
                            'Reload',
                            style: TextStyle(
                                fontFamily: 'Urbanist',
                                fontSize: 24.sp,
                                color: primaryColor),
                          ))),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
