import 'package:flutter/material.dart';

//b11_1, b11_2의 아이들 리스트뷰
class KidList extends ChangeNotifier {
  static int _kidNum = 0;
  List<List<TextEditingController>> kidListController = List.generate(
      100, (i) => List.generate(6, (j) => TextEditingController()),
      growable: true);

  List<DataRow> _rowKidList = [];
  List<DataColumn> _columnKidList = [
    DataColumn(
        label: Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('id'),
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
    DataColumn(
        label: Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('사진'),
        ],
      ),
    )),
  ];

  List<DataRow> get rowKidList => _rowKidList;

  List<DataColumn> get columnKidList => _columnKidList;

  void addKid() {
    // 아이추가
    debugPrint('생성전 아이들 수: $_kidNum');
    _rowKidList.add(DataRow(cells: [
      for (int i = 0; i < 6; i++) ...[
          DataCell(
              Center(child: TextFormField(controller: kidListController[_kidNum][i],
              )
              )
          ),

      ],
    ]));
    //print(kidListController[_kidNum]);
    //print(_rowKidList);
    _kidNum++;
    debugPrint('$_kidNum번째 아이');
    notifyListeners();
    //print(kidListController);
    print(_rowKidList);
  }

  // void getKid(int kidId, String kidName, String kidBD, String kidSex, String kidComment, String kidImg) {
  //   _kidNum++;
  //   debugPrint('$_kidNum번째 아이');
  //   _rowKidList.add(DataRow(cells: [
  //     for (int i = 0; i < 6; i++) ...[
  //       if (i == 0) ...[
  //         DataCell(Center(
  //           child: InkWell(
  //             child: const Icon(Icons.link),
  //             onTap: () {
  //               debugPrint("The icon is clicked : provider");
  //             },
  //           ),
  //         )),
  //       ] else ...[
  //           DataCell(Center(
  //               child: TextFormField(
  //                 controller: kidListController[_kidNum][i],
  //               ))),
  //         ],
  //     ],
  //   ]));

  // DataRow(cells: [
  // DataCell(Center(child: Text('나서스카서스녹서스'))),
  // DataCell(Center(child: Text('나서스카서스녹서스'))),
  // DataCell(Center(child: Text('나서스카서스녹서스'))),
  // DataCell(Center(child: Text('나서스카서스녹서스'))),
  // DataCell(Center(child: Text('나서스카서스녹서스'))),
  // DataCell(Center(child: Text('나서스카서스녹서스'))),
  // ]),
  void clearKid() {
    _rowKidList.clear();
  }

  void getKid(List list) {
    print("getkidlist: $list");
    _kidNum++;
    debugPrint('$_kidNum번째 아이');
    _rowKidList.add(DataRow(cells: [
      for (int i = 0; i < 6; i++) ...[
        if (i == 0) ...[
          DataCell(Center(child: Text(list[i].toString()))),
        ] else ...[
          DataCell(Center(child: Text(list[i]))),
        ]
      ]]
    ));

    // List<DataCell> _cells = [];
    // for(int i =0; i<6;i++) {
    //   print(list[i]);
    //   if(i==0) {
    //     _cells.add(DataCell(Center(child: Text(list[i].toString()))),);
    //   }
    //   else {
    //     _cells.add(DataCell(Center(child: Text(list[i]))),);
    //   }
    //   // print(_cells);
    // }
    //print('_cells: $_cells');
    //_rowKidList.add(DataRow(cells: _cells));
    //print('리스트삽입완료');
    print('삽입후 _rowKidList: $_rowKidList');
    //print(_columnKidList);
    notifyListeners();
  }
}
