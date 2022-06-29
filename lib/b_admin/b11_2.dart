import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peer_relationship_chart/widjets//child_addndelete_list.dart';

//아이들 등록, 수정
final _kidAddFormKey = GlobalKey<FormState>(); //TextFormField key // 추가된 아이들 수
int kidNum = 0;
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
List<List<TextEditingController>> _kidListController = List.generate(7, (i) => List.generate(7, (j) => TextEditingController()), growable: true);
List<DataRow> _rowKidList_2 = [];

void _addKid(int n) {
  // 아이추가
  debugPrint('생성전: $n');
  _rowKidList_2.add(DataRow(cells: [
    for (int i = 0; i < 7; i++) ...[
      if (i == 0) ...[
        DataCell(Center(
          child: InkWell(
            child: const Icon(Icons.link),
            onTap: () {
              debugPrint("The icon is clicked2");
            },
          ),
        )),
      ] else ...[
        DataCell(Center(
            child: TextFormField(
          controller: _kidListController[n][i],
        ))),
      ],
      //print('삽입완료$n');
    ],
    // DataCell(Center(
    // child: InkWell(
    // child: const Icon(Icons.link),
    //   onTap: () {
    //     debugPrint("The icon is clicked2");
    //   },
    // ),
    // )),
    //
    // // for(int i=0;i<6;i++) ...[
    // //   ctrNum = n + (i * (0.1));
    // //   final kidListController = TextEditingController();
    // //   DataCell(Center(child: TextFormField()));
    // // ],
    // DataCell(Center(child: TextFormField())),
    // DataCell(Center(child: TextFormField())),
    // DataCell(Center(child: TextFormField())),
    // DataCell(Center(child: TextFormField())),
    // DataCell(Center(child: TextFormField())),
    // DataCell(Center(child: TextFormField())),
  ]));

  n++;
  kidNum = n;
  debugPrint('애들수: $n');
}

void showPopUpB11_2(context, listview) {
  showDialog(
      context: context,
      builder: (contextB11_2) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: SingleChildScrollView(
              child: Container(
                  width: 1000,
                  height: 550,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFFFCF9F4)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(414.w, 47.w, 0.w, 0.w),
                        child: Text(
                          '아이 등록 및 수정',
                          style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF393838)),
                        ),
                      ),
                      SingleChildScrollView(
                          child: Container(
                              width: 959.w,
                              height: 275.w,
                              margin: EdgeInsets.only(top: 30.w, left: 20.w),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  border: Border.all(
                                      color: const Color(0xFFFBB348),
                                      width: 1.w)),
                              child: ListView(children: [
                                Form(
                                  key: _kidAddFormKey,
                                  child: DataTable(
                                      columnSpacing: 24.w,
                                      headingRowColor:
                                          MaterialStateProperty.all(
                                              const Color(0xFFFED796)),
                                      dataRowHeight: 40.w,
                                      headingRowHeight: 40.w,
                                      columns: _columnKidList,
                                      rows: _rowKidList_2),
                                ),
                              ]))),
                      SizedBox(height: 42.w),
                      Row(children: [
                        Container(
                          margin: EdgeInsets.only(left: 205.w),
                          child: ElevatedButton(
                            onPressed: () {
                              debugPrint('추가');
                              setState(() {
                                _addKid(kidNum);
                              });
                            },
                            child: const Text('추가',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400)),
                            style: ElevatedButton.styleFrom(
                                elevation: 1.0,
                                primary: const Color(0xFFFFFFFF),
                                onPrimary: const Color(0xFF393838),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                side:
                                    const BorderSide(color: Color(0xFFA666FB)),
                                fixedSize: const Size(150, 50)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 50.w),
                          child: ElevatedButton(
                            onPressed: () {
                              debugPrint('저장');
                              listview = _rowKidList_2;
                              Navigator.pop(contextB11_2); //result 반영 dialog 종료
                            },
                            child: const Text('저장',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400)),
                            style: ElevatedButton.styleFrom(
                                elevation: 1.0,
                                primary: const Color(0xFFFFFFFF),
                                onPrimary: const Color(0xFF393838),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                side:
                                    const BorderSide(color: Color(0xFFA666FB)),
                                fixedSize: const Size(150, 50)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 50.w),
                          child: ElevatedButton(
                            onPressed: () {
                              debugPrint('취소');
                              Navigator.pop(contextB11_2); //result 반영 dialog 종료
                            },
                            child: const Text('취소',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400)),
                            style: ElevatedButton.styleFrom(
                                elevation: 1.0,
                                primary: const Color(0xFFFFFFFF),
                                onPrimary: const Color(0xFF393838),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                side:
                                    const BorderSide(color: Color(0xFFA666FB)),
                                fixedSize: const Size(150, 50)),
                          ),
                        )
                      ])
                    ],
                  )),
            ),
          );
        });
      });
}
