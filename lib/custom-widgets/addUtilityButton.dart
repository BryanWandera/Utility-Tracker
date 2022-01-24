import 'package:flutter/material.dart';
import 'package:very_cool_app/constants.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AddUtilityButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *0.24,
      height: MediaQuery.of(context).size.width *0.28,
      margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: mutedRed,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            PhosphorIcons.plus,
            color: lightPurple,
            size: 40,
          ),
          SizedBox(
            height:MediaQuery.of(context).size.width *0.03 ,
          ),
          Text('Add',
            style: generalTextStyle(FontWeight.w400, 13.0),)
        ],
      ),
    );;
  }
}
