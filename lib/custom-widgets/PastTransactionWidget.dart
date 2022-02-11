import 'package:flutter/material.dart';
import 'package:very_cool_app/constants.dart';
import 'package:intl/intl.dart';

class PastTransactionWidget extends StatelessWidget {

  var amount;
  var utilityName;
  var date;

  PastTransactionWidget({this.amount='amount', this.utilityName, this.date});

  @override
  Widget build(BuildContext context) {

    var emoji;
    emoji = 'cloud';
    if(utilityName.toString().toLowerCase() == 'water'){emoji = 'water';}
    if(utilityName.toString().toLowerCase() == 'electricity'){emoji = 'battery';}
    if(utilityName.toString().toLowerCase() == 'umeme'){emoji = 'battery';}
    if(utilityName.toString().toLowerCase() == 'internet'){emoji = 'wifi';}
    if(utilityName.toString().toLowerCase() == 'wifi'){emoji = 'wifi';}
    if(utilityName.toString().toLowerCase() == 'wi-fi'){emoji = 'wifi';}
    if(utilityName.toString().toLowerCase() == 'tv'){emoji = 'tv';}
    if(utilityName.toString().toLowerCase() == 'internet'){emoji = 'water';}
    if(utilityName.toString().toLowerCase() == 'television'){emoji = 'tv';}

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
            Text(utilityName,
              style: generalTextStyle(FontWeight.w500, 16.0),),
            Container(
              width: MediaQuery.of(context).size.width*0.7,
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Text('UGX $amount',
                  style: generalTextStyle(FontWeight.bold, 16.0, color: mutedRed),),
                  Text('${DateFormat('MMM dd, yyyy').format(date.toDate())}',
                    style: generalTextStyle(FontWeight.normal, 12.0,),),
                ]
              ),
            )
          ],
        )
      ],
    );
  }
}
