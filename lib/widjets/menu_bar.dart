import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../a_main/a1.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

//AppBar
class MenuAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  State<MenuAppBar> createState() => _MenuAppBarState();
  //
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60.0);


}

class _MenuAppBarState extends State<MenuAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0, // appbar 입체감 조절
      automaticallyImplyLeading: false,
      actions: [
        Builder(builder: (context) { //우측 아이콘에 drawer 적용
          return IconButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              icon: SvgPicture.asset('./assets/icons/icon_menu.svg'));
        }
        )
      ],
    );
  }
}

//Drawer
class MenuDrawer extends StatefulWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  static final autoLoginStorage = FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Drawer( //right side drawer
      backgroundColor: Colors.amber[200],
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // 프로젝트에 assets 폴더 생성 후 이미지 2개 넣기
          // pubspec.yaml 파일에 assets 주s석에 이미지 추가하기
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
                  IconButton(onPressed: () {autoLoginStorage.delete(key: "login");
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


