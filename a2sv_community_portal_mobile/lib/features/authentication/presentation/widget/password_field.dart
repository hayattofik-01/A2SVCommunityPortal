import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/media_query.dart';
// ignore: must_be_immutable
class PasswordField extends StatefulWidget {
  final  String title;
 const PasswordField({
    Key? key,
    required this.title ,

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
      
          SizedBox(
            height: UIConverter.getComponentHeight(context, 10),
          ),
          TextField(
               obscureText: isPassword,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                labelText: widget.title,
                fillColor: inputColor,
                  filled: true, 
                    border: InputBorder.none,
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

