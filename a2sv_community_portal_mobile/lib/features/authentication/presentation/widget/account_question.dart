import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/media_query.dart';

class AccountQuestion extends StatelessWidget {
final String question;
final String action;
final dynamic page;
  const AccountQuestion({super.key, required this.question,required this.action,required this.page});
  
  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: EdgeInsets.symmetric(vertical:UIConverter.getComponentWidth(context, 20)),
       
        child: Row(
         
          children: <Widget>[
            Text(
             question,
              style: TextStyle(fontFamily: 'Poppins',fontSize: UIConverter.textSize(context, 16), fontWeight: FontWeight.w400,color: grey),
            ),
            SizedBox(
              width:UIConverter.getComponentWidth(context, 10),
            ),
            InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) =>  page));
      },
            child: Text(
            action,
              style: TextStyle(
                fontFamily: 'Poppins',
                  color:blue,
                  fontSize: UIConverter.textSize(context, 14),
                  fontWeight: FontWeight.w600),
            ),)
          ],
        ),
      );
  }

    
  }
  
  