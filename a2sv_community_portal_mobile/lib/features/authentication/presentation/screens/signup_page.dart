import 'package:a2sv_community_portal_mobile/features/authentication/presentation/widget/password_field.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/presentation/widget/submit_button.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/media_query.dart';
import '../widget/bezier_container.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key ?key, this.title}) : super(key: key);

  final String? title;

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  
  Widget _entryField(label,icon) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: UIConverter.getComponentHeight(context, 10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
      
          SizedBox(
            height: UIConverter.getComponentHeight(context, 5),
          ),
          TextField(
              
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical:UIConverter.getComponentHeight(context, 25)),
                  fillColor:inputColor,
                  filled: true, prefixIcon: Icon(icon),
                labelText: label,
                 border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none
          ),
                ))
                  ,
        ],
      ),
    );
  }


  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: UIConverter.getComponentHeight(context,20)),
    
        alignment: Alignment.bottomCenter,
        child: Row(
           children: <Widget>[
             Text(
              'Already have an account ?',
              style: TextStyle(fontFamily: 'Poppins',fontSize: UIConverter.textSize(context, 20), fontWeight: FontWeight.w400,color:grey),
            ),
            SizedBox(
              width: UIConverter.getComponentWidth(context,10),
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: blue ,
                  fontSize: UIConverter.textSize(context,18),
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
Padding(
  padding:EdgeInsets.only(bottom: UIConverter.getComponentHeight(context, 10)),
  child:   Text("Sign-up to ", style: TextStyle(fontFamily: 'Urbanist',fontSize: UIConverter.textSize(context, 30), fontWeight: FontWeight.w700),),
),
Text("A2SV community ", style: TextStyle(fontFamily: 'Urbanist ',fontSize: UIConverter.textSize(context, 30), fontWeight: FontWeight.w700),),
_loginAccountLabel(),
    ],);
  }
   


  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Full Name", Icons.person),
        _entryField("Email", Icons.email),
        _entryField("Phone Number", Icons.phone),
        _entryField("CodeForces Handle", Icons.bar_chart_outlined),
        _entryField("Telegram Handle", Icons.telegram),
        const PasswordField(title: "Password"),
        const PasswordField(title: "Confirm Password")

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
              padding: EdgeInsets.symmetric(horizontal: UIConverter.getComponentWidth(context,20)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .09),
                    _title(),
                    SizedBox(
                      height: UIConverter.getComponentHeight(context,15),
                    ),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: UIConverter.getComponentHeight(context,20),
                    ),
                   const SubmitButton(title:"Register"),
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