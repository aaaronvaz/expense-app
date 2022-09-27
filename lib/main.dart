import 'package:flutter/material.dart';

import 'Models/list_obj.dart';
import 'Widgets/addListItem.dart';
import 'Assets/Text/styles.dart';

import 'Widgets/list.dart';
import './Widgets/chart.dart';

void main() => runApp(baseApp());

class baseApp extends StatefulWidget {
  @override
  State<baseApp> createState() => _baseAppState();
}

class _baseAppState extends State<baseApp> {
  List<list_obj> data = [
    // list_obj(
    //   id: DateTime.now(),
    //   title: 'Test',
    //   cost: 12300.22,
    //   dateTime: DateTime.now(),
    // ),
    // list_obj(
    //   id: DateTime.now(),
    //   dateTime: DateTime.now(),
    //   title: 'Test1',
    //   cost: 1120.22,
    // ),
    // list_obj(
    //     id: DateTime.now(),
    //     dateTime: DateTime.now(),
    //     title: 'Test2',
    //     cost: 110.22),
    // list_obj(
    //     id: DateTime.now(),
    //     dateTime: DateTime.now(),
    //     title: 'Test3',
    //     cost: 13.22),
  ];

  List<list_obj> get _recentList {
    return data.where((item) {
      return item.dateTime.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  TextEditingController titleCtrl = TextEditingController();
  TextEditingController costCtrl = TextEditingController();

  int i = 0;

  void addNewList() {
    setState(() {});
  }

  void clearList() {
    setState(() {
      data.clear();
    });
  }

  void deleteListItem(String _id) {
    //print(_id);
    setState(() {
      data.removeWhere((element) => element.id == _id);
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //color: Colors.green,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Home',
            style: styles.title,
          ),
          centerTitle: true,
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         newItemList(addNewitem: addNewList);
          //       } /*print('Working_AppBarButton')*/,
          //       icon: Icon(Icons.add))
          // ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              chart(
                recentList: _recentList,
              ),
              //time(),
              data.isEmpty
                  ? Container(
                      margin: EdgeInsets.only(top: 15, bottom: 15),
                      child: Column(children: [
                        Text(
                          'LIST IS EMPTY!\nADD DATA.',
                          style: styles.emptyHeadline,
                          // style: TextStyle(
                          //   color: Colors.red,
                          //   fontSize: 20,
                          //   fontStyle: FontStyle.italic,
                          // ),
                          textAlign: TextAlign.center,
                        ),
                        // SizedBox(height: 10),
                        // Container(
                        //   child: Image.asset('lib/Assets/Images/logo.png',
                        //       fit: BoxFit.cover),
                        //   height: 250,
                        // ),
                      ]),
                    )
                  : Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.green),
                              height: 550,
                              child: list(
                                listData: data,
                                deletefn: deleteListItem,
                              )),
                          ElevatedButton(
                            onPressed: clearList,
                            child: Text(
                              'Clear List',
                              style: TextStyle(color: Colors.white),
                            ),
                            // style:
                            //     ElevatedButton.styleFrom(onPrimary: Colors.green),
                          ),

                          //color: Colors.red,
                        ],
                      ),
                      //height: 300,
                      margin: EdgeInsets.only(bottom: 15, left: 10, right: 10),
                      //padding: EdgeInsets.all(10),
                    ),
            ],
          ),
        ),
        //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: addListItem(myList: data, updateUI: addNewList),
      ),
    );
  }
}
