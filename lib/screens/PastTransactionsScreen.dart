import 'package:flutter/material.dart';
import 'package:very_cool_app/constants.dart';
import 'package:very_cool_app/custom-widgets/PastTransactionWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:very_cool_app/providers/home-screen-provider.dart';
import 'package:provider/provider.dart';

class PastTransactionsScreen extends StatefulWidget {
  var homeID;

  PastTransactionsScreen({this.homeID});

  @override
  State<PastTransactionsScreen> createState() => _PastTransactionsScreenState();
}

class _PastTransactionsScreenState extends State<PastTransactionsScreen> {
  List<PastTransactionWidget> pastTransactionWidgets = [];

  @override
  void initState() {
    FirebaseFirestore.instance.collection('Utility').where('homeID', isEqualTo: widget.homeID).get().then((value){
                    pastTransactionWidgets = [];
                    for (var i = 0; i < value.docs.length; i++){
                      FirebaseFirestore.instance.collection("Bill").where('utilityID', isEqualTo: value.docs[i].id ).get().then((bill){
                        for (var j =0; j < bill.docs.length; j++ ){
                          pastTransactionWidgets.add(PastTransactionWidget(utilityName: value.docs[i]["name"], amount: bill.docs[j]["amountPaid"], date: bill.docs[j]["datePaid"],));
                        }
                      });
                    }

                  });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: veryDarkBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<HomeScreenProvider>(
            builder: (context, home, child){
              home.setPastTransactionWidgets(pastTransactionWidgets);
              return Container(
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
                    Column(
                      children: home.pastTransactionWidgets(),
                    )
                  ],
                ),
              );
            },
          ) ,
        ),
      ),
    );
  }
}
