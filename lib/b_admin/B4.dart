import 'package:flutter/material.dart';

class B4 extends StatefulWidget {
  const B4({Key? key, required this.notifyParent}) : super(key: key);
  final Function(double, double)? notifyParent;

  @override
  State<B4> createState() => _B4State();
}

class _B4State extends State<B4> {

  GlobalKey globalkeyCK = GlobalKey();

  // void initState(){
  //   WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
  //     widget.notifyParent!(getBoxSize(globalkeyCK), getBoxPosition(globalkeyCK));
  //     //print(getBoxSize(globalkeyCK));
  //     //print(getBoxPosition(globalkeyCK));
  //     print('b4');
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
        color: Colors.green

    );
  }
}


