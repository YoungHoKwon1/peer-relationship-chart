import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:peer_relationship_chart/retrofit/survey.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class KidList with ChangeNotifier {
  static int kidNum=0;
  List<List<TextEditingController>> kidListController = List.generate(40,
          (i) => List.generate(7, (j) => TextEditingController()), growable: true);
  final List<DataRow> _rowKidList = [];
  final List<DataColumn> _columnKidList = [
    DataColumn(
        label: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('사진'),
            ],
          ),
        )),
    DataColumn(
        label: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('이름'),
            ],
          ),
        )),
    DataColumn(
        label: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('생년월일'),
            ],
          ),
        )),
    DataColumn(
        label: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('코멘트'),
            ],
          ),
        )),
    DataColumn(
        label: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('보호자 아이디'),
            ],
          ),
        )),
    DataColumn(
        label: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('학부모 이름'),
            ],
          ),
        )),
    DataColumn(
        label: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('학부모 연락처'),
            ],
          ),
        ))
  ];
  List<DataRow> get rowKidList => _rowKidList;
  List<DataColumn> get columnKidList => _columnKidList;


  void addKid() { // 아이추가
    debugPrint('생성전: $kidNum');
    _rowKidList.add(DataRow(cells: [
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
                controller: kidListController[kidNum][i],
              ))),
        ],
      ],
    ]));
    print(kidListController[kidNum]);
    print(_rowKidList);
    kidNum++;
    debugPrint('애들수: $kidNum');
    notifyListeners();
  }
}