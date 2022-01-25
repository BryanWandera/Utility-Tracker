import 'package:flutter/material.dart';
import 'package:very_cool_app/constants.dart';
import 'package:very_cool_app/custom-widgets/TipWidget.dart';

class TipsScreen extends StatelessWidget {

  var utility;

  TipsScreen({this.utility= 'water'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: veryDarkBlue,
      body: SafeArea(child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Flexible(
                    child: Text('How to cut down your $utility bill' ,
                        style: generalTextStyle(FontWeight.bold, 28.0)
                        ,),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              TipWidget(),
              TipWidget(),
              TipWidget(),
              TipWidget(),


            ],
          ),
        ),
      )),
    );
  }
}
