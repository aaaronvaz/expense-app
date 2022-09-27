import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/list_obj.dart';
import '../Assets/Text/styles.dart';

class addListItem extends StatefulWidget {
  final List myList;
  final VoidCallback updateUI;
  const addListItem({Key? key, required this.myList, required this.updateUI})
      : super(key: key);

  @override
  State<addListItem> createState() => _addListItemState(myList, updateUI);
}

class _addListItemState extends State<addListItem> {
  final List myList;
  final VoidCallback updateUI;
  _addListItemState(this.myList, this.updateUI);

  TextEditingController titleCtrl = TextEditingController();
  TextEditingController costCtrl = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  void addNewItem(BuildContext contxtx) {
    String _title = titleCtrl.text;
    double _cost = double.parse(costCtrl.text);
    String cost = _cost.toStringAsFixed(2);

    if (_title.isEmpty || cost.isEmpty) {
      print('Validation-error');
    } else {
      // DateTime dateTime = _selectedDate

      var temp = list_obj(
          id: DateTime.now().toString(),
          dateTime: _selectedDate,
          title: _title,
          cost: _cost);
      myList.add(temp);

      titleCtrl.clear();
      costCtrl.clear();
      _selectedDate = DateTime.now();

      Navigator.of(context).pop();
    }
  }

  void showDatepick(BuildContext context, StateSetter setter) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now(),
            cancelText: 'Cancel',
            confirmText: 'Select date')
        .then((value) {
      if (value == null) {
        return;
      } else {
        setter(() {
          _selectedDate = value;
        });
        //print(DateFormat('d/M/y').format(_selectedDate));
      }
    });
  }

  //int inc = 0;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showBottomSheet(
            enableDrag: false,
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Container(
                  height: 300,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 4,
                        style: BorderStyle.solid,
                        color: Colors.green,
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Text('inc: ${inc}'),
                          TextField(
                            style: styles.bottomscreenText,
                            decoration: InputDecoration(
                              labelText: 'TITLE',
                              labelStyle: styles.bottomscreenLabel,
                              floatingLabelStyle: styles.bottomscreenFloatLabel,
                            ),
                            controller: titleCtrl,
                          ),
                          TextField(
                            style: styles.bottomscreenText,
                            decoration: InputDecoration(
                              labelText: 'COST',
                              labelStyle: styles.bottomscreenLabel,
                              floatingLabelStyle: styles.bottomscreenFloatLabel,
                            ),
                            controller: costCtrl,
                            keyboardType: TextInputType.number,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Selected date: ${DateFormat('d/M/y').format(_selectedDate)}',
                                ),
                                OutlinedButton(
                                    onPressed: () {
                                      showDatepick(context, setState);
                                    },
                                    child: Text('Assign date')),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Cancel')),
                                ElevatedButton(
                                    onPressed: () {
                                      addNewItem(context);
                                      updateUI();
                                    },
                                    child: Text(
                                      'Add to list',
                                    )),
                              ],
                            ),
                          ),
                          // TextButton(
                          //     onPressed: () {
                          //       setState(() {
                          //         inc += 1;
                          //       });
                          //     },
                          //     child: Text('test statefulbuilder'))
                        ],
                      ),
                    ),
                  ),
                );
              });
            });
      } /*addListUI(context)*/,
      child: Icon(Icons.add, color: Colors.white),
      //backgroundColor: Colors.green,
    );
  }
}
