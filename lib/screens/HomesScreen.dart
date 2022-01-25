import 'package:flutter/material.dart';
import 'package:very_cool_app/constants.dart';
import 'package:very_cool_app/custom-widgets/BigRedButton.dart';
import 'package:very_cool_app/custom-widgets/HomeRow.dart';

class HomesScreen extends StatelessWidget {
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
                    Text('Homes',
                    style: generalTextStyle(FontWeight.bold, 28.0, color: lightPurple),)
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width*0.03,
                ),
                HomeRow(homeName: 'Home Tororo', active: true,),
                HomeRow(homeName: 'Home Muyenga',),
                HomeRow(homeName: 'Home Nairobi',),
                // add new home button
                BigRedButton(label: 'Add New Home',)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
