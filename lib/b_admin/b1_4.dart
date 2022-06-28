import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peer_relationship_chart/a_main/a6_1.dart';

import '../widjets/menu_bar.dart';
//admin 페이지 2차인증\
final myControllerPwdCheck = TextEditingController();
String pwdCheck = '';

void showPopUpB1_4(context, id, pwd) {
  showDialog(
      context: context,
      builder: (contextB1_4) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: SingleChildScrollView(
            child: Container(
              width: 800,
              height: 450,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFFCF9F4)
              ),
              child: Row(
                children: [
                  const SizedBox(width: 146),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 32,
                        margin: const EdgeInsets.only(top: 100),
                        child: const Text('회원정보확인', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400,color: Color(0xFF393838))),
                      ),
                      const SizedBox(height: 20),
                      Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 221,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFFED796),
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(10)),
                                  border:  Border.all(
                                      color: const Color(0xFFFBB348),
                                      width: 1
                                  )
                              ),
                              child: const Text('아이디', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Color(0xFF393838))),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 305,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFFFFFFF),
                                  borderRadius: const BorderRadius.only(topRight: Radius.circular(10)),
                                  border:  Border.all(
                                      color: const Color(0xFFFBB348),
                                      width: 1
                                  )
                              ),
                              child: const Text('abcdef1234@aijoa.com', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Color(0xFF393838))),
                            )
                          ]
                      ),
                      Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 221,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFFED796),
                                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10)),
                                  border:  Border.all(
                                      color: const Color(0xFFFBB348),
                                      width: 1
                                  )
                              ),
                              child: const Text('비밀번호', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Color(0xFF393838))),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 305,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFFFFFFF),
                                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10)),
                                  border:  Border.all(
                                      color: const Color(0xFFFBB348),
                                      width: 1
                                  )
                              ),
                              child: TextField(
                                controller: myControllerPwdCheck,
                                decoration: const InputDecoration(
                                  border: InputBorder.none//밑줄 제거
                                ),
                              )
                            )
                          ]
                      ),
                      const SizedBox(height: 92),
                      Row(
                        children: [
                          const SizedBox(width: 80),
                          ElevatedButton(
                            onPressed: () {
                              debugPrint('확인');
                              pwdCheck = myControllerPwdCheck.text;
                              debugPrint(pwdCheck);
                              Navigator.pop(contextB1_4, pwdCheck);//result 반영 dialog 종료
                              },
                            child: const Text('확인', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
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
                                fixedSize: const Size(150,50)
                            ),
                          ),
                          const SizedBox(width: 50),
                          ElevatedButton(
                            onPressed: () {
                              debugPrint('취소');
                              Navigator.pop(contextB1_4);//아무내용 없이 dialog 종료
                              Navigator.pushReplacement(context,MaterialPageRoute(builder: (contextA6_1) => A6_1()));
                              },
                            child: const Text('취소', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
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
                                fixedSize: const Size(150,50)
                            ),
                          ),
                          const SizedBox(width: 151)
                        ],
                      )
                    ],
                  ),
                  //SizedBox(width: 130)
                ],
              ),
            ),
          ),
        );
      }
  );
}