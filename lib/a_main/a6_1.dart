import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peer_relationship_chart/a_main/a1.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class A6_1 extends StatefulWidget {
  const A6_1({Key? key}) : super(key: key);

  @override
  State<A6_1> createState() => _A6_1State();
}

class _A6_1State extends State<A6_1> {
  static final autoLoginStorage = FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/backgrounds/main_page.png'),
                )),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: ListView(
                children: [
                  Center(
                    child: SizedBox(
                      width: 350.w,
                      height: 50.w,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(const Color(0xffA666FB)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.w),
                                  ))),
                          onPressed: () {
                            autoLoginStorage.delete(key: "login");
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => A1()),
                            );
                          },
                          child: Text(
                            '로그아웃',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.w,
                                fontWeight: FontWeight.w400),
                          )),
                    ),
                  )
                ],
              ),
            )
        )
    );
  }
}
