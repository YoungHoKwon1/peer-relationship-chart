import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peer_relationship_chart/a_main/a1.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const autoLoginStorage = FlutterSecureStorage();

void showPopUpB2_5(context, quitInfo) {
  showDialog(
    context: context,
    builder: (contextB2_5) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: 480.w,
          height: 250.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xFF7649B7),
              width: 1.w
            ),
            color: const Color(0xFFE2D3FE)
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0.w, 74.w, 0.w, 0.w),
                child: Text('정말로 탈퇴하시겠습니까?',
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400, color: const Color(0xFF393838)))
              ),
              Container(
                margin: EdgeInsets.fromLTRB(59.w, 62.w, 0.w, 0.w),
                child: Row(
                  children: [
                    SizedBox(
                      //width: 150.w,
                        height: 50.w,
                        child: ElevatedButton(
                            onPressed: () {
                              debugPrint('예, 탈퇴합니다');
                              for(int i=0;i<3;i++) {
                                debugPrint(quitInfo[i]);
                              }
                              Navigator.pop(context, quitInfo);//결과 반영 dialog 종료
                              autoLoginStorage.delete(key: "login");
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => const A1()));
                            },
                            child: Text('예, 탈퇴합니다', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400)),
                            style: ElevatedButton.styleFrom(
                              elevation: 1.0,
                              primary: const Color(0xFFFFFFFF),
                              onPrimary: const Color(0xFF393838),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                                side: const BorderSide(
                                color: Color(0xFFA666FB)
                                )
                            )
                        )
                    ),
                    Container(
                      width: 150.w,
                        height: 50.w,
                        margin: EdgeInsets.fromLTRB(62.w, 0.w, 0.w, 0.w),
                        child: ElevatedButton(
                            onPressed: () {
                              debugPrint('아니오');
                              Navigator.pop(context);//결과 반영 dialog 종료
                            },
                            child: Text('아니오', style: TextStyle(fontSize: 20.w, fontWeight: FontWeight.w400)),
                            style: ElevatedButton.styleFrom(
                                elevation: 1.0,
                                primary: const Color(0xFFFFFFFF),
                                onPrimary: const Color(0xFF393838),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                side: const BorderSide(
                                    color: Color(0xFFA666FB)
                                )
                            )
                        )
                    )
                  ],
                ),
              )
            ],
          ),
        )
      );
    }
  );
}