import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peer_relationship_chart/a_main/a2_1.dart';
import 'package:peer_relationship_chart/a_main/a4_3.dart';
import 'package:flutter_svg/flutter_svg.dart';

class A4_2 extends StatefulWidget {
  const A4_2({Key? key}) : super(key: key);

  @override
  State<A4_2> createState() => _A4_2State();
}

class _A4_2State extends State<A4_2> {
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
                          'assets/icons/icon_find_pw.svg',
                          height: 32,
                          width: 32,
                        ),
                        SizedBox(
                          width: 17.w,
                        ),
                        Text(
                          '비밀번호 찾기',
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
              AuthenticationNumberPage(key: formKey,),
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
                            if (this.formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => A4_3()),
                              );
                              print('완료');
                            }
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

class CustomFindPWField extends StatelessWidget {
  final String _text;
  final FormFieldSetter _onSaved;
  final FormFieldValidator _validator;

  const CustomFindPWField(this._text, this._onSaved, this._validator);

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

class AuthenticationNumberPage extends StatefulWidget {
  const AuthenticationNumberPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationNumberPage> createState() =>
      _AuthenticationNumberPageState();
}

class _AuthenticationNumberPageState extends State<AuthenticationNumberPage> {
  String authenticationNumber = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.key,
      child: Container(
        width: 700.w,
        height: 720.w,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 140.w,
              ),
              Container(
                width: 456.w,
                child: Text(
                  '비밀번호 재설정을 위한 임시코드가 담긴 이메일이 발송되었습니다.',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 26.w,
                    color: Color(0xff393838),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 9.w,
              ),
              Text(
                '이메일을 확인하시고 임시코드를 입력해주세요.',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.w,
                  color: Color(0xff393838),
                ),
              ),
              SizedBox(
                height: 95.w,
              ),
              Container(
                width: 55.w,
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        '05',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.w,
                          color: Color(0xff393838),
                        ),
                      ),
                      Text(
                        ':00',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.w,
                          color: Color(0xff393838),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40.w,
              ),
              SizedBox(
                width: 350.w,
                child: CustomFindPWField('코드입력', (val) {
                  setState(() {
                    this.authenticationNumber = val;
                  });
                }, (val) {
                  if (val.length < 1) {
                    return '임시코드는 필수 사항입니다.';
                  } else if (val.length != 6) {
                    return '6자리 코드를 입력해주세요.';
                  }
                  return null;
                }),
              ),
              SizedBox(
                height: 75.w,
              ),
              Container(
                width: 330.w,
                child: Row(
                  children: [
                    Text(
                      '임시코드가 발송되지 않았다면?',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.w,
                        color: Color(0xff393838),
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text('임시코드 다시받기',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.w,
                          color: Color(0xff393838),
                        ),),

                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
