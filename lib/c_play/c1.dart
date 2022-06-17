import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peer_relationship_chart/a_main/a1.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:peer_relationship_chart/widjets/letterbox_size.dart';
import 'package:peer_relationship_chart/widjets/menu_bar.dart';
import 'package:widget_mask/widget_mask.dart';

class C1 extends StatefulWidget {
  const C1({Key? key}) : super(key: key);

  @override
  State<C1> createState() => _C1State();
}

class _C1State extends State<C1> {
  BeforeClickChild _beforeClickChild = new BeforeClickChild(childFace: Image.asset('assets/images/C2/before_click/child10.png'));
  @override
  Widget build(BuildContext context) {
    LetterBoxSize _letterBoxSize = new LetterBoxSize(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
      2560,
      1440,
    );
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(
                top: _letterBoxSize.heightAdd! -
                    MediaQuery.of(context).padding.top,
                left: _letterBoxSize.widthAdd!,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Image.asset(
                            'assets/backgrounds/BirthdayScene_BG.png'),
                      ),
                    ),
                    Positioned(
                      top: _letterBoxSize.heightAdd! -
                          MediaQuery.of(context).padding.top,
                      left: _letterBoxSize.widthAdd!,
                      child: Container(
                        width: 40,
                        height: 40,
                        color: Colors.red,
                      ),
                    )
                  ],
                )),
            Positioned(
              child: Container(),
            ),
            // BeforeClickChild(
            //   childFace:
            //       Image.asset('assets/images/C2/before_click/child10.png'),
            )
          ],
        )
        // Container(
        //   child: ListView(
        //     children: [
        //       Container(
        //           padding: EdgeInsets.all(8),
        //           child: Row(
        //             children: [
        //               WidgetMask(
        //                 blendMode: BlendMode.srcATop,
        //                 childSaveLayer: true,
        //                 mask: Image.asset(
        //                     'assets/backgrounds/BirthdayScene_BG.png'),
        //                 child: Image.asset('assets/images/C2/head.png'),
        //               ),
        //               Container(
        //                 margin: EdgeInsets.all(8),
        //                 width: 100,
        //                 height: 100,
        //                 color: Colors.black,
        //               ),
        //               Container(
        //                 margin: EdgeInsets.all(8),
        //                 width: 100,
        //                 height: 100,
        //                 color: Colors.black,
        //               ),
        //               Container(
        //                 margin: EdgeInsets.all(8),
        //                 width: 100,
        //                 height: 100,
        //                 color: Colors.black,
        //               ),
        //             ],
        //           )),
        //       Container(
        //         padding: EdgeInsets.all(10),
        //         child: ListTile(
        //           leading:
        //               SvgPicture.asset('assets/images/profile_image_account.svg'),
        //           onTap: () {
        //             print("2");
        //           },
        //         ),
        //       ),
        //       Container(
        //         padding: EdgeInsets.all(10),
        //         child: ListTile(
        //           leading:
        //               SvgPicture.asset('assets/images/profile_image_account.svg'),
        //           onTap: () {
        //             print("3");
        //           },
        //         ),
        //       ),
        //       Container(
        //         padding: EdgeInsets.all(10),
        //         child: ListTile(
        //           leading:
        //               SvgPicture.asset('assets/images/profile_image_account.svg'),
        //           onTap: () {
        //             print("4");
        //           },
        //         ),
        //       )
        //     ],
        //   ),
        // ),

        );
  }
}

class BeforeClickChild extends StatefulWidget {
  const BeforeClickChild({
    Key? key,
    required this.childFace,
  }) : super(key: key);
  final Image childFace;

  @override
  State<BeforeClickChild> createState() => _BeforeClickChildState();
}

class _BeforeClickChildState extends State<BeforeClickChild> {
  @override
  Widget build(BuildContext context) {
    LetterBoxSize _letterBoxSize = new LetterBoxSize(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
      2560,
      1440,
    );
    return Positioned(
      top: 415 * _letterBoxSize.heightRatio! + _letterBoxSize.heightAdd!,
      left: 2380 * _letterBoxSize.widthRatio! + _letterBoxSize.widthAdd!,
      child: Stack(
        children: [
          Container(
            width: 191 * MediaQuery.of(context).size.width / 2560,
            child: Image.asset('assets/images/C2/before_click/child1.png'),
          ),
          Container(
            width: 144 * MediaQuery.of(context).size.width / 2560,
            margin: EdgeInsets.only(left: 10, top: 0),
            child: WidgetMask(
              blendMode: BlendMode.srcATop,
              childSaveLayer: true,
              mask: widget.childFace,
              child: Image.asset('assets/images/C2/head.png'),
            ),
          )
        ],
      ),
    );
  }
}
