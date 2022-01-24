import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:very_cool_app/constants.dart';
import 'package:very_cool_app/custom-widgets/addUtilityButton.dart';
import 'package:very_cool_app/custom-widgets/bigUtilitiesButton.dart';
import 'package:very_cool_app/custom-widgets/optionCard.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: veryDarkBlue,
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: MediaQuery.of(context).size.width*0.03),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                //app bar row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  //hamburger icon
                  const Icon(
                    PhosphorIcons.list,
                    color: lightPurple,
                    size: 35,
                  ),
                  //add bill and notifications
                  Row(
                    children: [
                      const Icon(
                        PhosphorIcons.bell,
                        color: mutedRed,
                        size: 35,
                      ),
                      Container(
                        child: Text('Add Bill',
                        style: generalTextStyle(FontWeight.bold, 16.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                        margin: const EdgeInsets.only(left: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: mutedRed,
                          

                        ),
                      )
                    ],
                  ),

                ],

                ),
                SizedBox(
                  height: 10.0,
                ),
                // page title

                Row(

                  children: [
                    Text('Home Muyenga',
                    style: generalTextStyle(FontWeight.w900, 28.0),),
                  ],
                ),
                //utilitties row
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      BigUtilityButton(buttonColor: activeGreen, emoji: 'battery', utilityName: 'Electricity',),
                      BigUtilityButton(buttonColor: darkBlue, emoji: 'water', utilityName: 'Water',),
                      BigUtilityButton(buttonColor: darkBlue, emoji: 'tv', utilityName: 'TV',),
                      AddUtilityButton()
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text('Spending Trends',
                    style: generalTextStyle(FontWeight.w600, 18.0),)
                  ],
                ),
                SizedBox(height: 20.0,),
                Image.asset('lib/assets/images/spending-trends.png',
                width: MediaQuery.of(context).size.width * 0.97,),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Text('Next Bill Due on Tue 23 Dec',
                      style: generalTextStyle(FontWeight.w600, 12.0, color:mutedRed),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // OptionCard
                    OptionCard(emoji: 'money', option: 'View past transactions',),
                    OptionCard(emoji: 'bulb', option: 'Saving Tips',),
                    OptionCard(emoji: 'chart', option: 'Detailed Stats',)
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Text('Account Details',
                      textAlign: TextAlign.left,
                      style: generalTextStyle(FontWeight.w600, 18.0, ),),
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  children: [
                    Text('Account Name:  ',
                    style: generalTextStyle(FontWeight.w600, 12.0),),
                    Text('Wandera Allison',
                      style: generalTextStyle(FontWeight.normal, 12.0),),

                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  children: [
                    Text('Account Number:  ',
                      style: generalTextStyle(FontWeight.w600, 12.0),),
                    Text('20002076478',
                      style: generalTextStyle(FontWeight.normal, 12.0),),

                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  children: [
                    Text('Additional Info:  ',
                      style: generalTextStyle(FontWeight.w600, 12.0),),
                    Text('Second DSTV',
                      style: generalTextStyle(FontWeight.normal, 12.0),),

                  ],
                ),
                SizedBox(height: 100.0,),




              ],

            ),
          ),
        ),
      ),
    );
  }
}
