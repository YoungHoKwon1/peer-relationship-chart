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
  final int childs = 29;
  List<bool> _visibility = List.generate(0, (index) => true);
  List<bool> _visibilityAfter = List.generate(0, (index) => true);
  int childCount = 0;

  void _changeHide(int listNumber, bool objectStatus) {
    if (childCount > 4) {
      return;
    }
    setState(() {
      _visibility[listNumber] = false;
      _visibilityAfter[listNumber] = true;
      childCount++;
    });
  }

  void _changeShow(int listNumber, bool objectStatus){
    setState(() {
      _visibility[listNumber] = true;
      _visibilityAfter[listNumber] = false;
      childCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<BeforeClickChild> _beforeClickChild = [];
    List<AfterClickChild> _afterClickChild = [];
    for (int i = 0; i < childs; i++) {
      _visibility.add(true);
      _beforeClickChild.add(BeforeClickChild(
        childFace: Image.asset('assets/images/C2/before_click/child1.png'),
        visibility: _visibility[i],
        notifyParent: _changeHide,
        childImageNumber: i,
      ));

      _visibilityAfter.add(true);
      _afterClickChild.add(AfterClickChild(
        childFace: Image.asset('assets/images/C2/before_click/child1.png'),
        notifyParent: _changeShow,
        visibility: _visibilityAfter[i],
        childImageNumber: i,
        clickCount: childCount,));
      print("fff");
    }
    LetterBoxSize _letterBoxSize = new LetterBoxSize(
      MediaQuery
          .of(context)
          .size
          .width,
      MediaQuery
          .of(context)
          .size
          .height,
      2560,
      1440,
    );
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(
                top: _letterBoxSize.heightAdd! -
                    MediaQuery
                        .of(context)
                        .padding
                        .top,
                left: _letterBoxSize.widthAdd!,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height,
                        child: Image.asset(
                            'assets/backgrounds/BirthdayScene_BG.png'),
                      ),
                    ),
                  ],
                )),
            for (int i = 0; i < childs; i++) _beforeClickChild[i],
            Positioned(
              top:
              670 * _letterBoxSize.heightRatio! + _letterBoxSize.heightAdd!,
              left:
              1080 * _letterBoxSize.widthRatio! + _letterBoxSize.widthAdd!,
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      width: 168 * MediaQuery
                          .of(context)
                          .size
                          .width / 2560,
                      child:
                      Image.asset('assets/images/C2/mainChild/child30.png'),
                    ),
                    Container(
                      width: 144 * MediaQuery
                          .of(context)
                          .size
                          .width / 2560,
                      margin: EdgeInsets.only(left: 4, top: 42),
                      child: WidgetMask(
                        blendMode: BlendMode.srcATop,
                        childSaveLayer: true,
                        mask: Image.asset(
                            'assets/images/C2/mainChild/child30.png'),
                        child: Image.asset('assets/images/C2/head.png'),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class BeforeClickChild extends StatefulWidget {
  const BeforeClickChild({
    Key? key,
    required this.childFace,
    required this.notifyParent,
    required this.visibility,
    required this.childImageNumber,
  }) : super(key: key);
  final Image childFace;
  final Function(int, bool)? notifyParent;
  final bool visibility;
  final int childImageNumber;

  @override
  State<BeforeClickChild> createState() => _BeforeClickChildState();
}

class _BeforeClickChildState extends State<BeforeClickChild> {
  List<String> imageUrl = [
    'assets/images/C2/before_click/child1.png',
    'assets/images/C2/before_click/child2.png',
    'assets/images/C2/before_click/child30.png',
    'assets/images/C2/before_click/child3.png',
    'assets/images/C2/before_click/child4.png',
    'assets/images/C2/before_click/child5.png',
    'assets/images/C2/before_click/child6.png',
    'assets/images/C2/before_click/child8.png',
    'assets/images/C2/before_click/child9.png',
    'assets/images/C2/before_click/child10.png',
    'assets/images/C2/before_click/child11.png',
    'assets/images/C2/before_click/child12.png',
    'assets/images/C2/before_click/child13.png',
    'assets/images/C2/before_click/child14.png',
    'assets/images/C2/before_click/child15.png',
    'assets/images/C2/before_click/child16.png',
    'assets/images/C2/before_click/child17.png',
    'assets/images/C2/before_click/child18.png',
    'assets/images/C2/before_click/child19.png',
    'assets/images/C2/before_click/child20.png',
    'assets/images/C2/before_click/child21.png',
    'assets/images/C2/before_click/child22.png',
    'assets/images/C2/before_click/child23.png',
    'assets/images/C2/before_click/child24.png',
    'assets/images/C2/before_click/child25.png',
    'assets/images/C2/before_click/child26.png',
    'assets/images/C2/before_click/child27.png',
    'assets/images/C2/before_click/child28.png',
    'assets/images/C2/before_click/child29.png',
  ];

  List<List<double>> childImageInfo = [
    [10, 191, 270, 2400, 420],
    [10, 184, 286, 2200, 380],
    [0, 170, 322, 1950, 400],
    [1, 205, 274, 1695, 600],
    [7, 178, 279, 2150, 605],
    [13, 197, 280, 1780, 830],
    [3, 196, 318, 1740, 1010],
    [5, 181, 292, 2390, 970],
    [10, 208, 300, 2195, 825],
    [13, 206, 295, 1970, 980],
    [0, 194, 295, 1930, 650],
    [0, 196, 291, 2410, 690],
    [0, 196, 273, 1710, 340],
    [12, 179, 275, 1500, 490],
    [20, 213, 290, 1290, 400],
    [3, 180, 265, 1150, 530],
    [19.5, 200, 294, 980, 360],
    [0, 186, 276, 900, 530],
    [13.5, 174, 275, 710, 440],
    [10.5, 196, 268, 500, 400],
    [0, 199, 269, 540, 620],
    [5.5, 187, 286, 270, 560],
    [3, 170, 282, 100, 400],
    [0, 191, 288, 20, 590],
    [22.5, 204, 286, 70, 790],
    [6.5, 186, 275, 330, 770],
    [21.5, 202, 305, 520, 870],
    [12, 188, 300, 280, 950],
    [16, 189, 300, 50, 1000],
  ];

  @override
  Widget build(BuildContext context) {
    print("ddfdf");
    LetterBoxSize _letterBoxSize = new LetterBoxSize(
      MediaQuery
          .of(context)
          .size
          .width,
      MediaQuery
          .of(context)
          .size
          .height,
      2560,
      1440,
    );
    return Positioned(
      top: childImageInfo[widget.childImageNumber][4] *
          _letterBoxSize.heightRatio! +
          _letterBoxSize.heightAdd!,
      left: childImageInfo[widget.childImageNumber][3] *
          _letterBoxSize.widthRatio! +
          _letterBoxSize.widthAdd!,
      child: InkWell(
        child: Visibility(
          child: Stack(
            children: [
              Container(
                width: childImageInfo[widget.childImageNumber][1] *
                    MediaQuery
                        .of(context)
                        .size
                        .width /
                    2560,
                child: Image.asset(imageUrl[widget.childImageNumber]),
              ),
              Container(
                width: 144 * MediaQuery
                    .of(context)
                    .size
                    .width / 2560,
                margin: EdgeInsets.only(
                    left: childImageInfo[widget.childImageNumber][0], top: 0),
                child: WidgetMask(
                  blendMode: BlendMode.srcATop,
                  childSaveLayer: true,
                  mask: widget.childFace,
                  child: Image.asset('assets/images/C2/head.png'),
                ),
              )
            ],
          ),
          visible: widget.visibility,
        ),
        onTap: () {
          setState(() {
            print("hide");
            widget.notifyParent!(widget.childImageNumber, false);
            print(widget.visibility);
          });
        },
      ),
    );
  }
}

class AfterClickChild extends StatefulWidget {
  const AfterClickChild({
    Key? key,
    required this.childFace,
    required this.notifyParent,
    required this.visibility,
    required this.childImageNumber,
    required this.clickCount,
  }) : super(key: key);
  final Image childFace;
  final Function(int, bool)? notifyParent;
  final bool visibility;
  final int childImageNumber;
  final int clickCount;

  @override
  State<AfterClickChild> createState() => _AfterClickChildState();
}

class _AfterClickChildState extends State<AfterClickChild> {

  List<String> imageUrl = [
    'assets/images/C2/after_click/child1.png',
    'assets/images/C2/after_click/child2.png',
    'assets/images/C2/after_click/child30.png',
    'assets/images/C2/after_click/child3.png',
    'assets/images/C2/after_click/child4.png',
    'assets/images/C2/after_click/child5.png',
    'assets/images/C2/after_click/child6.png',
    'assets/images/C2/after_click/child8.png',
    'assets/images/C2/after_click/child9.png',
    'assets/images/C2/after_click/child10.png',
    'assets/images/C2/after_click/child11.png',
    'assets/images/C2/after_click/child12.png',
    'assets/images/C2/after_click/child13.png',
    'assets/images/C2/after_click/child14.png',
    'assets/images/C2/after_click/child15.png',
    'assets/images/C2/after_click/child16.png',
    'assets/images/C2/after_click/child17.png',
    'assets/images/C2/after_click/child18.png',
    'assets/images/C2/after_click/child19.png',
    'assets/images/C2/after_click/child20.png',
    'assets/images/C2/after_click/child21.png',
    'assets/images/C2/after_click/child22.png',
    'assets/images/C2/after_click/child23.png',
    'assets/images/C2/after_click/child24.png',
    'assets/images/C2/after_click/child25.png',
    'assets/images/C2/after_click/child26.png',
    'assets/images/C2/after_click/child27.png',
    'assets/images/C2/after_click/child28.png',
    'assets/images/C2/after_click/child29.png',
  ];

  List<double> childImageInfo = [4, 168, 279];

  List<List<double>> childImageLocation = [
    [670, 1250],
    [670, 750],
    [670, 1500],
    [670, 500],
    [670, 1750],
  ];

  @override
  Widget build(BuildContext context) {
    print("dd");
    LetterBoxSize _letterBoxSize = new LetterBoxSize(
      MediaQuery
          .of(context)
          .size
          .width,
      MediaQuery
          .of(context)
          .size
          .height,
      2560,
      1440,
    );
    return Positioned(
      top: childImageLocation[widget.clickCount][0] *
          _letterBoxSize.heightRatio! +
          _letterBoxSize.heightAdd!,
      left: childImageLocation[widget.clickCount][1] *
          _letterBoxSize.widthRatio! +
          _letterBoxSize.widthAdd!,
      child: InkWell(
        child: Visibility(
          child: Stack(
            children: [
              Container(
                width: childImageInfo[1] *
                    MediaQuery
                        .of(context)
                        .size
                        .width /
                    2560,
                child: Image.asset(imageUrl[widget.childImageNumber]),
              ),
              Container(
                width: 144 * MediaQuery
                    .of(context)
                    .size
                    .width / 2560,
                margin: EdgeInsets.only(
                    left: childImageInfo[0], top: 0),
                child: WidgetMask(
                  blendMode: BlendMode.srcATop,
                  childSaveLayer: true,
                  mask: widget.childFace,
                  child: Image.asset('assets/images/C2/head.png'),
                ),
              )
            ],
          ),
          visible: true,
        ),
        onTap: () {
          setState(() {
            print("hide");
            widget.notifyParent!(widget.childImageNumber, false);
            print(widget.visibility);
          });
        },
      ),
    );
  }
}
