import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peer_relationship_chart/a_main/a1.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:peer_relationship_chart/b_admin/b2_1.dart';
import 'package:peer_relationship_chart/c_play/c1.dart';
import 'package:peer_relationship_chart/retrofit/survey.dart';
import 'package:peer_relationship_chart/widjets/child_management.dart';
import 'package:peer_relationship_chart/widjets/menu_bar.dart';
import 'package:provider/provider.dart';


class A6_1 extends StatefulWidget {
  const A6_1({Key? key}) : super(key: key);

  @override
  State<A6_1> createState() => _A6_1State();
}

class _A6_1State extends State<A6_1> {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();//appbar없는 menubar용
  int times = 0;
  final int thisYear = DateTime.now().year;
  static final autoLoginStorage = FlutterSecureStorage();
  var response;

  @override
  void initState(){
    super.initState();
    receiveReport();
  }

  receiveReport() async {
    Dio dio = Dio();
    final client = RestSurveyClient(dio);
    final token = await autoLoginStorage.read(key: "signInToken");
    print("start");
    response = await client
        .getReportInfo(token.toString(), thisYear.toString())
        .catchError((Object obj) {
      final res = (obj as DioError).response;
      switch (res?.statusCode) {
        case 400:
          print(400);
          setState(() {});
          break;
        case 401:
          print(401);
          setState(() {});

          break;
        case 419:
          print(419);
          setState(() {});

          break;
        case 500:
          print(500);
          setState(() {});

          break;
        default:
          break;
      }
    });
    times= response.length;
    drawReport(response);
  }

  @override
  void drawReport(var response){
    setState(() {
      print("aa");
    });
  }


  @override
  Widget build(BuildContext contextA6_1) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/backgrounds/main_page.png'),
            )
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              key: _scaffoldState,

              endDrawer: MenuDrawer(),


              body: Container(
                child: Column(
                  children: [

                    Container(
                      margin: EdgeInsets.fromLTRB(1100.w, 48.19.w, 0.w, 0.w),
                      child: IconButton(onPressed: () {
                        _scaffoldState.currentState?.openEndDrawer();
                      }, icon: SvgPicture.asset('./assets/icons/icon_menu.svg', width: 33.w, height: 27.8.w)
                      ),
                    ),
                    SizedBox(
                      height: 100.w,
                    ),

                    Row(
                      children: [
                        SizedBox(
                          width: 60.w,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/icons/icon_back.svg',
                            height: 28.w,
                            width: 46.w,
                          ),
                        ),
                        Container(
                          width: 150.w,
                          child: Text(
                            thisYear.toString() + '년',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 24.w,
                              color: Color(0xff393838),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/icons/icon_next.svg',
                            height: 28.w,
                            width: 46.w,
                          ),
                        ),
                      ],
                    ),
                    ChoiceReport(response: response, time: times,),
                  ],
                ),
              ),
            )));
  }
}

class ChoiceReport extends StatefulWidget {
  const ChoiceReport({
    Key? key,
    required this.response,
    required this.time,
  }) : super(key: key);
  final response;
  final time;

  @override
  State<ChoiceReport> createState() => _ChoiceReportState();
}

class _ChoiceReportState extends State<ChoiceReport> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 330.w,
      padding: EdgeInsets.only(
        top: 40.w,
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          for (int i = 0; i < widget.time; i++)

            SurveyInfo(
              nowStatus: widget.response[i].endDate == null ? true : false,
              childHeadcount: widget.response[i].headCount,
              finishDate: widget.response[i].endDate == null ? "" : widget.response[i].endDate.toString(),
              startDate: widget.response[i].startDate,
              nowTimes: widget.response[i].turn.toString(),
              surveyEndChildCount: widget.response[i].surveyCount,
            ),
          NewSurvey(),
        ],
      ),
    );
  }
}

class SurveyInfo extends StatefulWidget {
  const SurveyInfo({
    Key? key,
    required this.childHeadcount,
    required this.startDate,
    required this.nowStatus,
    required this.nowTimes,
    required this.finishDate,
    required this.surveyEndChildCount,
  }) : super(key: key);

  final bool nowStatus;
  final String nowTimes;
  final String startDate;
  final String finishDate;
  final int childHeadcount;
  final int surveyEndChildCount;

  @override
  State<SurveyInfo> createState() => _SurveyInfoState();
}

class _SurveyInfoState extends State<SurveyInfo> {
  static final autoLoginStorage = FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      height: 300.w,
      child: InkWell(
        child: Container(
          padding: EdgeInsets.only(top: 10.w, left: 30.w),
          child: Stack(
            children: [
              widget.nowStatus == true
                  ? Image.asset(
                      'assets/images/b6-1/image_survey.png',
                      width: 216.w,
                      height: 220.w,
                    )
                  : Image.asset(
                      'assets/images/b6-1/image_survey_fin.png',
                      width: 216.w,
                      height: 220.w,
                    ),
              Container(
                padding: EdgeInsets.only(top: 20.w, left: 60.w),
                width: 190.w,
                child: Text(
                  widget.nowStatus == true ? "조사중" : "조사완료",
                  style: TextStyle(
                    fontSize: 18.w,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff393838),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 60.w, left: 60.w),
                width: 190.w,
                child: Text(
                  widget.nowTimes + "회차",
                  style: TextStyle(
                    fontSize: 18.w,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff393838),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 100.w, left: 60.w),
                width: 190.w,
                child: Text(
                  widget.startDate + ' ~ ' + widget.finishDate,
                  style: TextStyle(
                    fontSize: 18.w,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff393838),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 140.w, left: 60.w),
                width: 190.w,
                child: Text(
                  widget.surveyEndChildCount.toString() +
                      '/' +
                      widget.childHeadcount.toString() +
                      '명',
                  style: TextStyle(
                    fontSize: 18.w,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff393838),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        onTap: () async {
          Dio dio = Dio();
          final client = RestSurveyClient(dio);
          final token = await autoLoginStorage.read(key: "signInToken");
          final response = await client
              .getChildInfo(token.toString())
              .catchError((Object obj) {
            final res = (obj as DioError).response;
            switch (res!.statusCode) {
              case 401:
                print(401);
                setState(() {
                  print("401");
                });
                break;
              case 419:
                print(419);
                setState(() {
                  print("419");
                });

                break;
              case 500:
                print(500);
                setState(() {
                  print("500");
                });


                break;
              default:
                break;

            }
            return obj.response;
          });
          print("push_C1");
          for (int i = 0; i < response.length; i++) {
            print(response[i].imagePath);
            final imageResponse = await client.getChildImage(token.toString(), "/" + response[i].imagePath)
                .catchError((Object obj){
              final res = (obj as DioError).response;
              switch (res!.statusCode) {
                case 401:
                  print(401);
                  break;
                case 404:
                  print(404);
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
            })as StringCodec;

            print("null check");
            print(imageResponse);
            //String encoded = base64.encode(imageResponse);

            context.read<ChildManagement>().childInfos.add(ChildInfoSet(
                  sex: response[i].sex,
                  imagePath: response[i].imagePath,
                  name: response[i].name,
                  comment: response[i].comment,
                  identification: response[i].identification,
                  childFace: Image.asset('name'),
                  birthday: response[i].birthday));
          }

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => C1()),);
          },
      ),
    );
  }
}

class NewSurvey extends StatefulWidget {
  const NewSurvey({
    Key? key,
  }) : super(key: key);

  @override
  State<NewSurvey> createState() => _NewSurveyState();
}

class _NewSurveyState extends State<NewSurvey> {
  static final autoLoginStorage = FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      height: 300.w,
      child: InkWell(
        child: Container(
          padding: EdgeInsets.only(top: 10.w, left: 30.w),
          child: Stack(
            children: [
              Image.asset(
                'assets/images/b6-1/image_survey_fin.png',
                width: 216.w,
                height: 220.w,
              ),
              Container(
                padding: EdgeInsets.only(top: 50.w, left: 60.w),
                width: 190.w,
                child: Text(
                  "신규 생성",
                  style: TextStyle(
                    fontSize: 20.w,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff393838),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        onTap: () async {
          Dio dio = Dio();
          final client = RestSurveyClient(dio);
          final token = await autoLoginStorage.read(key: "signInToken");
          final response = await client
              .postStartReport(token.toString(), "")
              .catchError((Object obj) {
            final res = (obj as DioError).response;
            switch (res!.statusCode) {
              case 400:
                print(400);
                setState(() {
                  print("400 인원수 부족");
                });

                break;
              case 401:
                print(401);
                setState(() {
                  print("401");
                });
                break;
              case 403:
                print(403);
                setState(() {
                  print("403");
                });

                break;
              case 419:
                print(419);
                setState(() {
                  print("419");
                });

                break;
              case 500:
                print(500);
                setState(() {
                  print("500");
                });


                break;
              default:
                break;

            }
            return obj.response;
          });
          print("push_C1");
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => C1()),);

        },
      ),
    );
  }
}
