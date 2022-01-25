import 'package:flutter/material.dart';
import 'package:very_cool_app/constants.dart';
import 'package:very_cool_app/custom-widgets/PastTransactionWidget.dart';

class PastTransactionsScreen extends StatelessWidget {
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
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Text('Past Transactions', style: generalTextStyle(FontWeight.bold, 28.0)),
                  ],
                ),
                SizedBox(height: 20.0,),
                PastTransactionWidget(bill: 'Water', emoji: 'water', amount: '43,000',),
                PastTransactionWidget(bill: 'Electricity', emoji: 'battery', amount: '119,000',),
                PastTransactionWidget(bill: 'TV', emoji: 'tv', amount: '43,000',)

              ],
            ),
          ) ,
        ),
      ),
    );
  }
}
