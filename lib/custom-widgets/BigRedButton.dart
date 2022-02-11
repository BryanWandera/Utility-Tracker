import 'package:flutter/material.dart';
import 'package:very_cool_app/constants.dart';

class BigRedButton extends StatelessWidget {
  var label;
  var callBack;

  BigRedButton({this.label = 'Label', this.callBack});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            print("been tapped");
            callBack();
          },
          child: Container(
            child: Text(label,
              style: generalTextStyle(FontWeight.bold, 16.0),),
            margin: EdgeInsets.symmetric(vertical: 20.0),
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.08, vertical: MediaQuery.of(context).size.width*0.02 ),
            decoration: BoxDecoration(
                color: mutedRed,
                borderRadius: BorderRadius.circular(5.0)
            ),

          ),
        )
      ],
    );
  }
}
