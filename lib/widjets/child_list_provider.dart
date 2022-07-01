import 'package:flutter/material.dart';

class ChildListProvider extends ChangeNotifier{
  int kidNumP=0;
  final List<DataRow> _rowKidList = [];

  void addKid(int n) { // 아이추가
    debugPrint('생성전: $n');
    this._rowKidList.add(DataRow(cells: [
      for (int i = 0; i < 7; i++) ...[
        if (i == 0) ...[
          DataCell(Center(
            child: InkWell(
              child: const Icon(Icons.link),
              onTap: () {
                debugPrint("The icon is clicked : provider");
              },
            ),
          )),
        ] else ...[
          DataCell(Center(
              child: TextFormField(
                //controller: this.kidListController[n][i],
              ))),
        ],
      ],
    ]));

    n++;
    kidNumP = n;
    debugPrint('애들수: $n');
    notifyListeners();
  }
}