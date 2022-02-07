import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:very_cool_app/constants.dart';
import 'package:very_cool_app/custom-widgets/bigUtilitiesButton.dart';

class HomeScreenProvider extends ChangeNotifier {
  var _homeName = "Home name";
  var _homeID = "";
  List<String> _chartLabels = ['Value', 'Value', 'Value'];
  List<String> _chartValues = ['1', '1', '1'];
  var _accountName = "Account Name";
  var _accountNumber = "Account Number";
  List<Widget> _utilityButtons = [
    BigUtilityButton(buttonColor: darkBlue, emoji: 'water', utilityName: 'Utility')
  ];

  var _activeUtilityID;


  homeName(){
    return _homeName;
  }
  setHomeName(value){
    _homeName = value;
    notifyListeners();
  }
  homeID(){
    return _homeID;
  }
  setHomeID (value){
    _homeID = value;
    notifyListeners();
  }
  chartLabels(){
    return _chartLabels;
  }
  setChartLabels(value){
    _chartLabels = value;
    notifyListeners();
  }
  chartValues(){
    return _chartValues;
  }
  setChartValues(value){
    _chartValues = value;
    notifyListeners();
  }
  accountName(){
    return _accountName;
  }
  setAccountName(value){
    _accountName = value;
    notifyListeners();
  }

  accountNumber(){
    return _accountNumber;
  }
  setAccountNumber (value){
    _accountNumber = value;
    notifyListeners();
  }
  utilityButtons(){
    return _utilityButtons;
  }
  setUtilityButtons(value){
    _utilityButtons = value;
    notifyListeners();
  }
}