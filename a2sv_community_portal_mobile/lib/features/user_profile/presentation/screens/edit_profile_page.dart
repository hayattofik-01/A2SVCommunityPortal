import 'package:a2sv_community_portal_mobile/core/utils/validation.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/content_box.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/edit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
                          final fullName = controllers['Full Name']!.text;
                          final country = controllers['Country']!.text;
                          final phoneNumber = controllers['Phone Number']!.text;
                          final email = controllers['Email']!.text;
                          final university = controllers['University']!.text;
                          final graduationYear = int.tryParse(
                              controllers['Graduation Year']!.text);
                          final major = controllers['Major']!.text;
                          final leetCode = controllers['LeetCode']!.text;
                          final codeForces = controllers['CodeForces']!.text;
                          final hackerRank = controllers['Hacker Rank']!.text;
                          final gitHub = controllers['GitHub']!.text;
                          final linkedin = controllers['Linkedin']!.text;
                          final telegram = controllers['Telegram']!.text;
                          final shortBio = controllers['Bio']!.text;
                          final favoriteLanguage =
                              controllers['Favorite Language']!.text;

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
                            boxHeight: 521,
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
                            boxHeight: 300,
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
                            boxHeight: 370,
                            fieldList: const [
                              [
                                'LeetCode',
                                'leetcode_icon',
                                Validator.validateNoSpace
                              ],
                              [
                                'CodeForces',
                                'codeforces_icon',
                                Validator.validateCodeforces
                              ],
                              [
                                'Hacker Rank',
                                'hacker_rank_icon',
                                Validator.validateNoSpace
                              ],
                              [
                                'GitHub',
                                'github_icon',
                                Validator.validateNoSpace
                              ],
                            ],
                            title: "Developer Handles",
                            controllers: controllers,
                          ),
                          EditCard(
                            fieldList: const [
                              [
                                'Linkedin',
                                'linkedin_icon',
                                Validator.validateNoSpace
                              ],
                              [
                                'Telegram',
                                'telegram_icon',
                                Validator.validateUsername
                              ]
                            ],
                            title: "Socials",
                            boxHeight: 229,
                            controllers: controllers,
                          ),
                          EditCard(
                              fieldList: const [
                                [
                                  'Favorite Language',
                                  'code_icon',
                                  Validator.validateNoSpace
                                ]
                              ],
                              title: 'Favorite Language',
                              boxHeight: 150,
                              controllers: controllers),
                          ContentBox(
                              boxHeight: 90,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Resume',
                                      style: TextStyle(
                                          color: cardTitleColor,
                                          fontFamily: 'Urbanist',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
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
                                            child: const Text("Choose PDF",
                                                style: TextStyle(
                                                    fontFamily: 'Urbanist',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16))),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                          fileName,
                                          style: const TextStyle(
                                              fontFamily: 'Urbanist',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
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
