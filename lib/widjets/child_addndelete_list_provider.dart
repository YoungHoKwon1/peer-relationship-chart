import 'package:flutter/material.dart';

//b11_1, b11_2의 아이들 리스트뷰
class KidList extends ChangeNotifier {
  static int _kidNum = 0; //총 아이 수 계산

  //textField: controller 부여
  List<List<TextEditingController>> kidListController = List.generate(
      400, (i) => List.generate(6, (j) => TextEditingController()),
      growable: true);
  List<bool> selected = [];
  List<DataRow> _rowKidList = [];
  List<DataColumn> _columnKidList = [
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
          Text('성별'),
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
  ];

  List<DataRow> get rowKidList => _rowKidList;
  List<DataColumn> get columnKidList => _columnKidList;

  // 아이추가
  void addKid() {
    // debugPrint('생성전 아이들 수: $_kidNum');
    // _rowKidList.add(DataRow(cells: [
    //   for (int i = 0; i < 5; i++) ...[
    //       DataCell(Center(child: TextFormField(controller: kidListController[_kidNum][i],))),
    //   ],
    // ]));
    // _kidNum++;
    // debugPrint('$_kidNum번째 아이');
    // notifyListeners();
  }


  //Clean: Datatable
  void clearKid() {
    _rowKidList.clear();
  }

  //b11_1, b11_2에 쏴주는www
  void getKid(List list) {
    _kidNum++;
    debugPrint('$_kidNum번째 아이');
    _rowKidList.add(DataRow(cells: [
      for (int i = 0; i < 5; i++) ...[
        if (i == 0) ...[
          DataCell(Center(child: list[i])),//사진입력
        ] else ...[
          DataCell(Center(child: Text(list[i]))),
        ]
      ]]
    ));
    notifyListeners();
  }

  void updateKid(List list) {
    _kidNum++;
    debugPrint('$_kidNum번째 아이');
    _rowKidList.add(DataRow(
      //onSelectChanged: (isSelected) => setState(() {}),
      cells: [
        for (int i = 0; i < 5; i++) ...[
          if (i == 0) ...[
            DataCell(Center(child: list[i]),), //사진입력
          ] else ...[
            DataCell(Center(child: TextFormField(
              decoration: InputDecoration(
                hintText: list[i]
              ),
              controller: kidListController[_kidNum][i],
            ))),
          ]
        ]
      ],
    ));
    notifyListeners();
  }

  void uploadKid(List list) {

  }

}
