import 'package:flutter/material.dart';
import 'package:very_cool_app/constants.dart';

class OptionCard extends StatelessWidget {
  var emoji;
  var option;

  OptionCard({this.emoji = 'bulb', this.option= 'View past transactions'});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *0.28,
      height: MediaQuery.of(context).size.width *0.3,
      margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: darkBlue,
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
          Flexible(
            child: Text('$option',
              textAlign: TextAlign.center,
              style: generalTextStyle(FontWeight.w400, 13.0),),
          )
        ],
      ),
    );
  }
}


