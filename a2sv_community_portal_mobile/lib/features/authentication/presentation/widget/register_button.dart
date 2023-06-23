import 'package:a2sv_community_portal_mobile/features/authentication/domain/entities/registration_payload.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/media_query.dart';

import '../bloc/sign_up_bloc/sign_up_bloc.dart';

class RegisterButton extends StatelessWidget {
  final String title;
  final TextEditingController emailC;
  final TextEditingController passC;
  final TextEditingController nameC;
  final TextEditingController telegramC;
  final TextEditingController codeforceC;
  final TextEditingController phoneC;
  final TextEditingController passwordC;
  final TextEditingController confirmC;
 final GlobalKey<FormState> formkey;

  const RegisterButton(
      {super.key,
      required this.title,
      required this.emailC,
      required this.passC,
      required this.nameC,
      required this.telegramC,
      required this.codeforceC,
      required this.phoneC,
      required this.passwordC,
      required this.confirmC, required this.formkey});
      

  @override
  Widget build(BuildContext context) {
  
    return ElevatedButton(
      onPressed: () {
        
        RegistrationPayload user = RegistrationPayload( fullName: nameC.text, email: emailC.text, telegram: telegramC.text, codeforces:codeforceC.text, password: passC.text, phoneNumber: phoneC.text, confirmPassword: confirmC.text);

    if (passC.text != confirmC.text){
ScaffoldMessenger.of(context).showSnackBar(
       const  SnackBar(content: Text('Please correct the errors in the form'),closeIconColor: Colors.red,),
    );}
 if ( formkey.currentState!.validate()) {
    BlocProvider.of<SignUpBloc>(context).add(
      SignUpButtonPressed(
       user:user
      ),
    );
  } else {
    // Show an error message that passwords don't match
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please correct the errors in the form'),closeIconColor: Colors.red,),
      );
    
  }

      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
            vertical: UIConverter.getComponentHeight(context, 10)),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: UIConverter.textSize(context, 16),
              color: whiteColor),
        ),
      ),
    );
  }
}
