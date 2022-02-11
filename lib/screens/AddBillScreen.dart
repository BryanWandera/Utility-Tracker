import 'package:flutter/material.dart';
import 'package:very_cool_app/constants.dart';
import 'package:very_cool_app/custom-widgets/TextField.dart';
import 'package:very_cool_app/custom-widgets/BigRedButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddBillScreen extends StatelessWidget {

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
                CustomTextField(label: 'Amount Paid', keyboardType: TextInputType.number,),
                CustomTextField(label: 'Date Paid', keyboardType: TextInputType.datetime,),
                BigRedButton(label: 'Done', callBack: (){
                  _firestore.collection('Bill').add(data);
                },)
              ],
            ),
          ),
        ),
      ),
    );;
  }
}
