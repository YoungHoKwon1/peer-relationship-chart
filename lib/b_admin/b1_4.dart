import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peer_relationship_chart/a_main/a6_1.dart';
import 'package:peer_relationship_chart/retrofit/admin.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:peer_relationship_chart/widjets/child_addndelete_list_provider.dart';
import 'package:provider/provider.dart';


import '../widjets/admin_info.dart';
import '../widjets/menu_bar.dart';
//admin 페이지 2차인증\
final myControllerPwdCheck = TextEditingController();
String pwdCheck = '';
//String adminEmail = '';

final autoLoginStorage = const FlutterSecureStorage();
void showPopUpB1_4(context)  {
  Dio dio = Dio();
  final client = RestAdminClient(dio);

  showDialog(
      context: context,
      builder: (contextB1_4) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: SingleChildScrollView(
            child: Container(
              width: 800.w,
              height: 450.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.w),
                  color: const Color(0xFFFCF9F4)
              ),
              child: Row(
                children: [
                  SizedBox(width: 146.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 32,
                        margin: EdgeInsets.only(top: 100.w),
                        child: Text('회원정보확인', style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w400,color: const Color(0xFF393838))),
                      ),
                      SizedBox(height: 20.w),
                      Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 221,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFFED796),
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.w)),
                                  border:  Border.all(
                                      color: const Color(0xFFFBB348),
                                      width: 1
                                  )
                              ),
                              child: Text('아이디', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400, color: const Color(0xFF393838))),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 305.w,
                              height: 50.w,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(10.w)),
                                  border:  Border.all(
                                      color: const Color(0xFFFBB348),
                                      width: 1
                                  )
                              ),
                              child: Text('abcdef1234@aijoa.com', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400, color: const Color(0xFF393838))),
                            )
                          ]
                      ),
                      Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 221.w,
                              height: 50.w,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFFED796),
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.w)),
                                  border:  Border.all(
                                      color: const Color(0xFFFBB348),
                                      width: 1.w
                                  )
                              ),
                              child: Text('비밀번호', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400, color: const Color(0xFF393838))),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 305.w,
                              height: 50.w,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.w)),
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
                      SizedBox(height: 92.w),
                          Row(
                            children: [
                              SizedBox(width: 80.w),
                              ElevatedButton(
                                onPressed: () async {
                                  debugPrint('확인');
                                  pwdCheck = myControllerPwdCheck.text;
                                  debugPrint(pwdCheck);
                                  final token = await autoLoginStorage.read(
                                      key: "signInToken");
                                  if (pwdCheck != null) {
                                    PwdCheckForm pwdCheckForm = PwdCheckForm(
                                        password: pwdCheck);
                                    final response = await client.postPwdCheck(
                                        token!.toString(), pwdCheckForm)
                                        .catchError((Object obj) {
                                      final res = (obj as DioError).response;
                                      switch (res!.statusCode) {
                                        case 401:
                                          print(401);
                                          break;
                                        case 403:
                                          print(403);
                                          break;
                                        case 412:
                                          print(412);
                                          break;
                                        case 419:
                                          print(419);
                                          break;
                                        case 500:
                                          print(500);
                                          break;
                                        default:
                                          break;
                                      }
                                      return obj.response;
                                    });
                                    await autoLoginStorage.write(
                                        key: "2CheckToken",
                                        value: response.token);
                                    final token2 = await autoLoginStorage.read(
                                        key: "2CheckToken");
                                    print('admin 토큰2 : $token2');
                                    if (token2 != null) {
                                      String adminEmail = '';
                                      String adminName = '';
                                      String adminPhoneNumber = '';
                                      String adminImagePath = '';
                                      final token2 = await autoLoginStorage.read(key: "2CheckToken");
                                      var response = await client.getAdminInfo(token2.toString())
                                          .catchError((Object obj) {
                                        final res = (obj as DioError).response;
                                        switch (res!.statusCode) {
                                          case 401:
                                            print('401 : 유효하지 않은 토큰2입니다.');
                                            break;
                                          case 403:
                                            print('403 : 거부됨. 기존 토큰을 여기다가 갔다쓴경우.');
                                            break;
                                          case 419:
                                            print('419 : 토큰이 만료되었습니다.');
                                            break;
                                          case 500:
                                            print('500 : 서버 에러.');
                                            break;
                                          default:
                                            break;
                                        }
                                        return obj.response;
                                      });
                                      Map<String, dynamic> mapResult = Map<String, dynamic>.from(response); //받아온 값 _internallinkedhashmap -> Map으로 변경
                                      adminEmail = mapResult["email"];
                                      adminName = mapResult["name"];
                                      adminPhoneNumber = mapResult["phoneNumber"];
                                      adminImagePath = mapResult["imagePath"];

                                      contextB1_4.read<AdminInfo>().infoUpdate(adminEmail, adminName, adminPhoneNumber, adminImagePath);//provider에 이식
                                      Navigator.pop(contextB1_4);
                                    }
                                  }
                                },
                                child: Text('확인', style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400)),
                                style: ElevatedButton.styleFrom(
                                    elevation: 1.0,
                                    primary: const Color(0xFFFFFFFF),
                                    onPrimary: const Color(0xFF393838),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.w)
                                    ),
                                    side: const BorderSide(
                                        color: Color(0xFFA666FB)
                                    ),
                                    fixedSize: Size(150.w, 50.w)
                                ),
                              ),
                              SizedBox(width: 50.w),
                              ElevatedButton(
                                onPressed: () {
                                  debugPrint('취소');
                                  Navigator.pop(
                                      contextB1_4); //아무내용 없이 dialog 종료
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (
                                          contextA6_1) => const A6_1()));
                                },
                                child: Text('취소', style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400)),
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
                                    fixedSize: Size(150.w, 50.w)
                                ),
                              ),
                              SizedBox(width: 151.w)
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