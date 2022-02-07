import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:very_cool_app/constants.dart';
import 'package:very_cool_app/custom-widgets/addUtilityButton.dart';
import 'package:very_cool_app/custom-widgets/bigUtilitiesButton.dart';
import 'package:very_cool_app/custom-widgets/optionCard.dart';
import 'package:very_cool_app/utilities/quickchart-api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:very_cool_app/providers/home-screen-provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

var activeUtilityID = 'Q0AqrUF1bW9aD2ajmnTR';


class MyHomePage extends StatefulWidget {

  @override

  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


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
                    Consumer<HomeScreenProvider>(
                      builder: (context, home, child){
                        //fetch home name from firebase
                        FirebaseFirestore.instance.collection('Home').where('userID', isEqualTo: 'Lcbhgc2YSzFBpxe5imIc').get().then((value){
                          home.setHomeName(value.docs[0]["name"]);
                          home.setHomeID(value.docs[0].id);
                        });
                        return Text(home.homeName(),
                        style: generalTextStyle(FontWeight.w900, 28.0),);
                      }

                    ),
                  ],
                ),
                //utilitties row
                Consumer<HomeScreenProvider>(
                  builder: (context, home, child){
                    // load the utilities from firebase
                    FirebaseFirestore.instance.collection('Utility').where('homeID', isEqualTo: home.homeID()).get().then((value){
                      List<Widget> bigUtilityButtons = [];
                      for (var i = 0; i < value.docs.length; i++){

                        bigUtilityButtons.add(BigUtilityButton(buttonColor: darkBlue, emoji: 'battery', utilityName: value.docs[i]["name"],));
                        home.setUtilityButtons(bigUtilityButtons);
                        print(i);
                        print('i --------------');

                      }

                    });

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Row(children: home.utilityButtons(),),
                          GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context, 'screens/AddUtilityScreen.dart');
                              },
                              behavior: HitTestBehavior.translucent,
                              child: AddUtilityButton())
                        ],
                      ),
                    );
                  },

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
                  child: Consumer<HomeScreenProvider>(
                    builder: (context, home, child){
                      // load the chart labels from firebase
                      FirebaseFirestore.instance.collection('Bill').where('utilityID', isEqualTo: activeUtilityID).get().then((value){
                       List<String> chartLabelsFinal = [];
                       List<String> valuesFinal = [];
                        for (var i = 0; i < value.docs.length; i++){
                          valuesFinal.add(value.docs[i]["amountPaid"].toString());
                          chartLabelsFinal.add(DateFormat('MMM').format(value.docs[i]["datePaid"].toDate()));

                          home.setChartLabels(chartLabelsFinal);
                          home.setChartValues(valuesFinal);
                        }
                      });

                      return Image.network(getChartURL('line', home.chartLabels(), 'Months', home.chartValues(), 'transparent'),
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stacktrace ){
                          return Container(
                            width: MediaQuery.of(context).size.width*0.97,
                            height: MediaQuery.of(context).size.width*0.6,
                            color: darkBlue,
                            child: const Center(child: Text('😓')),
                          );
                        },
                        width: MediaQuery.of(context).size.width * 0.97,);
                    },

                  ),
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
                Consumer<HomeScreenProvider>(
                  builder: (context, home, child){
                    // load account name and number data from firebase
                    FirebaseFirestore.instance.collection('Utility').doc(activeUtilityID).get().then((value){
                      home.setAccountName(value["name"]);
                      home.setAccountNumber(value["accountNo"]);

                    });
                    return Column(
                      children: [
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
                            Text(home.accountName(),
                              style: generalTextStyle(FontWeight.normal, 12.0),),

                          ],
                        ),
                        SizedBox(height: 10.0,),
                        Row(
                          children: [
                            Text('Account Number:  ',
                              style: generalTextStyle(FontWeight.w600, 12.0),),
                            Text(home.accountNumber(),
                              style: generalTextStyle(FontWeight.normal, 12.0),),

                          ],
                        ),
                        SizedBox(height: 10.0,),
                        Row(
                          children: [
                            Text('Additional Info:  ',
                              style: generalTextStyle(FontWeight.w600, 12.0),),
                            Text('None',
                              style: generalTextStyle(FontWeight.normal, 12.0),),

                          ],
                        ),
                        SizedBox(height: 100.0,)
                      ],

                    );
                  },

                )




              ],

            ),
          ),
        ),
      ),
    );
  }
}
