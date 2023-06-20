import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/media_query.dart';


class EmailField extends StatelessWidget {
  const EmailField({super.key});

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
          const TextField(
              
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor:inputColor,
                  filled: true, prefixIcon: Icon(Icons.email),
                labelText: 'Email',))
                  ,
        ],
      ),
    );
  }

}