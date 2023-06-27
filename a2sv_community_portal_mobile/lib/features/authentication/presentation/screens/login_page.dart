import 'package:a2sv_community_portal_mobile/features/authentication/presentation/screens/signup_page.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/presentation/widget/account_question.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/presentation/widget/snackbar.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/presentation/widget/submit_button.dart';
import 'package:a2sv_community_portal_mobile/main_Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/media_query.dart';

import '../../../../core/utils/validation.dart';
import '../bloc/login_bloc/login_bloc.dart';
import '../bloc/login_bloc/login_state.dart';
import '../widget/bezier_container.dart';
import '../widget/entry_field.dart';
import '../widget/password_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget _title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Login",
          style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: UIConverter.textSize(context, 30),
              fontWeight: FontWeight.w600),
        ),
        const AccountQuestion(
            question: 'Don\'t have an account ?',
            action: 'Sign up',
            page: SignUpPage()),
      ],
    );
  }

final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
     final passwordFocusNode = FocusNode();
  final emailFocusNode = FocusNode();

final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    

    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if(state is LoginFailure){
        CustomSnackBar.showError(context, state.exception);
        }
        else if (state is LoginSuccessfull){
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MyHomePage()));
        }
      },
      builder: (context, state) {
        if (state is LoginLoading){
          return   const SafeArea
          (child: Scaffold(body: Center(
            child:CircularProgressIndicator()
            )));
        }
        else{
        return SafeArea(
          child: Scaffold(
              body: SizedBox(
            height: height,
            child: Stack(
              children: <Widget>[
                Positioned(
                    top: -height * .15,
                    right: -MediaQuery.of(context).size.width * .4,
                    child: const BezierContainer()),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: UIConverter.getComponentWidth(context, 20.0)),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: height * .22),
                          _title(),
                          Column(
                            children: <Widget>[
                              EntryField(
                                controller: emailController, icon: Icons.email_outlined, label: 'Email', validator: Validator.validateEmail,
                                node:emailFocusNode
                              ),
                              PasswordField(
                                title: "Password",
                                controller: passwordController,
                                validator: Validator.validatePassword,
                              ),
                            ],
                          ),
                          SizedBox(
                              height:
                                  UIConverter.getComponentHeight(context, 20)),
                          Padding(
                            padding: EdgeInsets.only(
                                top: UIConverter.getComponentHeight(context, 50)),
                            child: SubmitButton(
                              title: 'Login',
                              emailC: emailController,
                              passC: passwordController,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
        );
      }
  });
  }
}
