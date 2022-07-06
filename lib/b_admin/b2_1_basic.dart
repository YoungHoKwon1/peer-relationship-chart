// ignore_for_file: camel_case_types

import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peer_relationship_chart/retrofit/admin.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'b2_2.dart';
import 'package:shared_preferences/shared_preferences.dart';


class B2_1_Basic extends StatefulWidget {
  const B2_1_Basic({Key? key, required this.notifyParent}) : super(key: key);
  final Function(double, double)? notifyParent;

  @override
  State<B2_1_Basic> createState() => _B2_1_BasicState();
}



class _B2_1_BasicState extends State<B2_1_Basic> {
  GlobalKey globalkeyCK = GlobalKey();
  String email = '예지몽';
  String name = '엠씨몽';
  String phoneNumber = '코그몽';
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
  Widget build (BuildContext contextB2_1_basic) {
    return Row(children: [
      SizedBox(width: 47.w),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            //메인 프로필
            width: 893.w,
            height: 280.w,
            margin: EdgeInsets.only(top: 29.01.w),
            decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: const Color(0xFFFCCD7F), width: 1.w)),
            child: Row(
              //사진, 개인정보, 버튼
              children: [
                Container(
                    //사진
                    color: Colors.lightGreen,
                    width: 150.34.w,
                    height: 177.67.w,
                    margin: EdgeInsets.fromLTRB(54.w, 50.67.w, 0.w, 51.66.w),
                    child: Text('사진123123')
                  //Image.network(imagePath)//Image(),
                    ),
                Container(
                  //개인정보
                  width: 375.5.w,
                  //color: Colors.red,
                  margin: EdgeInsets.fromLTRB(60.16.w, 67.w, 0.w, 0.w),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('아이디: $email',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20.sp)),
                      Container(
                          margin: EdgeInsets.fromLTRB(0.w, 25.w, 0.w, 25.w),
                          child: Text('이름: $name',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp))),
                      Text('연락처: $phoneNumber',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20.sp)),
                    ],
                  ),
                ),
                Container(
                  //버튼
                  //color: Colors.blueAccent,
                  width: 200.w,
                  margin: EdgeInsets.fromLTRB(0.w, 103.w, 0.w, 0.w),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          debugPrint('서명등록');
                        },
                        child: Text('서명등록',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20.sp)),
                        style: ElevatedButton.styleFrom(
                            elevation: 1.0,
                            primary: const Color(0xFFFFFFFF),
                            onPrimary: const Color(0xFF393838),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            side: const BorderSide(color: Color(0xFFA666FB)),
                            fixedSize: Size(200.w, 50.w)),
                      ),
                      SizedBox(height: 30.w),
                      ElevatedButton(
                        onPressed: () {
                          debugPrint('내 정보 변경');
                          showPopUpB2_2(contextB2_1_basic, 2, 3);
                        },
                        child: Text('내 정보 변경',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20.w)),
                        style: ElevatedButton.styleFrom(
                            elevation: 1.0,
                            primary: const Color(0xFFA666FB),
                            onPrimary: const Color(0xFFFFFFFF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            fixedSize: Size(200.w, 50.w)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 62.w),
          Text('우리 유치원 목록',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22.w,
                  color: const Color(0xFF393838))),
          SizedBox(height: 20.w),
          Column(
            //우리유치원, 유치원정보
            children: [
              Container(
                width: 893.w,
                height: 40.w,
                decoration: const BoxDecoration(
                    color: Color(0xFFFED796),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10))),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 57.w),
                      child: Text('유치원',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20.w,
                              color: const Color(0xFF393838))),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 98.w),
                      child: Text('원장',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20.w,
                              color: const Color(0xFF393838))),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 97.w),
                      child: Text('원장연락처',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20.w,
                              color: const Color(0xFF393838))),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 136.w),
                      child: Text('주소',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20.w,
                              color: const Color(0xFF393838))),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 145.w),
                      child: Text('전화번호',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20.w,
                              color: const Color(0xFF393838))),
                    ),
                  ],
                ),
              ),
              Container(
                width: 893.w,
                height: 40.w,
                decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    border:
                        Border.all(color: const Color(0xFFFDB43B), width: 1.w)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('튤립유치원',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20.w,
                            color: const Color(0xFF393838))),
                    Text('홍길동',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20.w,
                            color: const Color(0xFF393838))),
                    Text('010.1234.5678',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20.w,
                            color: const Color(0xFF393838))),
                    Text('시흥시 옥길동',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20.w,
                            color: const Color(0xFF393838))),
                    Text('010.1234.5678',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20.w,
                            color: const Color(0xFF393838))),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 111.w),
          ElevatedButton(
            onPressed: () {
              debugPrint('우리유치원 정보 수정');
            },
            child: Text('우리유치원 정보 수정',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.w)),
            style: ElevatedButton.styleFrom(
                elevation: 1.0,
                primary: const Color(0xFFA666FB),
                onPrimary: const Color(0xFFFFFFFF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                fixedSize: Size(280.w, 50.w)),
          ),
        ],
      ),
    ]);
  }
}
