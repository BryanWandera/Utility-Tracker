import 'package:flutter/material.dart';
import 'package:very_cool_app/constants.dart';

class HomeRow extends StatelessWidget {
  var homeName;
  bool active = false;
  HomeRow({this.active=false, this.homeName='Home Name'});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width*0.12,
          height: MediaQuery.of(context).size.width*0.12,
          
          margin: EdgeInsets.symmetric(vertical: 14.0),
          decoration: BoxDecoration(
            color: active? activeGreen: darkBlue,
            borderRadius: BorderRadius.circular(5.0)
          ),
          child: Image.asset('lib/assets/emojis/house.png',
          
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width*0.03,
        ),
        Text(homeName,
          style: generalTextStyle(FontWeight.w500, 16.0),)
      ],
    );
  }
}
