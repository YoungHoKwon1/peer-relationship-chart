import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peer_relationship_chart/b_admin/b2_1.dart';
import 'package:peer_relationship_chart/b_admin/b1_4.dart';
import '../a_main/a1.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

//Drawer
class MenuDrawer extends StatefulWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  static const autoLoginStorage = FlutterSecureStorage();
  @override
  Widget build(BuildContext contextMenuBar) {
    return Drawer(
      backgroundColor: Colors.transparent,
      //right side drawer
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30)
            ),

            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color(0xFFFAE19F),
                  Color(0xFFFFC565),
                ]
            )
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Row(children: [
              Container(//profile
                  color: Colors.transparent,// 사이즈확인용
                  margin: const EdgeInsets.fromLTRB(34, 47, 0, 0),
                  child: SvgPicture.asset('assets/icons/icon_setting.svg',
                      width: 80, height: 79.54)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(//email
                    margin: const EdgeInsets.fromLTRB(20, 77, 0, 0),
                    child:
                    const Text('Loveit@gmail.com', style: TextStyle(fontSize: 14)),
                  ),

                  Container(//name
                    margin: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: const Text('아이좋아 홍길동 선생님', style: TextStyle(fontSize: 14)),
                  )
                ],
              )
            ]),
            Container(
              margin: const EdgeInsets.fromLTRB(31.5, 47.98, 0, 0),
              child: Row(
                children: [
                  Column(
                    children: [
                      IconButton(
                          padding: const EdgeInsets.all(0.0),
                          onPressed: () => debugPrint('find'), //검색
                          icon: SvgPicture.asset(
                              './assets/icons/icon_find_mobile.svg', width: 55.32, height: 51.71)),
                      Container(
                          margin: const EdgeInsets.only(top: 8.77),
                          child: const Text('검색', style: TextStyle(fontSize: 16)))
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 45.03),
                    child: Column(
                      children: [
                        IconButton(
                            padding: const EdgeInsets.all(0.0),
                            onPressed: () => debugPrint('setting'),
                            icon: SvgPicture.asset(
                                './assets/icons/icon_setting.svg', width: 40, height: 40)),
                        Container(
                            margin: const EdgeInsets.only(top: 8.77),
                            child: const Text('설정', style: TextStyle(fontSize: 16)))
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 53.35),
                    child: Column(
                      children: [
                        IconButton(
                            padding: const EdgeInsets.all(0.0),
                            onPressed: () {
                              autoLoginStorage.delete(key: "login");
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (context) => const A1()), (route) => false);
                            },
                            icon: SvgPicture.asset(
                                './assets/icons/icon_logout_mobile.svg',width: 38.61, height: 40)),
                        Container(
                            margin: const EdgeInsets.only(top: 8.77),
                            child: const Text('로그아웃', style: TextStyle(fontSize: 16)))
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 46.0,
            ),
            ListTile(
              title: const Text('아이생활'),
              onTap: () => ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                      title: const Text('asdf'),
                      onTap: () => debugPrint('asdf')
                  ),

                ],
              ),
              trailing: const Icon(Icons.arrow_drop_down),
            ),


            ListTile(
              title: const Text('아이놀이'),
              onTap: () {
                debugPrint('아이놀이');
              },
              trailing: const Icon(Icons.arrow_drop_down),
            ),
            ListTile(
              title: const Text('계정관리'),
              onTap: () {
                debugPrint('계정관리');
                //showPopUpB1_4(contextMenuBar);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const B2_1()));
              },
              trailing: const Icon(Icons.arrow_drop_down),
            ),
          ],
        ),
      ),
    );
  }
}

/*endDrawer: Drawer( //right side drawer
        backgroundColor: Colors.amber[200],
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // 프로젝트에 assets 폴더 생성 후 이미지 2개 넣기
            // pubspec.yaml 파일에 assets 주석에 이미지 추가하기
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  // 현재 계정 이미지 set
                  child: SvgPicture.asset('./assets/icons/icon_profile.svg'),
                  backgroundColor: Colors.white,
                ),
                accountEmail: Text('Loveit@email.com', style: TextStyle(color: Colors.black)),
                accountName: Text('아이좋아 홍길동 선생님', style: TextStyle(color: Colors.black)),
                decoration: BoxDecoration(
                  color: Colors.amber[200],
                )
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(onPressed: () => print('find'),//검색
                        icon: SvgPicture.asset('./assets/icons/icon_find_mobile.svg')),
                    Text('검색')
                  ],
                ),
                Column(
                  children: [
                    IconButton(onPressed: () => print('setting'),
                        icon: SvgPicture.asset('./assets/icons/icon_setting.svg')),
                    Text('설정')
                  ],
                ),
                Column(
                  children: [
                    IconButton(onPressed: () {
                      autoLoginStorage.delete(key: "login");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => A1())
                      );
                    },
                        icon: SvgPicture.asset('./assets/icons/icon_logout_mobile.svg')),

                    Text('로그아웃')
                  ],
                )
              ],
            ),

            SizedBox(
              height: 30.0,
            ),

            ListTile(
              title: Text('아이생활'),
              onTap: () => Scaffold(),
              trailing: Icon(Icons.arrow_drop_down),
            ),

            ListTile(
              title: Text('아이놀이'),
              onTap: () {
                print('아이놀이');
              },
              trailing: Icon(Icons.arrow_drop_down),
            ),
            ListTile(
              title: Text('계정관리'),
              onTap: () {
                print('계정관리');
              },
              trailing: Icon(Icons.arrow_drop_down),
            ),
          ],
        ),
      ),*/
