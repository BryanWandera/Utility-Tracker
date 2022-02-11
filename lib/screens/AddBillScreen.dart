import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:very_cool_app/constants.dart';
import 'package:very_cool_app/custom-widgets/TextField.dart';
import 'package:very_cool_app/custom-widgets/BigRedButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:very_cool_app/providers/home-screen-provider.dart';
import 'package:provider/provider.dart';



class AddBillScreen extends StatelessWidget  {
  var activeUtilityName;


  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController utilityNameController = TextEditingController();
  TextEditingController amountPaidController = TextEditingController();
  TextEditingController datePaidController = TextEditingController();

  DateTime pickedDatePaid = DateTime.now();

  AddBillScreen({this.activeUtilityName});




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
                const SizedBox(
                  height: 20.0,
                ),

                const SizedBox(
                  height: 10.0,
                ),
                Consumer<HomeScreenProvider>(
                  builder: (context, home, child){
                    return Text(home.accountName(), style: generalTextStyle(FontWeight.bold, 16.0),);
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),

                CustomTextField(label: 'Amount Paid',
                  textField: TextField(
                    controller: amountPaidController,
                    keyboardType: TextInputType.number,
                    style: generalTextStyle(FontWeight.normal, 16.0),                  )
                  ,),
                CustomTextField(label: 'Date Paid',
                  textField: TextField(
                    onTap: () async{
                      var pickedDate = await showDatePicker(
                          context: context, //context of current state
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101)
                      );
                      if(pickedDate != null ){
                        print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement
                        datePaidController.text = formattedDate; //set output date to TextField value.
                        pickedDatePaid = pickedDate;

                      }else{
                        print("Date is not selected");
                      }
                    },
                    controller: datePaidController,
                    keyboardType: TextInputType.datetime,
                    style: generalTextStyle(FontWeight.normal, 16.0),                  )
                  ,),
                Consumer<HomeScreenProvider>(
                  builder: (context, home, child){
                    if (home.loading()){
                      return CircularProgressIndicator();
                    } else {
                      return BigRedButton(label: 'Done', callBack: () async {

                        try {
                          home.setLoadingTrue();
                          _firestore.collection('Bill').add({
                            'datePaid': pickedDatePaid,
                            'utilityID': home.activeUtilityID(),
                            'amountPaid': amountPaidController.text
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

                )
              ],
            ),
          ),
        ),
      ),
    );;
  }
}
