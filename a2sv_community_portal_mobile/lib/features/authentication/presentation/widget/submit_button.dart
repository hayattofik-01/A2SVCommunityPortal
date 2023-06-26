
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/media_query.dart';
import '../bloc/login_bloc/login_bloc.dart';
import '../bloc/login_bloc/login_state.dart';
import '../../../../injections/injection_container.dart' as di;
class SubmitButton extends StatelessWidget {
final String title;
final TextEditingController emailC;
final TextEditingController passC;
final LoginBloc loginBloc = di.sl<LoginBloc>();
   SubmitButton({super.key, required this.title,required this.emailC,required this.passC});

  @override
  Widget build(BuildContext context) {
    
     return BlocBuilder<LoginBloc, LoginState>(
      bloc:loginBloc,
        builder: (context, state) { 
          
          return ElevatedButton(
       onPressed: () { 

        BlocProvider.of<LoginBloc>(context).add(LoginPressed(email: emailC.text, password: passC.text));

        },
       child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: EdgeInsets.symmetric(vertical: UIConverter.getComponentHeight(context, 14)),
        alignment: Alignment.center,
        child: state is LoginLoading ?const CircularProgressIndicator() : Text(
          title,
          style: TextStyle(fontFamily: 'Poppins',fontSize: UIConverter.textSize(context, 16), color: whiteColor),
        ),
         ),
         
     );});
  }

}