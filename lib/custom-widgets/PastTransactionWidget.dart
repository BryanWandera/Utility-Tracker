import 'package:flutter/material.dart';
import 'package:very_cool_app/constants.dart';

class PastTransactionWidget extends StatelessWidget {

  var emoji;
  var bill;
  var amount;

  PastTransactionWidget({this.emoji= 'tv', this.bill='bill', this.amount='amount'});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width*0.15,
          height: MediaQuery.of(context).size.width*0.15,
          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02) ,
          margin: EdgeInsets.symmetric(vertical: 14.0),
          decoration: BoxDecoration(
              color: darkBlue,
              borderRadius: BorderRadius.circular(5.0)
          ),
          child: Image.asset('lib/assets/emojis/$emoji.png',

          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width*0.05,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(bill,
              style: generalTextStyle(FontWeight.w500, 16.0),),
            Text('UGX $amount',
              style: generalTextStyle(FontWeight.bold, 16.0, color: mutedRed),)
          ],
        )
      ],
    );
  }
}
