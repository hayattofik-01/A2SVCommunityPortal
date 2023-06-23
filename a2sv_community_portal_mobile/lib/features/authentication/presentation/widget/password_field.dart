import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/media_query.dart';
// ignore: must_be_immutable
class PasswordField extends StatefulWidget {
  final  String title;
   final TextEditingController controller;
   final String? Function(String?)?  validator;
 const PasswordField({
    Key? key,
    required this.title ,
    required this.controller, this.validator

  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isPassword= true;

  @override
  Widget build(BuildContext context) {
 return Container(
      margin: EdgeInsets.symmetric(vertical: UIConverter.getComponentHeight(context, 10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
      
         
          TextFormField(
            controller: widget.controller,
            validator: widget.validator,
               obscureText: isPassword,
              decoration: InputDecoration(
                 contentPadding: EdgeInsets.symmetric(vertical:UIConverter.getComponentHeight(context, 25)),
                  border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none
          ),
                prefixIcon: const Icon(Icons.lock),
                labelText: widget.title,
                fillColor: inputColor,
                  filled: true, 
                suffixIcon: IconButton(
                  icon: Icon(isPassword? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                ),))
                  ,
        ],
      ),
    );
  }
  }

