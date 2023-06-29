import 'package:a2sv_community_portal_mobile/core/utils/confirmation_validator.dart';
import 'package:a2sv_community_portal_mobile/core/utils/validation.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/presentation/screens/login_page.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/presentation/widget/account_question.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/presentation/widget/password_field.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/presentation/widget/snackbar.dart';
import 'package:a2sv_community_portal_mobile/main_Home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/media_query.dart';
import '../widget/bezier_container.dart';
import '../widget/entry_field.dart';
import '../widget/register_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController telegramController = TextEditingController();
  final TextEditingController codeforceController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  final emailFocusNode = FocusNode();
  final nameFocusNode = FocusNode();
  final codeforceFocusNode = FocusNode();
  final telegramFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmFocusNode = FocusNode();

  String? validateEmail(String value) {
    // Check if the value is empty
    if (value.isEmpty) {
      return 'Email is required';
    }

    // Define the regular expression pattern
    const emailPattern = r'^[\\w-\\.]+@[\\w-]+(\\.[\\w-]+)*\$';

    // Create a regular expression object
    final regExp = RegExp(emailPattern);

    // Check if the value matches the pattern
    if (!regExp.hasMatch(value)) {
      return 'Invalid email format';
    }

    // Return null if the value is valid
    return null;
  }

  Widget _title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              bottom: UIConverter.getComponentHeight(context, 10)),
          child: Text(
            "Sign-up to ",
            style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: UIConverter.textSize(context, 30),
                fontWeight: FontWeight.w700),
          ),
        ),
        Text(
          "A2SV Community ",
          style: TextStyle(
              fontFamily: 'Urbanist ',
              fontSize: UIConverter.textSize(context, 30),
              fontWeight: FontWeight.w700),
        ),
        const AccountQuestion(
          question: 'Already have an account ?',
          action: 'Login',
          page: LoginPage(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return BlocConsumer<SignUpBloc, SignUpState>(listener: (context, state) {
      if (state is SignUpFailure) {
        CustomSnackBar.showError(context, state.error);
      } else if (state is SignUpSuccess) {
    
        GoRouter.of(context).go('/home');
      }
    }, builder: (context, state) {
      if (state is SignUpLoading) {
        return const SafeArea(
            child: Scaffold(body: Center(child: CircularProgressIndicator())));
      } else {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              height: height,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -MediaQuery.of(context).size.height * .15,
                    right: -MediaQuery.of(context).size.width * .4,
                    child: const BezierContainer(),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: UIConverter.getComponentWidth(context, 20)),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: height * .09),
                          _title(),
                          SizedBox(
                            height: UIConverter.getComponentHeight(context, 15),
                          ),
                          Form(
                            child: Form(
                              key: formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Column(
                                children: <Widget>[
                                  EntryField(
                                      label: "Full Name",
                                      icon: Icons.person,
                                      controller: nameController,
                                      validator: Validator.validateName,
                                      node: nameFocusNode),
                                  EntryField(
                                    label: "Email",
                                    icon: Icons.email,
                                    controller: emailController,
                                    validator: Validator.validateEmail,
                                    node: emailFocusNode,
                                  ),
                                  EntryField(
                                    label: "Phone Number",
                                    icon: Icons.phone,
                                    controller: phoneController,
                                    validator: Validator.validatePhoneNumber,
                                    node: phoneFocusNode,
                                  ),
                                  EntryField(
                                    label: "CodeForces Handle",
                                    icon: Icons.bar_chart_outlined,
                                    controller: codeforceController,
                                    validator: Validator.validateUsername,
                                    node: codeforceFocusNode,
                                  ),
                                  EntryField(
                                    label: "Telegram Handle",
                                    icon: Icons.telegram,
                                    controller: telegramController,
                                    validator: Validator.validateUsername,
                                    node: telegramFocusNode,
                                  ),
                                  PasswordField(
                                    title: "Password",
                                    controller: passwordController,
                                    validator: Validator.validatePassword,
                                  ),
                                  SizedBox(
                                      height: UIConverter.getComponentHeight(
                                          context, 5)),
                                  const Text(
                                      '*The password needs to have a minimum length of 8 characters and include at least one uppercase letter and one lowercase letter.',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      )),
                                  PasswordField(
                                      title: "Confirm Password",
                                      controller: confirmPasswordController,
                                      validator: (value) =>
                                          PasswordConfirmationValidator
                                              .validate(
                                                  passwordController.text,
                                                  confirmPasswordController
                                                      .text))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  UIConverter.getComponentHeight(context, 5)),
                          const Text(
                              '*The password needs to have a minimum length of 8 characters and include at least one uppercase letter and one lowercase letter.',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              )),
                          SizedBox(
                            height: UIConverter.getComponentHeight(context, 20),
                          ),
                          RegisterButton(
                              title: "Sign up",
                              emailC: emailController,
                              passC: passwordController,
                              nameC: nameController,
                              telegramC: telegramController,
                              codeforceC: codeforceController,
                              phoneC: phoneController,
                              passwordC: passwordController,
                              confirmC: confirmPasswordController,
                              formkey: formKey),
                          SizedBox(height: height * .14),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
