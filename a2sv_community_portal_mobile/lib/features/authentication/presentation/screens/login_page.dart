import 'package:a2sv_community_portal_mobile/features/authentication/presentation/screens/signup_page.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/presentation/widget/submit_button.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';
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

  Widget _emailField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: UIConverter.getComponentHeight(context, 10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
      
          SizedBox(
            height: UIConverter.getComponentHeight(context, 10),
          ),
          const TextField(
              
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor:inputColor,
                  filled: true, prefixIcon: Icon(Icons.email),
                labelText: 'Email',))
                  ,
        ],
      ),
    );
  }
  
  Widget _emailPasswordWidget() {

    return Column(
      children: <Widget>[
        _emailField(),
      const PasswordField(title: "Password"),
      ],
    );
  }
  
  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) =>  const SignUpPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical:UIConverter.getComponentWidth(context, 20)),
       
        child: Row(
         
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontFamily: 'Poppins',fontSize: UIConverter.textSize(context, 18), fontWeight: FontWeight.w400,color: grey),
            ),
            SizedBox(
              width:UIConverter.getComponentWidth(context, 10),
            ),
            Text(
              'signup',
              style: TextStyle(
                fontFamily: 'Poppins',
                  color:blue,
                  fontSize: UIConverter.textSize(context, 18),
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
Text("Login", style: TextStyle(fontFamily: 'Urbanist',fontSize: UIConverter.textSize(context, 35), fontWeight: FontWeight.w600),),
_createAccountLabel(),
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