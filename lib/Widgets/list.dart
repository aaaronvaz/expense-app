import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Assets/Text/styles.dart';
import '../Widgets/card.dart';

class list extends StatelessWidget {
  List listData;
  Function deletefn;
  list({Key? key, required this.listData, required this.deletefn})
      : super(key: key);

  Widget build(BuildContext context) {
    return (ListView.builder(
      //shrinkWrap: true,
      itemBuilder: (listContext, index) {
        double cost = double.parse(listData[index].cost.toString());
        String _cost = cost.toStringAsFixed(2);

        // return card(
        //   dateTime: listData[index].dateTime,
        //   title: listData[index].title,
        //   cost: _cost,
        // );
        return Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 9),
          child: ListTile(
            horizontalTitleGap: 5,
            minVerticalPadding: 5,
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              radius: 30,
              // child: Text(
              //   '₹${_cost}',
              //   style: styles.listTileCost,
              // ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                    child: Text(
                  '₹${_cost}',
                  style: styles.listTileCost,
                )),
              ),
              // maxRadius: 60,
              // minRadius: 25,
            ),
            title: Text(
              listData[index].title.toString(),
            ),
            subtitle: Text(
                '${DateFormat('EEEE, d LLL').format(listData[index].dateTime)}'),
            trailing: IconButton(
                onPressed: () => deletefn(listData[index].id),
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 30,
                )),
          ),
        );
      },
      itemCount: listData.length,
    ));
  }
}

// Container(
//       child: Column(
//         children: listData.map((tx) {
//           return card(
//             id: tx.id,
//             title: tx.title,
//             cost: tx.cost.toString(),
//           );
//         }).toList(),
//       ),
//     );
