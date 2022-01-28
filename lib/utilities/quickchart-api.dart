import 'package:flutter/material.dart';
import 'package:very_cool_app/constants.dart';
import 'package:http/http.dart' as http ;

// var chartType = 'line';
// var labels = '[]';
// var labelName = 'Users';
// var data = '[]';
// var backgroundColor = 'white' ;



getChartURL (chartType, labels, labelName, data, backgroundColor){

return  'https://quickchart.io/chart?bkg=transparent&c={type:%27$chartType%27,data:{labels:[${labels[0]},${labels[1]},${labels[2]},${labels[3]},${labels[4]}],datasets:[{label:%27$labelName%27,data:[120,60,50,180,120]}]}}';
}


