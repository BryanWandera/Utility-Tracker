import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:very_cool_app/constants.dart';
import 'package:very_cool_app/custom-widgets/UpcomingBillWidget.dart';

class UpcomingBillsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: veryDarkBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Upcoming Bills', style: generalTextStyle(FontWeight.bold, 28.0)),
                  ],
                ),
                SizedBox(height: 20.0,),
                UpcomingBillWidget(bill:'Electricity', dueDate: 'Wed 23 Nov', emoji: 'battery',),
                UpcomingBillWidget(bill:'Water', dueDate: 'Fri 25 Nov', emoji: 'water',),
                UpcomingBillWidget(bill:'TV', dueDate: 'Sat 26 Nov', emoji: 'tv',),

              ],
            ),
          ) ,
        ),
      ),
    );
  }
}
