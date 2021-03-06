import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:very_cool_app/constants.dart';

class CustomTextField extends StatefulWidget {
  var label;
  var keyboardType;
  var textField;



  CustomTextField({this.label= 'Name', this.keyboardType= TextInputType.text, this.textField });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {


  @override
  void dispose() {
   ///
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.label,
          style: generalTextStyle(FontWeight.normal, 16.0),),
        SizedBox(
            width: 10.0
        ),
         Flexible(
          child: Container(
            width: MediaQuery.of(context).size.width*0.6,
            height: MediaQuery.of(context).size.width*0.08,
            margin: EdgeInsets.symmetric(vertical: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: darkBlue,
            ),
            child: widget.textField ,
          ),

        )
      ],
    );
  }
}
