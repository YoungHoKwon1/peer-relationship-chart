import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peer_relationship_chart/a_main/a2_1.dart';
import 'package:peer_relationship_chart/a_main/a3_1.dart';
import 'package:peer_relationship_chart/a_main/a4_1.dart';
import 'package:peer_relationship_chart/a_main/a6_1.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:peer_relationship_chart/retrofit/rest.dart';
import 'package:logger/logger.dart';

class A1 extends StatefulWidget {
  const A1({
    Key? key,
  }) : super(key: key);

  @override
  State<A1> createState() => _A1State();
}

class _A1State extends State<A1> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/backgrounds/signin_page.png'),
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              Row(
                children: [
                  Container(
                    width: 495.w,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 55.w),
                          width: 250.w,
                          height: 125.w,
                          color: Colors.white,
                          child: Container(),
                        ),
                        SizedBox(
                          height: 90.w,
                        ),
                        LoginPageForm(),
                      ],
                    ),
                  ),
                  Container(
                    width: 495.w,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomLoginField extends StatelessWidget {
  final String text;
  final FormFieldSetter _onSaved;
  final FormFieldValidator _validator;

  const CustomLoginField(this.text, this._onSaved, this._validator);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 250.w,
          // decoration: BoxDecoration(
          //     borderRadius: BorderRadius.all(Radius.circular(10)),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Color(0xff000000).withOpacity(0.16),
          //         offset: Offset(2, 2),
          //         blurRadius: 6,
          //       ),
          //     ]),
          //height: 40,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onSaved: _onSaved,
            validator: _validator,
            onChanged: _onSaved,
            style: TextStyle(
              fontSize: 20.w,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
            obscureText: text == "비밀번호" ? true : false,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                fontSize: 20.w,
                fontWeight: FontWeight.w400,
                color: Color(0xffB2B2B2),
              ),
              hintText: "$text",
              border: OutlineInputBorder(),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.w, horizontal: 16.w),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.w),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.w),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.w),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.w),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

class LoginPageForm extends StatefulWidget {
  const LoginPageForm({Key? key}) : super(key: key);

  @override
  State<LoginPageForm> createState() => _LoginPageFormState();
}

class _LoginPageFormState extends State<LoginPageForm> {
  final formKey = GlobalKey<FormState>();

  String ID = '';
  String PW = '';
  String loginError = '';
  bool AutoLogin = false;
  static final autoLoginStorage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: this.formKey,
      child: Column(
        children: [
          CustomLoginField(
            '아이디',
            (val) {
              setState(() {
                this.ID = val;
                loginError = "";
              });
            },
            (val) {
              if (val.length < 1) {
                return '이름은 필수사항입니다.';
              }
              if (val.length < 2) {
                return '아이디는 5자 이상 입력 해주셔야합니다.';
              }
              return null;
            },
          ),
          SizedBox(height: 30.w),
          CustomLoginField(
            "비밀번호",
            (val) {
              setState(() {
                this.PW = val;
                print(this.PW);
                loginError = "";
              });
            },
            (val) {
              if (val.length < 1) {
                return '비밀번호는 필수사항입니다.';
              }
              // if (val.length < 8) {
              //   return '8자 이상 입력해주세요!';
              // }
              if (loginError == '401') {
                print("loginError");
                print(loginError);
                return '이메일 혹은 비밀번호가 틀렸습니다.';
              }
              if (loginError == '412') {
                print("loginError");
                print(loginError);
                return '이메일 형식이 잘못되었습니다.';
              }
              if (loginError == '500') {
                print("loginError");
                print(loginError);
                return '서버에러';
              }
              return null;
            },
          ),
          SizedBox(height: 20.w),
          SizedBox(
            width: 250.w,
            child: Row(
              children: [
                Container(
                  width: 25.w,
                  height: 25.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff000000).withOpacity(0.16),
                          offset: Offset(2, 2),
                          blurRadius: 6,
                        )
                      ],
                      color: Colors.white),
                  child: Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        activeColor: Color(0xff555555),
                        checkColor: Color(0xffFDB43B),
                        fillColor: MaterialStateProperty.all(Color(0xffffffff)),
                        value: AutoLogin,
                        onChanged: (val) {
                          setState(() {
                            AutoLogin = val!;
                            print(val);
                          });
                        }),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  '자동로그인',
                  style: TextStyle(
                      color: Color(0xff393838),
                      fontSize: 20.w,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          SizedBox(height: 70.w),
          Container(
            width: 250.w,
            height: 40.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.w),
            ),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xffA666FB)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.w),
                    ))),
                onPressed: () async {
                  if (this.formKey.currentState!.validate()) {
                    print('완료');
                    if (AutoLogin == true) {
                      await autoLoginStorage.write(key: "id", value: this.ID);
                      await autoLoginStorage.write(
                          key: "password", value: this.PW);
                    }
                    print(this.ID);
                    print(this.PW);
                    Dio dio = Dio();
                    final client = RestClient(dio);
                    LoginForm loginForm =
                        LoginForm(email: this.ID, password: this.PW);

                    Future.microtask(() async {
                      final response = await client
                          .postLogin(loginForm)
                          .catchError((Object obj) {
                        final res = (obj as DioError).response;
                        switch (res!.statusCode) {
                          case 401:
                            setState(() {
                              loginError = '401';
                              print(loginError);
                            });
                            break;
                          case 412:
                            setState(() {
                              loginError = '412';
                              print(loginError);
                            });
                            break;
                          case 500:
                            setState(() {
                              loginError = '500';
                              print(loginError);
                            });
                            break;
                          default:
                            break;
                        }
                      });
                      await autoLoginStorage.write(key: "signInToken", value: response.token);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => A6_1()),
                      );
                    });
                  }
                },
                child: Text(
                  '로그인',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.w,
                      fontWeight: FontWeight.w700),
                )),
          ),
          SizedBox(
            width: 250.w,
            height: 40.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => A3_1()),
                    );
                  },
                  child: Text(
                    '아이디 찾기',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.w,
                      color: const Color(0xff393838),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => A4_1()),
                    );
                  },
                  child: Text(
                    '비밀번호 찾기',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.w,
                      color: const Color(0xff393838),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 230.w,
            height: 40.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '아직회원이 아니신가요?',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12.w,
                    color: const Color(0xff393838),
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => A2_1()),
                    );
                  },
                  child: Text(
                    '회원가입',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.w,
                      color: const Color(0xff393838),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
