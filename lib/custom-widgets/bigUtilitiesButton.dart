import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:very_cool_app/constants.dart';
import 'package:provider/provider.dart';
import 'package:very_cool_app/providers/home-screen-provider.dart';

class BigUtilityButton extends StatefulWidget {
  var utilityName;
  var emoji;
  var active;
  var utilityID;
  var color;
  var toggleActivityCallback;

  deactivate(){
    color = darkBlue;
    active = false;

  }

  activate(){
    color = activeGreen;
    active = true;

  }


  BigUtilityButton({this.emoji= 'battery', this.utilityName = 'Utility', this.active=false, this.utilityID, this.toggleActivityCallback,});

  @override
  State<BigUtilityButton> createState() => _BigUtilityButtonState();
}

class _BigUtilityButtonState extends State<BigUtilityButton> {
  @override
  Widget build(BuildContext context) {
    if (widget.active){
      widget.color = activeGreen;
    } else if (!widget.active){
      widget.color = darkBlue;
    }
    return Consumer<HomeScreenProvider>(
      builder: (context, home, child){
        return GestureDetector(
          onTap: (){
            home.deactivateAllUtilityButtons();
            home.setActiveUtilityID(widget.utilityID, this);

              widget.color = activeGreen;
              print("set state to active green ---------------");


          },
          child: Container(
            width: MediaQuery.of(context).size.width *0.24,
            height: MediaQuery.of(context).size.width *0.28,
            margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: widget.color,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('lib/assets/emojis/${widget.emoji}.png',
                  width: MediaQuery.of(context).size.width *0.12,
                ),
                SizedBox(
                  height:MediaQuery.of(context).size.width *0.03 ,
                ),
                Text('${widget.utilityName}',
                  style: widget.active ? generalTextStyle(FontWeight.w600, 13.0) : generalTextStyle(FontWeight.w400, 13.0),)
              ],
            ),
          ),
        );
      },

    );
  }
}
