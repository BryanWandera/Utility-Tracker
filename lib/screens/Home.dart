import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:very_cool_app/constants.dart';
import 'package:very_cool_app/custom-widgets/addUtilityButton.dart';
import 'package:very_cool_app/custom-widgets/bigUtilitiesButton.dart';
import 'package:very_cool_app/custom-widgets/optionCard.dart';
import 'package:very_cool_app/utilities/quickchart-api.dart';

class MyHomePage extends StatelessWidget {

  var chartLabels = ['May', 'July', 'Aug', 'Sept','Oct'];
  var values = ['30000', '28000', '7000', '8000', '6000'];


  @override
  Widget build(BuildContext context) {
    // print(getChartURL('line', chartLabels, 'Months', values, 'transparent'));
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
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, 'screens/HomesScreen.dart');
                    },
                    child: const Icon(
                      PhosphorIcons.list,
                      color: lightPurple,
                      size: 35,
                    ),
                  ),
                  //add bill and notifications
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, 'screens/UpcomingBillsScreen.dart');
                        },
                        child: const Icon(
                          PhosphorIcons.bell,
                          color: mutedRed,
                          size: 35,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          print('----------------tapped------------');
                          Navigator.pushNamed(context, 'screens/AddBillScreen.dart');
                        },
                        child: Container(
                          child: Text('Add Bill',
                          style: generalTextStyle(FontWeight.bold, 16.0),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                          margin: const EdgeInsets.only(left: 8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: mutedRed,


                          ),
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
                      GestureDetector(
                          onTap: (){
                            print('-------------tapped');
                            Navigator.pushNamed(context, 'screens/AddUtilityScreen.dart');
                          },
                          behavior: HitTestBehavior.translucent,
                          child: AddUtilityButton())
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

                 Container(color: veryDarkBlue,
                  width: MediaQuery.of(context).size.width * 0.97,
                  height: MediaQuery.of(context).size.width * 0.6,
                  child: Image.network(getChartURL('line', chartLabels, 'Months', values, 'transparent'),
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stacktrace ){
                    return Container(
                      width: MediaQuery.of(context).size.width*0.97,
                      height: MediaQuery.of(context).size.width*0.6,
                      color: darkBlue,
                      child: const Center(child: Text('😓')),
                    );
                  },
                  width: MediaQuery.of(context).size.width * 0.97,),
                ),
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
                    GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, 'screens/PastTransactionsScreen.dart');
                        },
                        child: OptionCard(emoji: 'money', option: 'View past transactions',)),
                    GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, 'screens/TipsScreen.dart');
                        },
                        child: OptionCard(emoji: 'bulb', option: 'Saving Tips',)),
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
