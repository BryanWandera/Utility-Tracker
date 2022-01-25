import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:very_cool_app/constants.dart';

class CustomTextField extends StatelessWidget {
  var label;
  CustomTextField({this.label= 'Name'});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
          style: generalTextStyle(FontWeight.normal, 16.0),),
        SizedBox(
            width: 10.0
        ),
        Flexible(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.width * 0.08,
            margin: EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              color: darkBlue,
              borderRadius: BorderRadius.circular(5.0),

            ),
          ),
        )
      ],
    );
  }
}
