
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peer_relationship_chart/widjets/child_addndelete_list.dart';
import 'b11_2.dart';

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

List<DataRow> _rowKidList_1 = [];

class B11_1 extends StatefulWidget {
  const B11_1({Key? key, required this.notifyParent}) : super(key: key);
  final Function(double, double)? notifyParent;

  @override
  State<B11_1> createState() => _B11_1State();
}

class _B11_1State extends State<B11_1> {
  GlobalKey globalkeyCK = GlobalKey();

  getBoxSize(GlobalKey key) {
    if (key.currentContext != null) {
      final RenderBox renderBox =
          key.currentContext!.findRenderObject() as RenderBox;
      final double sizeY = renderBox.size.height;
      return sizeY;
    }
  }

  getBoxPosition(GlobalKey key) {
    if (key.currentContext != null) {
      final RenderBox renderBox =
          key.currentContext!.findRenderObject() as RenderBox;
      final double positionY = renderBox.localToGlobal(Offset.zero).dy;
      return positionY;
    }
  }

  @override
  Widget build(BuildContext contextB11_1) {
    return Row(
      children: [
        SizedBox(width: 80.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          key: globalkeyCK,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 55.01),
              child: Row(
                children: [
                  SizedBox(
                      height: 32.w,
                      child: Text('아이들 목록',
                          style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF393838)))),
                  Container(
                      margin: EdgeInsets.only(left: 579.56.w),
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                            'assets/icons/icon_excel_download.svg'),
                      )),
                  TextButton(
                    onPressed: () {},
                    child: Text('엑셀 다운로드',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF393838))),
                  )
                ],
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SingleChildScrollView(
                  child: Container(
                      width: 860.w,
                      height: 275.w,
                      margin: EdgeInsets.only(top: 30.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                              color: const Color(0xFFFBB348), width: 1.w)),
                      child: ListView(children: [
                        DataTable(
                            columnSpacing: 24.w,
                            headingRowColor: MaterialStateProperty.all(
                                const Color(0xFFFED796)),
                            dataRowHeight: 40.w,
                            headingRowHeight: 40.w,
                            columns: _columnKidList,
                            rows: _rowKidList_1
                            )
                      ]))),
              SizedBox(height: 194.w),
              Row(children: [
                SizedBox(
                  width: 260.w,
                  height: 50.w,
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint('아이 등록 및 수정');
                      showPopUpB11_2(contextB11_1, _rowKidList_1);
                    },
                    child: Text('아이 등록 및 수정',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.w)),
                    style: ElevatedButton.styleFrom(
                        elevation: 1.0,
                        primary: const Color(0xFFA666FB),
                        onPrimary: const Color(0xFFFFFFFF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        fixedSize: Size(200.w, 50.w)),
                  ),
                ),
                Container(
                  width: 260.w,
                  height: 50.w,
                  margin: EdgeInsets.only(left: 40.w),
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint('아이 반 바꾸기');
                    },
                    child: Text('아이 반 바꾸기',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.w)),
                    style: ElevatedButton.styleFrom(
                        elevation: 1.0,
                        primary: const Color(0xFFA666FB),
                        onPrimary: const Color(0xFFFFFFFF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        fixedSize: Size(200.w, 50.w)),
                  ),
                ),
                Container(
                  width: 260.w,
                  height: 50.w,
                  margin: EdgeInsets.only(left: 40.w),
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint('아이 등록 해제');
                    },
                    child: Text('아이 등록 해제',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.w)),
                    style: ElevatedButton.styleFrom(
                        elevation: 1.0,
                        primary: const Color(0xFFA666FB),
                        onPrimary: const Color(0xFFFFFFFF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        fixedSize: Size(200.w, 50.w)),
                  ),
                )
              ]),
              SizedBox(height: 50.w)
            ])
          ],
        ),
      ],
    );
  }
}
