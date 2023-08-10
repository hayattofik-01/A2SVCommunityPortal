import 'package:a2sv_community_portal_mobile/features/authentication/presentation/widget/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/media_query.dart';

import '../bloc/login_bloc/login_bloc.dart';
import '../bloc/login_bloc/login_state.dart';

class SubmitButton extends StatelessWidget {
  final String title;
  final TextEditingController emailC;
  final TextEditingController passC;
  const SubmitButton(
      {super.key,
      required this.title,
      required this.emailC,
      required this.passC});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
      if (state is LoginFailure) {
        CustomSnackBar.showError(context, state.exception);
      } else if (state is LoginSuccessfull) {
        context.go("/home");
      }
    }, builder: (context, state) {
      return ElevatedButton(
        onPressed: () {
          BlocProvider.of<LoginBloc>(context)
              .add(LoginPressed(email: emailC.text, password: passC.text));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(360.0),
          ),
          width: MediaQuery.of(context).size.width * 0.9,
          padding: EdgeInsets.symmetric(
              vertical: UIConverter.getComponentHeight(context, 20)),
          alignment: Alignment.center,
          child: state is LoginLoading
              ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: UIConverter.getComponentWidth(context, 20)),
                    child: const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                  Text('Logging in...',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: UIConverter.textSize(context, 16),
                          color: whiteColor))
                ])
              : Text(
                  title,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: UIConverter.textSize(context, 16),
                      color: whiteColor),
                ),
        ),
      );
    });
  }
}
