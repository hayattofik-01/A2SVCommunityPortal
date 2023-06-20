import 'package:a2sv_community_portal_mobile/features/authentication/presentation/widget/account_question.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/presentation/widget/entry_field.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/presentation/widget/password_field.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/presentation/widget/submit_button.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/media_query.dart';
import '../widget/bezier_container.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
          "A2SV community ",
          style: TextStyle(
              fontFamily: 'Urbanist ',
              fontSize: UIConverter.textSize(context, 30),
              fontWeight: FontWeight.w700),
        ),
        const AccountQuestion(
            question: 'Already have an account ?', action: 'Login'),
      ],
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: const <Widget>[
        EntryField(label: "Full Name", icon: Icons.person),
        EntryField(label: "Email", icon: Icons.email),
        EntryField(label: "Phone Number", icon: Icons.phone),
        EntryField(
            label: "CodeForces Handle", icon: Icons.bar_chart_outlined),
        EntryField(label: "Telegram Handle", icon: Icons.telegram),
        PasswordField(title: "Password"),
        PasswordField(title: "Confirm Password")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                    _emailPasswordWidget(),
                    SizedBox(
                      height: UIConverter.getComponentHeight(context, 20),
                    ),
                    const SubmitButton(title: "Register"),
                    SizedBox(height: height * .14),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
