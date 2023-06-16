import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/media_query.dart';
class PasswordField extends StatefulWidget {
  const PasswordField({
    Key? key,

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
                labelText: 'Password',
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

