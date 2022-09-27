import 'package:flutter/material.dart';

import '../Assets/Text/styles.dart';

class chartBar extends StatelessWidget {
  final String weekDay;
  final double totalCost;
  final double totalCostPct;
  const chartBar(
      {Key? key,
      required this.weekDay,
      required this.totalCost,
      required this.totalCostPct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print(totalCostPct);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: Column(children: [
        Container(
          height: 20,
          child: FittedBox(
            child: Text(
              '₹${totalCost.toStringAsFixed(2)}',
              style: styles.barChartCost,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
            height: 60,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey,
                  ),
                ),
                FractionallySizedBox(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  heightFactor: totalCostPct,
                )
              ],
            )),
        SizedBox(
          height: 5,
        ),
        Text(weekDay),
      ]),
    );
  }
}
