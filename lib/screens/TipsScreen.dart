import 'package:flutter/material.dart';
import 'package:very_cool_app/constants.dart';
import 'package:very_cool_app/custom-widgets/TipWidget.dart';

class TipsScreen extends StatelessWidget {


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
                    child: Text('How to cut down your bills.' ,
                        style: generalTextStyle(FontWeight.bold, 28.0)
                        ,),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              TipWidget(tip: 'Use energy saving light bulbs instead of ordinary bulbs',),
              TipWidget(tip: 'Clean the filters in your vacuum cleaner to make it work effeciently.',),
              TipWidget(tip: 'Replace old applicances. Older appliances are less energy effecient.',),
              TipWidget(tip: 'Take shorter showers. It saves water.',),
              TipWidget(tip: 'Watch videos in lower resolution to save on your internet bill.',),
              TipWidget(tip: 'Turn off auto update on your devices to reduce your internet bill',),
              TipWidget(tip: 'Fix faulty faucets. The little leaks add up and raise your water bill.',),
              TipWidget(tip: 'Run full loads of laundry',),
              TipWidget(tip: 'Utilize more modern toilets that are water effecient.',),


            ],
          ),
        ),
      )),
    );
  }
}
