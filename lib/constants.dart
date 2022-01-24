import 'package:flutter/material.dart';

const lightPurple = Color(0xFFE2DEFF);
const mutedRed = Color (0xFFD46A6A);
const veryDarkBlue = Color(0xFF191927);
const darkBlue = Color(0xFF313142);
const activeGreen = Color(0xFF407F7F);


// ignore: prefer_function_declarations_over_variables
var generalTextStyle = (weight, size, {color = const Color(0xFFE2DEFF) }){
  return  TextStyle(
    fontFamily: 'Poppins',
    fontSize: size,
    fontWeight: weight,
    color: color,

  );
};