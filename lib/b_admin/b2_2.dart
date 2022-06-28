import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'b2_4.dart';

//내 정보 변경 창
void showPopUpB2_2(context, id, pwd) {
  //user input
  final myControllerName = TextEditingController();
  final myControllerTel = TextEditingController();
  final myControllerPwd1 = TextEditingController();
  final myControllerPwd2 = TextEditingController();

  List<String> changedInfo = List<String>.filled(4, '');//내 정보 변경에서 받아올 정보
  showDialog(
      context: context,
      builder: (contextB2_2) {
        return Dialog(
            backgroundColor: Colors.transparent,
            child: GestureDetector(
              onTap: () => FocusScope.of(contextB2_2).unfocus(),
              child: SingleChildScrollView(
                child: Container(
                  width: 800.w,
                  height: 550.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFFFCF9F4)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40.w),
                      Container(
                        width: 149,
                        height: 35.w,
                        margin: EdgeInsets.only(left: 320.w),
                        child: Text('내 정보 변경 창', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w400, color: const Color(0xFF393838))),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 124.66.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 150.34.w,
                                height: 177.67.w,
                                color: Colors.red,
                                margin: EdgeInsets.only(top: 64.5.w),
                                child: Text('사진 들어갈 곳',style: TextStyle(fontSize: 20.sp)),
                              ),
                              Container(
                                // width: 115,
                                // height: 29.w,
                                color: Colors.blueAccent,
                                margin: EdgeInsets.fromLTRB(17.w, 14.83.w, 0.w, 0.w),
                                child: Text('사진 변경하기', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400, color: const Color(0xFF393838))),
                              )
                            ],
                          ),
                          SizedBox(width: 56.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 50.w),
                                child: Text('이름', style: TextStyle(fontSize: 20.w, fontWeight: FontWeight.w400, color: const Color(0xFF393838))),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 48.w),
                                child: Text('연락처', style: TextStyle(fontSize: 20.w, fontWeight: FontWeight.w400, color: const Color(0xFF393838))),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 50.w),
                                child: Text('패스워드', style: TextStyle(fontSize: 20.w, fontWeight: FontWeight.w400, color: const Color(0xFF393838))),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 41.w),
                                child: Text('패스워드 확인', style: TextStyle(fontSize: 20.w, fontWeight: FontWeight.w400, color: const Color(0xFF393838))),
                              )
                            ],
                          ),
                          SizedBox(width: 33.79.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 60.5.w),
                                  width: 200.w,
                                  height: 30.w,
                                  child: TextField(
                                    controller: myControllerName,
                                  )
                              ),

                              Container(
                                  width: 200.w,
                                  height: 30.w,
                                  margin: EdgeInsets.only(top: 46.5.w),
                                  child: TextField(
                                    controller: myControllerTel,
                                  )
                              ),
                              Container(
                                  height: 30.w,
                                  width: 200.w,
                                  margin: EdgeInsets.only(top: 45.w),
                                  child: TextField(
                                    controller: myControllerPwd1,
                                  )
                              ),
                              Container(
                                  width: 200.w,
                                  height: 30.w,
                                  margin: EdgeInsets.only(top: 43.w),
                                  child: TextField(
                                    controller: myControllerPwd2,
                                  )
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 59.w),
                      Row(
                        children: [
                          SizedBox(width: 125.w),
                          ElevatedButton(
                            onPressed: () {
                              debugPrint('확인');
                              //textfield로 받은 정보 출력
                              changedInfo[0] = myControllerName.text;
                              changedInfo[1] = myControllerTel.text;
                              changedInfo[2] = myControllerPwd1.text;
                              changedInfo[3] = myControllerPwd2.text;
                              for(int i=0;i<4;i++) {
                                debugPrint(changedInfo[i]);
                              }
                              Navigator.pop(contextB2_2, changedInfo);//결과 반영 dialog 종료
                              //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
                            },
                            child: Text('확인', style: TextStyle(fontSize: 20.w, fontWeight: FontWeight.w400)),
                            style: ElevatedButton.styleFrom(
                                elevation: 1.0,
                                primary: const Color(0xFFFFFFFF),
                                onPrimary: const Color(0xFF393838),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                side: const BorderSide(
                                    color: Color(0xFFA666FB)
                                ),
                                fixedSize: Size(150.w,50.w)
                            ),
                          ),
                          SizedBox(width: 50.w),
                          ElevatedButton(
                            onPressed: () {
                              debugPrint('취소');
                              Navigator.pop(contextB2_2);//아무내용 없이 dialog 종료
                              //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
                            },
                            child: Text('취소', style: TextStyle(fontSize: 20.w, fontWeight: FontWeight.w400)),
                            style: ElevatedButton.styleFrom(
                                elevation: 1.0,
                                primary: const Color(0xFFFFFFFF),
                                onPrimary: const Color(0xFF393838),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                side: const BorderSide(
                                    color: Color(0xFFA666FB)
                                ),
                                fixedSize: Size(150.w,50.w)
                            ),
                          ),
                          SizedBox(width: 50.w),
                          ElevatedButton(
                            onPressed: () {
                              debugPrint('탈퇴');
                              showPopUpB2_4(contextB2_2,2,3);
                              },
                            child: Text('탈퇴', style: TextStyle(fontSize: 20.w, fontWeight: FontWeight.w400)),
                            style: ElevatedButton.styleFrom(
                                elevation: 1.0,
                                primary: const Color(0xFFFFFFFF),
                                onPrimary: const Color(0xFF393838),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                side: const BorderSide(
                                    color: Color(0xFFA666FB)
                                ),
                                fixedSize: Size(150.w,50.w)
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
        );
      }
  );
}