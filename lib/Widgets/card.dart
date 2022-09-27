import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class card extends StatelessWidget {
  DateTime dateTime;
  String title;
  String cost;
  card({
    Key? key,
    required this.dateTime,
    required this.title,
    required this.cost,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 2),
        child: Card(
          child: Row(
            children: [
              Container(
                //width: 60,
                margin:
                    EdgeInsets.only(bottom: 10, top: 10, left: 15, right: 15),
                padding: EdgeInsets.all(6),
                child: Text(
                  '₹${cost}', //cost
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.green,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${title}', //title
                      style: TextStyle(color: Colors.green),
                    ),
                    Text(
                      '${DateFormat('EEEE, d LLL').format(dateTime)}', //dateTime
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
