import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:very_cool_app/constants.dart';
import 'package:very_cool_app/custom-widgets/BigRedButton.dart';
import 'package:very_cool_app/custom-widgets/TextField.dart';

class AddUtilityScreen extends StatelessWidget {
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
                    Text('Add Utility',
                    style: generalTextStyle(FontWeight.bold, 28.0),)
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.18,
                      height: MediaQuery.of(context).size.width*0.18,
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),
                      decoration: BoxDecoration(
                          color:  darkBlue,
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: Image.asset('lib/assets/emojis/battery.png',
                        
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text('Electricity',
                    style: generalTextStyle(FontWeight.normal, 16.0),)
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Text('Add Account Details',
                    style: generalTextStyle(FontWeight.bold, 18.0),)
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                CustomTextField(label: 'Name',),
                CustomTextField(label: 'Account Name',),
                CustomTextField(label: 'Billing Frequency',),
                BigRedButton(label: 'Done',)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
