import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/media_query.dart';
import '../screens/signup_page.dart';

class AccountQuestion extends StatelessWidget {
final String question;
final String action;
  const AccountQuestion({super.key, required this.question,required this.action});
  
  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: EdgeInsets.symmetric(vertical:UIConverter.getComponentWidth(context, 20)),
       
        child: Row(
         
          children: <Widget>[
            Text(
             question,
              style: TextStyle(fontFamily: 'Poppins',fontSize: UIConverter.textSize(context, 18), fontWeight: FontWeight.w400,color: grey),
            ),
            SizedBox(
              width:UIConverter.getComponentWidth(context, 10),
            ),
            InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) =>  const SignUpPage()));
      },
            child: Text(
            action,
              style: TextStyle(
                fontFamily: 'Poppins',
                  color:blue,
                  fontSize: UIConverter.textSize(context, 18),
                  fontWeight: FontWeight.w600),
            ),)
          ],
        ),
      );
  }

    
  }
  
  