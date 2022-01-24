import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:very_cool_app/constants.dart';

class BigUtilityButton extends StatelessWidget {
  var buttonColor;
  var utilityName;
  var emoji;
  BigUtilityButton({this.buttonColor = darkBlue,this.emoji= 'battery', this.utilityName = 'Utility'});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *0.24,
      height: MediaQuery.of(context).size.width *0.28,
      margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: buttonColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('lib/assets/emojis/$emoji.png',
          width: MediaQuery.of(context).size.width *0.12,
          ),
          SizedBox(
            height:MediaQuery.of(context).size.width *0.03 ,
          ),
          Text('$utilityName',
          style: generalTextStyle(FontWeight.w400, 13.0),)
        ],
      ),
    );
  }
}
