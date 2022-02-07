import 'package:flutter/material.dart';
import 'package:very_cool_app/constants.dart';
import 'package:http/http.dart' as http ;


getChartURL (chartType, labels, labelName, data, backgroundColor){
  String labelUrlSection = "";
  String dataUrlSection = "";
  for (int i = 0; i < labels.length; i++){
    labelUrlSection = labelUrlSection + '"${labels[i]}",';
    dataUrlSection = dataUrlSection + "${data[i]}," ;
  }


  return  'https://quickchart.io/chart?bkg=transparent&c={type:%27$chartType%27,data:{labels:[$labelUrlSection],datasets:[{label:%27$labelName%27,data:[$dataUrlSection]}]}}';
}

//'https://quickchart.io/chart?bkg=transparent&c={type:%27$chartType%27,data:{labels:["$labelUrlSection"],datasets:[{label:%27$labelName%27,data:["$dataUrlSection"]}]}}';

// 'https://quickchart.io/chart?bkg=transparent&c={type:%27$chartType%27,data:{labels:["${labels[0]}","${labels[1]}","${labels[2]}"],datasets:[{label:%27$labelName%27,data:[${data[0]},${data[1]},${data[2]}]}]}}';