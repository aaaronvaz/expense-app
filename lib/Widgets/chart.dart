import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/list_obj.dart';
import './chart_bar.dart';

class chart extends StatelessWidget {
  final List<list_obj> recentList;
  const chart({Key? key, required this.recentList}) : super(key: key);

  List<Map<String, Object>> get groupedList {
    return List.generate(7, (index) {
      var weekDay = DateTime.now().subtract(Duration(days: index));
      double _totalCost = 0.00;

      for (int i = 0; i < recentList.length; i++) {
        if (recentList[i].dateTime.day == weekDay.day &&
            recentList[i].dateTime.month == weekDay.month &&
            recentList[i].dateTime.year == weekDay.year) {
          _totalCost += recentList[i].cost;
        }
      }
      //print('Day: ${DateFormat('E').format(weekDay)}, Amount: ${totalCost}');

      return {'Day': DateFormat('E').format(weekDay), 'Amount': _totalCost};
    }).reversed.toList();
  }
  //  List<Map<String, Object>> get groupedList {
  //   return List.generate(7, (index) {
  //     var weekDay = DateTime.now().subtract(Duration(days: index));
  //     double _totalCost = 0.00;

  //     for (int i = 0; i < recentList.length; i++) {
  //       if (recentList[i].dateTime.day == weekDay.day &&
  //           recentList[i].dateTime.month == weekDay.month &&
  //           recentList[i].dateTime.year == weekDay.year) {
  //         _totalCost += recentList[i].cost;
  //       }
  //     }
  //     //print('Day: ${DateFormat('E').format(weekDay)}, Amount: ${totalCost}');

  //     return {'Day': DateFormat('E').format(weekDay), 'Amount': _totalCost};
  //   });
  // }

  // double get totalSpending {
  //   return groupedList.fold(0.0, (sum, element) {
  //     return sum + (element['amount'] as double);
  //   });
  // }

  double get totalSpending {
    return groupedList.fold(
        0.00, (sum, element) => sum + (element['Amount'] as double));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Row(
        children: groupedList.map((item) {
          return Flexible(
            fit: FlexFit.tight,
            child: chartBar(
                weekDay: item['Day'].toString(),
                totalCost: (item['Amount'] as double),
                totalCostPct: totalSpending == 0.00
                    ? 0.00
                    : ((item['Amount'] as double) / totalSpending)),
          );
        }).toList(),
      ),
      elevation: 6,
    );
  }
}
