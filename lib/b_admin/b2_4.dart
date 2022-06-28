import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peer_relationship_chart/b_admin/b2_5.dart';
//회원 탈퇴
void showPopUpB2_4(context, id, pwd) {
  final myControllerNameQuit = TextEditingController();
  final myControllerEmailQuit = TextEditingController();
  final myControllerPwdQuit = TextEditingController();

  List<String> quitInfo = List<String>.filled(3, '');

  showDialog(
      context: context,
      builder: (contextB2_4) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: GestureDetector(
            onTap: () => FocusScope.of(contextB2_4).unfocus(),
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
                      Container(
                          width: 94.w,
                          height: 35.w,
                          margin: EdgeInsets.fromLTRB(353.w, 40.w, 353.w, 0.w),
                          child: Text('회원 탈퇴',style: TextStyle(fontSize: 24.sp, color: const Color(0xFF393838)))
                      ),
                      Container(
                        width: 550.w,
                        height: 286.w,
                        margin: EdgeInsets.fromLTRB(125.w, 20.w, 125.w, 0.w),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: const Color(0xFFFDB43B),
                                width: 1.w
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          children: [
                            Container(
                                // width: 179.w,
                                height: 44.w,
                                margin: EdgeInsets.fromLTRB(0.w, 99.w, 0.w, 0.w),
                                child: Text('안내 문구 출력',style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w400,color: const Color(0xFFAAAAAA)))
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(15.w, 98.w, 0.w, 0.w),
                              child: Row(
                               children: [
                                 const SizedBox(
                                     width: 30,
                                     height: 30,
                                     child: ColoredBox(color: Colors.amber)),
                                 Container(
                                   height: 20.w,
                                   margin: EdgeInsets.only(left: 15.w),
                                   child: Text('상기 TreasureMap 회원탈퇴 시 처리사항 안내를 확인하였으며 동의합니다.',
                                     style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: const Color(0xFF393838))),
                                 )
                               ], 
                              )
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 349.w,
                        height: 20.w,
                        margin: EdgeInsets.fromLTRB(125.w, 19.w, 0.w, 0.w),
                        child: Text('보안을 위해 회원님의 이름과 이메일, 비밀번호를 확인합니다.',
                            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: const Color(0xFF393838))),
                      ),
                      Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(38.w, 49.w, 0.w, 0.w),
                              child: Row(
                                  children: [
                                    SizedBox(
                                      width: 26.w,
                                      height: 20.w,
                                      child: Text('이름', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: const Color(0xFF393838))),
                                    ),
                                    Container(
                                      width: 140.w,
                                      height: 20.w,
                                      margin: EdgeInsets.only(left: 10.w),
                                      child: TextField(
                                        controller: myControllerNameQuit,
                                      ),
                                    ),
                                    Container(
                                      width: 39.w,
                                      height: 20.w,
                                      margin: const EdgeInsets.only(left: 20),
                                      child: Text('이메일', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: const Color(0xFF393838))),
                                    ),
                                    Container(
                                      width: 149.w,
                                      height: 20.w,
                                      margin: EdgeInsets.only(left: 10.w),
                                      child: TextField(
                                        controller: myControllerEmailQuit,
                                      ),
                                    ),
                                    Container(
                                      width: 52.w,
                                      height: 20.w,
                                      margin: const EdgeInsets.only(left: 20),
                                      child: Text('비밀번호', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: const Color(0xFF393838))),
                                    ),
                                    Container(
                                      width: 149.w,
                                      height: 20.w,
                                      margin: EdgeInsets.only(left: 10.w),
                                      child: TextField(
                                        controller: myControllerPwdQuit,
                                      ),
                                    ),
                                  ]),
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(20.w, 29, 0.w, 0.w),
                                child: ElevatedButton(
                                  onPressed: () {
                                    debugPrint('본인확인');
                                    //textfield로 받은 정보 출력
                                    quitInfo[0] = myControllerNameQuit.text;
                                    quitInfo[1] = myControllerEmailQuit.text;
                                    quitInfo[2] = myControllerPwdQuit.text;
                                    for(int i=0;i<3;i++) {
                                      debugPrint(quitInfo[i]);
                                    }
                                    showPopUpB2_5(contextB2_4, quitInfo);
                                    //Navigator.pop(context, quitInfo);//결과 반영 dialog 종료
                                  },
                                  child: Text('본인확인', style: TextStyle(fontSize: 14.w, fontWeight: FontWeight.w400)),
                                  style: ElevatedButton.styleFrom(
                                      elevation: 1.0,
                                      primary: const Color(0xFFA666FB),
                                      onPrimary: const Color(0xFFFFFFFF),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      //fixedSize: Size(80.w,40.w)
                                  )
                                )
                            )
                          ])
                    ],
                  )
              ),
            ),
          ),
        );
      }
  );
}
