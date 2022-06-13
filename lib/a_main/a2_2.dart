import 'dart:async';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peer_relationship_chart/a_main/a2_1.dart';
import 'package:peer_relationship_chart/a_main/a2_3.dart';

import 'package:flutter_svg/flutter_svg.dart';

class A2_2 extends StatefulWidget {
  const A2_2({Key? key}) : super(key: key);

  @override
  State<A2_2> createState() => _A2_2State();
}

class _A2_2State extends State<A2_2> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCF9F4),
      body: ListView(
        children: [
          Row(
            children: [
              Container(
                width: 270.w,
                child: Column(
                  children: [
                    SizedBox(
                      height: 42,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 63,
                        ),
                        SvgPicture.asset(
                          'assets/icons/icon_signup.svg',
                          height: 32,
                          width: 32,
                        ),
                        SizedBox(
                          width: 17.w,
                        ),
                        Text(
                          '회원가입',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 26.w,
                            color: Color(0xff393838),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 542.w,
                    ),
                    // Spacer(),
                    Row(
                      children: [
                        SizedBox(
                          width: 45.w,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                            elevation: MaterialStateProperty.all(0),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => A2_1()),
                            );
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/icon_back.svg',
                                height: 14.w,
                                width: 23.w,
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              Text(
                                '이전',
                                style: TextStyle(
                                  fontSize: 26.w,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff393838),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 45.w,
                    )
                  ],
                ),
              ),
              SignupPageForm(key: formKey,),
              Container(
                width: 270.w,
                child: Column(
                  children: [
                    SizedBox(
                      height: 616.w,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 110.w,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                            elevation: MaterialStateProperty.all(0),
                          ),
                          onPressed: () {
                            if(this.formKey.currentState!.validate()){
                              formKey.currentState!.save();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => A2_3()),
                                );
                              print('완료');
                            }
                            //   if (_isAllCheck == true) {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(builder: (context) => A2_2()),
                            //   );
                            // }
                          },
                          child: Row(
                            children: [
                              Text(
                                '다음',
                                style: TextStyle(
                                  fontSize: 26.w,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff393838),
                                ),
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              SvgPicture.asset(
                                'assets/icons/icon_next.svg',
                                height: 14.w,
                                width: 23.w,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 45.w,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CustomSignupField extends StatelessWidget {
  final String _text;
  final FormFieldSetter _onSaved;
  final FormFieldValidator _validator;


  const CustomSignupField(this._text, this._onSaved, this._validator);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: _onSaved,
      validator: _validator,
      onChanged: _onSaved,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(
        fontSize: 20.w,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
      ),
      obscureText: _text == "비밀번호" ? true : false || _text == '비밀번호 확인' ? true : false,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          fontSize: 20.w,
          fontWeight: FontWeight.w400,
          color: Color(0xff838383),
        ),

        hintText: "$_text",
        contentPadding: EdgeInsets.symmetric(
          vertical: 0.w,
          horizontal: 5.w,
        ),
      ),
    );
  }
}

class SignupPageForm extends StatefulWidget {
  const SignupPageForm({Key? key }) : super(key: key);



  @override
  State<SignupPageForm> createState() => _SignupPageFormState();
}

class _SignupPageFormState extends State<SignupPageForm> {
  //final formKey = GlobalKey<FormState>();

  String ID = '';
  String PW = '';
  String authenticationNumber = '';
  String sellPhoneNumber = '';
  String name = '';
  String confirmPW = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.key,
      child: Container(
        height: 710.w,
        child: Column(
          children: [
            SizedBox(
              height: 140.w,
            ),
            Container(
              padding: EdgeInsets.only(left: 200, right: 200),
              child: Text(
                'ID로 사용할 이메일을 입력하세요',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff7744BA),
                ),
              ),
            ),
            SizedBox(
              height: 40.w,
            ),
            Row(
              children: [
                Container(
                    width: 340.w,
                    child: CustomSignupField(
                      '이메일(ID)',
                          (val) {
                        setState(() {
                          this.ID = val;
                        });
                      },
                          (val) {
                        if (val.length < 1) {
                          return '이메일은 필수사항입니다.';
                        }
                        if (!RegExp(
                            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                            .hasMatch(val)){
                          return '이메일 형식이 아닙니다.';
                        }
                        return null;
                      },
                    )),
                SizedBox(
                  width: 80.w,
                ),
                SizedBox(
                  width: 280.w,
                  height: 50.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10)),
                      primary: Color(0xffA666FB),
                    ),
                    child: Text(
                      '인증번호 받기',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.w,
                          color: Colors.white),
                    ),
                    onPressed: () async {
                      // if(this.formKey.currentState!.validate()){
                      //   formKey.currentState!.save();
                      //
                      //   print('완료');
                      // }

                      print('dd');
                      print(this.ID);
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30.w,
            ),
            Row(
              children: [
                Container(
                  width: 158.w,
                  child: CustomSignupField(
                    '인증번호 6자리',
                        (val) {
                      setState(() {
                        this.authenticationNumber = val;
                      });
                    },
                        (val) {
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  '05',
                  style: TextStyle(
                    fontSize: 14.w,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff393838),
                  ),
                ),
                Text(
                  ':00',
                  style: TextStyle(
                    fontSize: 14.w,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff393838),
                  ),
                ),
                SizedBox(
                  width: 205.w,
                ),
                SizedBox(
                  width: 170.w,
                  height: 50.w,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10)),
                      side: BorderSide(
                          width: 1, color: Color(0xffA666FB)),
                      primary: Color(0xffA666FB),
                    ),
                    onPressed: () {},
                    child: Text(
                      '인증번호 재전송',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20.w,
                        color: Color(0xff393838),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                SizedBox(
                  width: 90.w,
                  height: 50.w,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10)),
                      side: BorderSide(
                          width: 1, color: Color(0xffA666FB)),
                      primary: Color(0xffA666FB),
                    ),
                    onPressed: () {},
                    child: Text(
                      '확인',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20.w,
                        color: Color(0xff393838),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.w,
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 340.w,
                    child: CustomSignupField(
                      '연락처',
                          (val) {
                        setState(() {
                          this.sellPhoneNumber = val;
                        });
                      },
                          (val) {
                        if (val.length < 1) {
                          return '연락처를 입력하여 주세요.';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    width: 80.w,
                  ),
                  Container(
                    width: 280.w,
                    child: CustomSignupField(
                      '이름',
                          (val) {
                        setState(() {
                          this.name = val;
                        });
                      },
                          (val) {
                        if (val.length < 1) {
                          return '이름을 입력하여 주세요.';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.w,
            ),
            Container(
              width: 700.w,
              child:  CustomSignupField(
                '비밀번호',
                    (val) {
                  setState(() {
                    this.PW = val;
                  });
                },
                    (val) {
                  if (val.length < 1) {
                    return '비밀번호를 입력하여 주세요.';
                  }
                  else if(val.length < 8){
                    return '8자 이상 입력해주세요!';
                  }
                  else if (!RegExp(
                      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,16}$')
                      .hasMatch(val)) {
                    return '특수문자를 포함하여 주세요.';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 30.w,
            ),
            Container(
              width: 700.w,
              child:  CustomSignupField(
                '비밀번호 확인',
                    (val) {
                  setState(() {
                    this.confirmPW = val;
                  });
                },
                    (val) {
                  if (val.length < 1) {
                    return '비밀번호를 입력하여 주세요.';
                  }
                  if (val != this.PW){
                    return '비밀번호와 일치하지 않습니다.';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
