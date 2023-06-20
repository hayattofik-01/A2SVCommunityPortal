
import 'package:a2sv_community_portal_mobile/features/authentication/presentation/screens/signup_page.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/presentation/widget/account_question.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/presentation/widget/email_field.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/presentation/widget/submit_button.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/media_query.dart';
import '../widget/bezier_container.dart';
import '../widget/password_field.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  
  
  Widget _emailPasswordWidget() {

    return Column(
      children: const <Widget>[
        EmailField(),
      PasswordField(title: "Password"),
      ],
    );
  }
  
  
  Widget _title() {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
Text("Login", style: TextStyle(fontFamily: 'Urbanist',fontSize: UIConverter.textSize(context, 35), fontWeight: FontWeight.w600),),
const AccountQuestion(question: 'Don\'t have an account ?', action: 'Sign up',page:SignUpPage()),
    ],);
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
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
              padding: EdgeInsets.symmetric(horizontal: UIConverter.getComponentWidth(context,20.0)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    _emailPasswordWidget(),
                    SizedBox(height: UIConverter.getComponentHeight(context, 20)),
                    Padding(
                      padding: EdgeInsets.only(top:UIConverter.getComponentHeight(context, 50)),
                      child:const SubmitButton(title: 'Login'),
                    ),
                    
                    
                  ],
                ),
              ),
            ),
         
          ],
        ),
      )),
    );
  }
}