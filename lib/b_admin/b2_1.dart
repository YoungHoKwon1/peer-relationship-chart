// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peer_relationship_chart/b_admin/B4.dart';
import 'package:peer_relationship_chart/b_admin/b10.dart';
import 'package:peer_relationship_chart/b_admin/b1_4.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peer_relationship_chart/b_admin/b3.dart';
import 'package:peer_relationship_chart/b_admin/b5_1.dart';
import 'package:peer_relationship_chart/b_admin/b6_1.dart';
import 'package:peer_relationship_chart/b_admin/b7_1.dart';
import 'package:peer_relationship_chart/b_admin/b8_1.dart';
import 'package:peer_relationship_chart/b_admin/b9.dart';
import 'package:dio/dio.dart';
import 'package:peer_relationship_chart/retrofit/admin.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:peer_relationship_chart/widjets/child_addndelete_list_provider.dart';
import 'package:provider/provider.dart';
import '../widjets/menu_bar.dart';
import 'b11_1.dart';
import 'b2_1_basic.dart';

const adminInfoStorage = FlutterSecureStorage();

class B2_1 extends StatefulWidget {
  static int nowMenuNumber = 0;

  const B2_1({Key? key}) : super(key: key);

  @override
  State<B2_1> createState() => _B2_1State();
}

class _B2_1State extends State<B2_1> {
  double boxHeight = 0;
  double boxYPosition = 0;

  void changePage(int clickPage) {
    setState(() {
      B2_1.nowMenuNumber = clickPage;
    });
  }

  void pageSizeUpdate(double _boxHeight, double _boxYPosition) {
    setState(() {
      boxHeight = _boxHeight;
      boxYPosition = _boxYPosition;
    });
  }

  adminTabLink(Function(double, double) _pageSizeState, int _nowPage) {
    //위젯내용 저장소
    var adminTabLinkList = [
      B2_1_Basic(notifyParent: _pageSizeState), //계정정보
      B3(notifyParent: _pageSizeState), //아이좋아 서비스 구매
      B4(notifyParent: _pageSizeState), //권한부여 및 삭제
      B5_1(notifyParent: _pageSizeState), //유치원 반 목록
      B6_1(notifyParent: _pageSizeState), //유치원 선생님들
      B11_1(notifyParent: _pageSizeState), //유치원 아이들
      B8_1(notifyParent: _pageSizeState), //유치원 학부모님들
      B9(notifyParent: _pageSizeState), //문의하기
      B10(notifyParent: _pageSizeState), //우리유치원 통계
      B7_1(notifyParent: _pageSizeState) //알림기록
    ];
    return (adminTabLinkList[_nowPage]);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration.zero, () => showPopUpB1_4(context)); //시작시 회원정보확인 팝업창
    setState(() {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    });
  }

  @override
  Widget build(BuildContext contextB2_1) {
    GlobalKey<ScaffoldState> _scaffoldState =
        GlobalKey<ScaffoldState>(); //appbar없는 menubar용
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'info_basic',
      theme: ThemeData(fontFamily: 'NotoSansKR'),
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xFFFCF9F4),
          key: _scaffoldState,
          endDrawer: const MenuDrawer(),
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Row(
              //전체 배경 Row
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  //회사로고, 계정정보
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        //회사로고, 계정정보
                        color: Colors.red,
                        width: 177.51.w,
                        height: 88.51.w,
                        margin: EdgeInsets.fromLTRB(36.49.w, 40.49.w, 0.w, 0.w),
                        child: //Image.asset('img', width: 177.51, height: 88.51),
                            const Text("회사로고")),
                    SizedBox(height: 30.w),
                    Container(
                        width: 250.w,
                        height: 630.w,
                        //margin: EdgeInsets.only(top: 35.w),
                        padding: EdgeInsets.only(bottom: 45.w),
                        decoration: const BoxDecoration(
                          color: Color(0xFFFED796),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                        ),
                        child: ListViewInfo(notifyParent: changePage))
                  ],
                ),
                // Container(width: 47.w),
                Column(
                  //우측 정보창
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      //메뉴바
                      //color: Colors.red,
                      margin: EdgeInsets.fromLTRB(892.w, 48.19..w, 0.w, 0.w),
                      child: IconButton(
                          onPressed: () =>
                              _scaffoldState.currentState?.openEndDrawer(),
                          icon: SvgPicture.asset('./assets/icons/icon_menu.svg',
                              width: 33.w, height: 27.8.w)),
                    ),
                    adminTabLink(pageSizeUpdate, B2_1.nowMenuNumber),
                    SizedBox(height: 50.w)
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

//사용자에 따라 다른 listview
class ListViewInfo extends StatefulWidget {
  const ListViewInfo({Key? key, required this.notifyParent}) : super(key: key);
  final Function(int)? notifyParent;

  @override
  State<ListViewInfo> createState() => _ListViewInfoState();
}

class _ListViewInfoState extends State<ListViewInfo> {
  ListView infoListView = ListView();
  String userType = 'teacherx';
  var menuListSuper = [
    '계정정보',
    '아이좋아 서비스 구매',
    '권한부여 및 해제',
    '유치원 반목록',
    '유치원 선생님들',
    '유치원 아이들',
    '유치원 학부모님들',
    '문의하기',
    '우리유치원 통계',
    '알림기록'
  ]; //체크리스트는 나중에 추가하기로

  var menuListTeacher = [
    '계정정보',
    '우리반 아이들',
    '우리반 학부모들',
    '체크리스트',
    '우리반 통계',
    '알림기록'
  ];

  @override
  Widget build(BuildContext contextMenuList) {
    return ListView(
      children: <Widget>[
        Container(
          //color: Colors.white,
          padding: EdgeInsets.only(top: 30.w, bottom: 31.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (int i = 0; i < menuListSuper.length; i++) ...[
                if (i == B2_1.nowMenuNumber) ...[
                  ChangeNotifierProvider<KidList>(
                      create: (_) => KidList(),
                      builder: (contextProvider, child) {
                        return TextButton(
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.only(bottom: 35)),
                          onPressed: () async {
                            if (i == 5) {
                              //유치원 아이들
                              //print('유치원 아이들 클릭');
                              //childInfo(contextProvider);
                              Dio dio = Dio();
                              final client = RestAdminClient(dio);
                              final token = await autoLoginStorage.read(key: "signInToken");
                              //print('token: $token');
                              final response =
                                  await client.getChildInfo(token.toString()).catchError((Object obj) {
                                final res = (obj as DioError).response;
                                switch (res!.statusCode) {
                                  case 401:
                                    print('401 : 유효하지 않은 토큰21입니다.');
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
                              //print(response.runtimeType);//List<dynamic>
                              //print('response: $response');
                              Provider.of<KidList>(context, listen: false).clearKid();
                              print('최초 _rowKidList: ${Provider.of<KidList>(context, listen: false).rowKidList}');
                              for (Map value in response) {
                                //print(value);         // {identification: 1, name: 권민정, birthday: 2016-12-07, sex: 남, comment: 잘웃음, imagePath: api/atti/image/6세 김서우_1657070632194.jpg}
                                //print(value.values);  // (1, 권민정, 2016-12-07, 남, 잘웃음, api/atti/image/6세 김서우_1657070632194.jpg)
                                //print(value.values.runtimeType);
                                List list1 = value.values.toList();//List<dynamic>
                                //print(list1.runtimeType);
                                //print('list1: $list1');
                                // contextProvider.read<KidList>().getKid(list1);
                                Provider.of<KidList>(context, listen: false).getKid(list1);
                                print('');
                              }
                              print('최종 _rowKidList: ${Provider.of<KidList>(context, listen: false).rowKidList}');
                              widget.notifyParent!(i);
                            }
                            widget.notifyParent!(i);
                          },
                          child: Text(menuListSuper[i],
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w900,
                                  color: const Color(0xFF5C5C5C))),
                        );
                      })
                ] else if (i != B2_1.nowMenuNumber) ...[
                  TextButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(bottom: 35)),
                    onPressed: () {
                      widget.notifyParent!(i);
                    },
                    child: Text(menuListSuper[i],
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF5C5C5C))),
                  )
                ]
              ]
            ],
          ),
        )
      ],
    );
  }
}

void childInfo(contextProvider) async {
  // Dio dio = Dio();
  // final client = RestAdminClient(dio);
  // final token = await autoLoginStorage.read(key: "signInToken");
  // //print('token: $token');
  // final response =
  //     await client.getChildInfo(token.toString()).catchError((Object obj) {
  //   final res = (obj as DioError).response;
  //   switch (res!.statusCode) {
  //     case 401:
  //       print('401 : 유효하지 않은 토큰21입니다.');
  //       break;
  //     case 419:
  //       print('419 : 토큰이 만료되었습니다.');
  //       break;
  //     case 500:
  //       print('500 : 서버 에러.');
  //       break;
  //     default:
  //       break;
  //   }
  //   return obj.response;
  // });
  // //print('response: $response');
  // for (Map value in response) {
  //   //print(value);         // {identification: 1, name: 권민정, birthday: 2016-12-07, sex: 남, comment: 잘웃음, imagePath: api/atti/image/6세 김서우_1657070632194.jpg}
  //   //print(value.values);  // (1, 권민정, 2016-12-07, 남, 잘웃음, api/atti/image/6세 김서우_1657070632194.jpg)
  //   List list1 = value.values.toList();
  //   print(list1);
  //   contextProvider.read<KidList>().getKid(list1);
  // }
}
