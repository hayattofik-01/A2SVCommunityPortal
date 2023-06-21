import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/media_query.dart';


class EntryField  extends StatelessWidget {
  final String label;
final dynamic icon;
  const EntryField({super.key, required this.label,required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: UIConverter.getComponentHeight(context, 10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
      
          SizedBox(
            height: UIConverter.getComponentHeight(context, 5),
          ),
          TextField(
              
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical:UIConverter.getComponentHeight(context, 25)),
                  fillColor:inputColor,
                  filled: true, prefixIcon: Icon(icon),
                labelText: label,
                 border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none
          ),
                ))
                  ,
        ],
      ),
    );
    
  }


}