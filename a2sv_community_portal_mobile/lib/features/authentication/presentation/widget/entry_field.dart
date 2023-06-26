import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/media_query.dart';


// ignore: must_be_immutable
class EntryField  extends StatelessWidget {
  final String label;
final dynamic icon;
final TextEditingController controller;
 final formKey = GlobalKey<FormState>();
 FocusNode node = FocusNode();
final TextStyle estyle =  TextStyle(
  fontSize: 12.0, // Set the font size for the error text
  color: Colors.red[800], // Set the color for the error text
  fontWeight: FontWeight.bold, // Set the font weight for the error text
  fontStyle: FontStyle.italic, // Set the font style for the error text
  letterSpacing: 0.5, // Set the letter spacing for the error text
);
final String? Function(String?)?  validator;
   EntryField({super.key, required this.label,required this.icon, required this.controller, required this.validator,required this.node});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: UIConverter.getComponentHeight(context, 10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
      
          TextFormField(
              controller: controller,
             onFieldSubmitted: (value) {
       node.unfocus();
        node.requestFocus();
      },
      focusNode: node,
             
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical:UIConverter.getComponentHeight(context, 20)),
                  fillColor:inputColor,
                  filled: true, prefixIcon: Icon(icon),
                  errorStyle: estyle,
                  
  
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