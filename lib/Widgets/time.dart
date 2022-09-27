import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:intl/intl.dart';

class time extends StatefulWidget {
  time({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return timeState();
  }
}

class timeState extends State<time> {
  var dt_txt = DateFormat('EEEE, d MMMM').format(DateTime.now()).toString();

  void setTimeIndia() {
    setState(() {
      dt_txt = DateFormat('d-M-y').format(DateTime.now()).toString();
    });
  }

  void setTimeUSA() {
    setState(() {
      dt_txt = DateFormat('MMMM,EEEE d').format(DateTime.now()).toString();
    });
  }

  void setTimeUK() {
    setState(() {
      dt_txt = DateFormat.jms().format(DateTime.now()).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              '${dt_txt}',
              style: TextStyle(color: Colors.green, fontSize: 20),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(onPressed: setTimeIndia, child: Text('F1')),
              OutlinedButton(onPressed: setTimeUSA, child: Text('F2')),
              OutlinedButton(onPressed: setTimeUK, child: Text('TIME')),
            ],
          ),
        ],
      ),
    );
  }
}
