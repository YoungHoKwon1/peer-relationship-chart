import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peer_relationship_chart/a_main/a1.dart';
import 'package:peer_relationship_chart/a_main/a6_1.dart';
import 'package:peer_relationship_chart/widjets/child_addndelete_list.dart';
import 'package:peer_relationship_chart/widjets/child_list_provider.dart';
import 'package:peer_relationship_chart/widjets/child_management.dart';
import 'package:peer_relationship_chart/widjets/get_container_info.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:peer_relationship_chart/retrofit/rest.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';


final supportedLocales = [Locale('en', 'US'), Locale('ko', 'KR')];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChildManagement(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext contextProvider) => KidList(),
        ),
        // ChangeNotifierProvider(
        //   create: (_) => ChildListProvider(),
        // )
      ],
      child: EasyLocalization(
          supportedLocales: supportedLocales,
          path: 'assets/translations',
          fallbackLocale: Locale('en', 'US'),
          child: PeerRelationshipChart()),
    ),
  );
}

class PeerRelationshipChart extends StatelessWidget {
  const PeerRelationshipChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
      designSize: const Size(1240, 790),
      builder: (ctx, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          theme: ThemeData(
            fontFamily: 'NotoSansKR',
          ),
          home: PeerRelationshipChartMain(),
        );
      });
}


class PeerRelationshipChartMain extends StatefulWidget {
  const PeerRelationshipChartMain({Key? key}) : super(key: key);

  @override
  State<PeerRelationshipChartMain> createState() =>
      _PeerRelationshipChartMainState();
}

class _PeerRelationshipChartMainState extends State<PeerRelationshipChartMain> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? userID; //user의 정보를 저장하기 위한 변수
  String? userPW;
  static final autoLoginStorage = new FlutterSecureStorage();
  final String localClientVersion = '0.0.1';

  @override
  void initState() {
    Dio dio = Dio();
    final client = RestClient(dio);
    var logger = Logger();
    super.initState();

    Future.microtask(()  async{
      final serverClientVersion = await client.getVersionInfo().catchError((Object obj){
        switch(obj.runtimeType){
          case DioError:
            final res = (obj as DioError).response;
            logger.e("Got error : ${res!.statusCode} -> ${res.statusMessage}");
            break;
          default:
            break;

        }
      });
      if(localClientVersion != serverClientVersion.version){
        ExitPopupDialog(context);
      }else{
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          _asyncMethod();
        });
      }
    });
  }

  _asyncMethod() async {
    userID = (await autoLoginStorage.read(key: "id"));
    userPW = (await autoLoginStorage.read(key: "password"));

    Dio dio = Dio();
    final client = RestClient(dio);
    var logger = Logger();
    print(userID);
    if (userID != null) {
      LoginForm loginForm = LoginForm(email: userID!, password: userPW!);
      final response = await client.postLogin(loginForm).catchError((Object obj){
        final res = (obj as DioError).response;
        switch (res!.statusCode){
          case 412: print(412);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => A1()));
          break;
          case 401: print(401);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => A1()));
          break;
          default:
            break;

        }
        return obj.response;
      });
      print("dfdfdfdfd");
      await autoLoginStorage.write(key: "signInToken", value: response.token);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => A6_1()));

    }
    else if (userID == null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => A1()));

    }
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/backgrounds/loading_page.png'),
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 80.72.w),
                  child: SvgPicture.asset('assets/icons/icon_aijoa_logo.svg'),
                  width: 156.41.w,
                  height: 115.71.w,
                ),
                Container(
                  margin: EdgeInsets.only(top: 32.57.w),
                  child: SvgPicture.asset('assets/icons/icon_treasurebox.svg'),
                  width: 287.w,
                  height: 262.w,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
void ExitPopupDialog(BuildContext context){
  showDialog(context: context, barrierDismissible: false,
      builder: (BuildContext context){
        return  AlertDialog(
            content: Text("현재 버전이 낮아 홈페이지에서 업데이트를 진행해 주세요."),
            actions: [
              Center(
                child: TextButton(
                  child: Text("예"),
                  onPressed: (){
                        ()=> exit(0);
                  },
                ),
              )
            ],
          );
  });
}