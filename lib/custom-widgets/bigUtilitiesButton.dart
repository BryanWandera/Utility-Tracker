import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:very_cool_app/constants.dart';
import 'package:provider/provider.dart';
import 'package:very_cool_app/providers/home-screen-provider.dart';

class BigUtilityButton extends StatefulWidget {
  var utilityName;
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


  BigUtilityButton({ this.utilityName = 'Utility', this.active=false, this.utilityID, this.toggleActivityCallback,});

  @override
  State<BigUtilityButton> createState() => _BigUtilityButtonState();
}

class _BigUtilityButtonState extends State<BigUtilityButton> {

  var emoji;

  @override
  Widget build(BuildContext context) {
    //setting the color of the button depending on its active status
    if (widget.active){
      widget.color = activeGreen;
    } else if (!widget.active){
      widget.color = darkBlue;
    }
    // setting the emoji depending on the utility
    emoji = 'cloud';
    if(widget.utilityName.toString().toLowerCase() == 'water'){emoji = 'water';}
    if(widget.utilityName.toString().toLowerCase() == 'electricity'){emoji = 'battery';}
    if(widget.utilityName.toString().toLowerCase() == 'umeme'){emoji = 'battery';}
    if(widget.utilityName.toString().toLowerCase() == 'internet'){emoji = 'wifi';}
    if(widget.utilityName.toString().toLowerCase() == 'wifi'){emoji = 'wifi';}
    if(widget.utilityName.toString().toLowerCase() == 'wi-fi'){emoji = 'wifi';}
    if(widget.utilityName.toString().toLowerCase() == 'tv'){emoji = 'tv';}
    if(widget.utilityName.toString().toLowerCase() == 'internet'){emoji = 'water';}
    if(widget.utilityName.toString().toLowerCase() == 'television'){emoji = 'tv';}


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
                Image.asset('lib/assets/emojis/$emoji.png',
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
