import 'package:a2sv_community_portal_mobile/core/utils/validation.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/content_box.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/edit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/utils/colors.dart';
import '../../domain/entities/user_entity.dart';
import '../bloc/profile_bloc.dart';
import '../widgets/title_bar.dart';
import 'package:file_picker/file_picker.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    Key? key,
    required this.user,
  }) : super(key: key);
  final UserEntity user;
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late final Map<String, TextEditingController> controllers;
  final _formkey = GlobalKey<FormState>();
  String fileName = "No file";
  String? cvPath;
  @override
  void initState() {
    super.initState();
    controllers = {
      'Full Name': TextEditingController(text: widget.user.fullName),
      'Country': TextEditingController(text: widget.user.country),
      'Phone Number': TextEditingController(text: widget.user.phoneNumber),
      'Email': TextEditingController(text: widget.user.email),
      'University': TextEditingController(text: widget.user.university),
      'Graduation Year': TextEditingController(
          text: widget.user.graduationYear?.toString() ?? ''),
      'Major': TextEditingController(text: widget.user.department),
      'LeetCode': TextEditingController(text: widget.user.leetCodeHandle),
      'CodeForces': TextEditingController(text: widget.user.codeforcesHandle),
      'Hacker Rank': TextEditingController(text: widget.user.hackerrankHandle),
      'GitHub': TextEditingController(text: widget.user.gitHubHandle),
      'Linkedin': TextEditingController(text: widget.user.linkedInHandle),
      'Telegram': TextEditingController(text: widget.user.telegramUsername),
      'Bio': TextEditingController(text: widget.user.shortBio),
      'Favorite Language':
          TextEditingController(text: widget.user.favoriteLanguage)
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Failed to save profile')),
              );
            } else if (state is ProfileSavedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Profile saved successfully')),
              );

              context.pop();
              context.read<ProfileBloc>().add(const GetProfileEvent());
            }
          },
          builder: (context, state) {
            return Form(
              key: _formkey,
              child: Stack(children: [
                Column(
                  children: [
                    TitleBar(
                      title: "Edit Profile",
                      iconName: "save_icon",
                      action: () {
                        if (_formkey.currentState!.validate()) {
                          final fullName =
                              controllers['Full Name']!.text.trim();
                          final country = controllers['Country']!.text.trim();
                          final phoneNumber =
                              controllers['Phone Number']!.text.trim();
                          final email = controllers['Email']!.text.trim();
                          final university =
                              controllers['University']!.text.trim();
                          final graduationYear = int.tryParse(
                              controllers['Graduation Year']!.text.trim());
                          final major = controllers['Major']!.text.trim();
                          final leetCode = controllers['LeetCode']!.text.trim();
                          final codeForces =
                              controllers['CodeForces']!.text.trim();
                          final hackerRank =
                              controllers['Hacker Rank']!.text.trim();
                          final gitHub = controllers['GitHub']!.text.trim();
                          final linkedin = controllers['Linkedin']!.text.trim();
                          final telegram = controllers['Telegram']!.text.trim();
                          final shortBio = controllers['Bio']!.text.trim();
                          final favoriteLanguage =
                              controllers['Favorite Language']!.text.trim();

                          final user = UserEntity(
                              fullName: fullName,
                              email: email,
                              telegramUsername: telegram,
                              codeforcesHandle: codeForces,
                              country: country,
                              phoneNumber: phoneNumber,
                              university: university,
                              department: major,
                              graduationYear: graduationYear,
                              leetCodeHandle: leetCode,
                              hackerrankHandle: hackerRank,
                              gitHubHandle: gitHub,
                              linkedInHandle: linkedin,
                              shortBio: shortBio,
                              cv: cvPath,
                              favoriteLanguage: favoriteLanguage);

                          context
                              .read<ProfileBloc>()
                              .add(EditProfileEvent(user: user));
                        }
                      },
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          EditCard(
                            bio: true,
                            boxHeight: 52.1,
                            title: "Info",
                            fieldList: const [
                              [
                                'Full Name',
                                'profile_icon',
                                Validator.validateName
                              ],
                              ['Country', 'flag_icon', Validator.noValidation],
                              [
                                'Phone Number',
                                'phone_icon',
                                Validator.validatePhoneNumber
                              ],
                              ['Email', 'email_icon', Validator.validateEmail],
                            ],
                            controllers: controllers,
                          ),
                          EditCard(
                            boxHeight: 30,
                            fieldList: const [
                              [
                                'University',
                                'school_icon',
                                Validator.noValidation
                              ],
                              [
                                'Graduation Year',
                                'school_icon',
                                Validator.noValidation
                              ],
                              ['Major', 'cap_icon', Validator.noValidation],
                            ],
                            title: "Education",
                            controllers: controllers,
                          ),
                          EditCard(
                            boxHeight: 37,
                            fieldList: const [
                              [
                                'LeetCode',
                                'leetcode_icon',
                                Validator.noValidation
                              ],
                              [
                                'CodeForces',
                                'codeforces_icon',
                                Validator.validateCodeforces
                              ],
                              [
                                'Hacker Rank',
                                'hacker_rank_icon',
                                Validator.noValidation
                              ],
                              ['GitHub', 'github_icon', Validator.noValidation],
                            ],
                            title: "Developer Handles",
                            controllers: controllers,
                          ),
                          EditCard(
                            fieldList: const [
                              [
                                'Linkedin',
                                'linkedin_icon',
                                Validator.noValidation
                              ],
                              [
                                'Telegram',
                                'telegram_icon',
                                Validator.validateUsername
                              ]
                            ],
                            title: "Socials",
                            boxHeight: 22.9,
                            controllers: controllers,
                          ),
                          EditCard(
                              fieldList: const [
                                [
                                  'Favorite Language',
                                  'code_icon',
                                  Validator.noValidation
                                ]
                              ],
                              title: 'Favorite Language',
                              boxHeight: 15,
                              controllers: controllers),
                          ContentBox(
                              boxHeight: 11,
                              child: Padding(
                                padding: EdgeInsets.all(1.6.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Resume',
                                      style: TextStyle(
                                          color: cardTitleColor,
                                          fontFamily: 'Urbanist',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15.5.sp),
                                    ),
                                    Row(
                                      children: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: primaryColor),
                                            onPressed: () async {
                                              final FilePickerResult? result =
                                                  await FilePicker.platform
                                                      .pickFiles(
                                                type: FileType.custom,
                                                allowedExtensions: ['pdf'],
                                              );
                                              if (result != null) {
                                                cvPath =
                                                    result.files.first.path!;
                                                setState(() {
                                                  fileName =
                                                      result.files.first.name;
                                                });
                                              }
                                            },
                                            child: Text("Choose PDF",
                                                style: TextStyle(
                                                    fontFamily: 'Urbanist',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15.5.sp))),
                                        SizedBox(
                                          width: 3.h,
                                        ),
                                        Text(
                                          fileName,
                                          style: TextStyle(
                                              fontFamily: 'Urbanist',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15.5.sp),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
                if (state is ProfileSavingState)
                  Container(
                    color: Colors.black54,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
              ]),
            );
          },
        ),
      ),
    );
  }
}
