import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peer_relationship_chart/a_main/a1.dart';
import 'package:peer_relationship_chart/a_main/a6_1.dart';
import 'package:peer_relationship_chart/widjets/get_container_info.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final supportedLocales = [Locale('en', 'US'), Locale('ko', 'KR')];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  runApp(
    EasyLocalization(
        supportedLocales: supportedLocales,
        path: 'assets/translations',
        fallbackLocale: Locale('en', 'US'),
        child: PeerRelationshipChart()),
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
  String? userInfo; //user의 정보를 저장하기 위한 변수
  static final autoLoginStorage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    userInfo = (await autoLoginStorage.read(key: "login"));

    if (userInfo != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => A6_1()));
    } else if (userInfo == null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => A1()));
    }
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
