import 'package:flutter/material.dart';
import 'package:very_cool_app/constants.dart';

class TipWidget extends StatelessWidget {

  var tip;
  TipWidget({this.tip='Here is a tip on how to conserve you water. Reduce your bill.'});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10.0,
        ),
        Image.asset('lib/assets/images/red-dot.png'),
       const SizedBox(
          height: 10.0,
        ),
        Text(tip,
          style: generalTextStyle(FontWeight.normal, 16.0),
        ),
       const  SizedBox(
          height: 10.0,
        ),
      const   Divider(
          color: mutedRed,
        )
      ],
    );
  }
}
