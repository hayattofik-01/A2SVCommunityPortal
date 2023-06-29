import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/media_query.dart';
// ignore: must_be_immutable
class PasswordField extends StatefulWidget {
  final  String title;
   final TextEditingController controller;
   final String? Function(String?)?  validator;
   final TextStyle estyle =  TextStyle(
  fontSize: 12.0, // Set the font size for the error text
  color: Colors.red[800], // Set the color for the error text
  fontWeight: FontWeight.bold, // Set the font weight for the error text
  fontStyle: FontStyle.italic, // Set the font style for the error text
  letterSpacing: 0.5, // Set the letter spacing for the error text
);
 PasswordField({
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
                
                errorStyle: widget.estyle,
                 contentPadding: EdgeInsets.symmetric(vertical:UIConverter.getComponentHeight(context, 25)),
                  border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none
          ),
                prefixIcon: const Icon(Icons.lock_outline),
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
                ),)),
                  
        ],
      ),
    );
  }
  }

