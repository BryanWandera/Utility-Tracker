import 'package:flutter/material.dart';
import 'package:very_cool_app/constants.dart';

class UpcomingBillWidget extends StatelessWidget {


  var bill;
  var dueDate;
  var emoji;

  // include some logic to choose the emoji based on the utility

  UpcomingBillWidget({this.bill= 'Bill', this.dueDate='Due Date', this.emoji = 'tv'});
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
            Text(dueDate,
              style: generalTextStyle(FontWeight.bold, 16.0, color: mutedRed),)
          ],
        )
      ],
    );
  }
}
