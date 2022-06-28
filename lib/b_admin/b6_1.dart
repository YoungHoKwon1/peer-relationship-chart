// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class B6_1 extends StatefulWidget {
  const B6_1({Key? key, required this.notifyParent}) : super(key: key);
  final Function(double, double)? notifyParent;

  @override
  State<B6_1> createState() => _B6_1State();
}

class _B6_1State extends State<B6_1> {

  GlobalKey globalkeyCK = GlobalKey();

  // void initState(){
  //   WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
  //     widget.notifyParent!(getBoxSize(globalkeyCK), getBoxPosition(globalkeyCK));
  //     //print(getBoxSize(globalkeyCK));
  //     //print(getBoxPosition(globalkeyCK));
  //     print('b6_1');
  //   });
  // }

  getBoxSize(GlobalKey key){
    if(key.currentContext != null){
      final RenderBox renderBox =
      key.currentContext!.findRenderObject() as RenderBox;
      final double sizeY = renderBox.size.height;
      return sizeY;
    }
  }
  getBoxPosition(GlobalKey key) {
    if (key.currentContext != null) {
      final RenderBox renderBox =
      key.currentContext!.findRenderObject() as RenderBox;
      final double positionY = renderBox.localToGlobal(Offset.zero).dy;
      return positionY;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        key: globalkeyCK,
        width: 200,
        height: 400,
        color: Colors.purple

    );
  }
}


