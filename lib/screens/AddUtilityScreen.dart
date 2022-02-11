import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:very_cool_app/constants.dart';
import 'package:very_cool_app/custom-widgets/BigRedButton.dart';
import 'package:very_cool_app/custom-widgets/TextField.dart';
import 'package:provider/provider.dart';
import 'package:very_cool_app/providers/home-screen-provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class AddUtilityScreen extends StatelessWidget {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController yearlyBudgetEditingController = TextEditingController();
  TextEditingController accountNumberEditingController = TextEditingController();

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

                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Text('Add Account Details',
                    style: generalTextStyle(FontWeight.bold, 18.0),)
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomTextField(label: 'Name', keyboardType: TextInputType.text,
                textField: TextField(
                  controller: nameTextEditingController,
                  keyboardType: TextInputType.text,
                  style: generalTextStyle(FontWeight.normal, 16.0),),
                ),
                CustomTextField(label: 'Account Number', keyboardType: TextInputType.text,
                textField: TextField(
                  controller: accountNumberEditingController,
                  keyboardType: TextInputType.text,
                  style: generalTextStyle(FontWeight.normal, 16.0),),
                ),
                CustomTextField(label: 'Yearly Budget', keyboardType: TextInputType.number,
                textField: TextField(
                  controller: yearlyBudgetEditingController,
                  keyboardType: TextInputType.number,
                  style: generalTextStyle(FontWeight.normal, 16.0),),
                ),


                Consumer<HomeScreenProvider>(
                  builder: (context, home, child){
                    if (home.loading()){
                      return CircularProgressIndicator();
                    } else {
                      return
                        BigRedButton(label: 'Done',callBack: () async {

                          try {
                            home.setLoadingTrue();
                            _firestore.collection('Utility').add({
                              'homeID': home.homeID(),
                              'name': nameTextEditingController.text,
                              'yearlyBudget': yearlyBudgetEditingController.text,
                              'accountNo': accountNumberEditingController.text

                            }).then((value){
                              home.setLoadingFalse();
                              Navigator.pop(context);
                            });
                          }catch(e){
                            print(e);
                          }
                        },);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
