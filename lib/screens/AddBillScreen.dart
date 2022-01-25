import 'package:flutter/material.dart';
import 'package:very_cool_app/constants.dart';
import 'package:very_cool_app/custom-widgets/TextField.dart';
import 'package:very_cool_app/custom-widgets/BigRedButton.dart';

class AddBillScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: veryDarkBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05, ),
            child: Column(
              children: [
                SizedBox(height: 10.0,),
                Row(
                  children: [
                    Text('Add Bill',
                      style: generalTextStyle(FontWeight.bold, 28.0),)
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),

                SizedBox(
                  height: 10.0,
                ),
                CustomTextField(label: 'Utility',),
                CustomTextField(label: 'Amount Paid',),
                CustomTextField(label: 'Date Paid',),
                BigRedButton(label: 'Done',)
              ],
            ),
          ),
        ),
      ),
    );;
  }
}
