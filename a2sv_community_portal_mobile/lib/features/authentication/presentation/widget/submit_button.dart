import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/media_query.dart';

class SubmitButton extends StatelessWidget {
final String title;
  const SubmitButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
     return ElevatedButton(
       onPressed: () {  },
       child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: UIConverter.getComponentHeight(context, 15)),
        alignment: Alignment.center,
        // decoration: const BoxDecoration(
        //     borderRadius:  BorderRadius.all(Radius.circular(5)),
        //     boxShadow: <BoxShadow>[
        //       BoxShadow(
        //           color: grey,
        //           offset:Offset(2, 4),
        //           blurRadius: 5,
        //           spreadRadius: 2)
        //     ],
        //    color:  buttonColor),
        child: Text(
          title,
          style: TextStyle(fontFamily: 'Poppins',fontSize: UIConverter.textSize(context, 27), color: whiteColor),
        ),
         ),
         
     );
  }

}