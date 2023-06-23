import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/media_query.dart';


class EntryField  extends StatelessWidget {
  final String label;
final dynamic icon;
final TextEditingController controller;
final String? Function(String?)?  validator;
  const EntryField({super.key, required this.label,required this.icon, required this.controller, required this.validator});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: UIConverter.getComponentHeight(context, 10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
      
          // SizedBox(
          //   height: UIConverter.getComponentHeight(context, 1),
          // ),
          TextFormField(
              controller: controller,
             
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical:UIConverter.getComponentHeight(context, 20)),
                  fillColor:inputColor,
                  filled: true, prefixIcon: Icon(icon),
                labelText: label,
                 border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
           
                ), validator: validator,)
                  ,
        ],
      ),
    );
    
  }


}