import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peer_relationship_chart/widjets//child_addndelete_list_provider.dart';
import 'package:provider/provider.dart';

//아이들 등록, 수정
final _kidAddFormKey = GlobalKey<FormState>(); //TextFormField key // 추가된 아이들 수
void showPopUpB11_2(context) {
  showDialog(
      context: context,
      builder: (contextB11_2) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: SingleChildScrollView(
            child: Container(
                width: 1000,
                height: 550,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFFCF9F4)),
                child: ChangeNotifierProvider<KidList>(
                  create: (_) => KidList(),
                    builder: (contextProvider, child) {
                  return Column(
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
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(10)),
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
                                          columns:
                                          contextProvider.watch<KidList>().columnKidList,
                                          rows:
                                          contextProvider.watch<KidList>().rowKidList
                                          ),
                                ),
                              ]))),
                      SizedBox(height: 42.w),
                      Row(children: [
                        Container(
                          margin: EdgeInsets.only(left: 205.w),
                          child: ElevatedButton(
                            onPressed: () {
                              debugPrint('추가');
                              contextProvider.read<KidList>().addKid();
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
                                side: const BorderSide(color: Color(0xFFA666FB)),
                                fixedSize: const Size(150, 50)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 50.w),
                          child: ElevatedButton(
                            onPressed: () {
                              debugPrint('저장');
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
                                side: const BorderSide(color: Color(0xFFA666FB)),
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
                                side: const BorderSide(color: Color(0xFFA666FB)),
                                fixedSize: const Size(150, 50)),
                          ),
                        )
                      ])
                    ],
                  );
                })
            ),
          ),
        );
      });
}
