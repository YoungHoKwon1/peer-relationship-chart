import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final myControllerEmailAsk = TextEditingController();
final myControllerTitleAsk = TextEditingController();
final myControllerTextAsk = TextEditingController();

//문의하기
class B9 extends StatefulWidget {
  const B9({Key? key, required this.notifyParent}) : super(key: key);
  final Function(double, double)? notifyParent;

  @override
  State<B9> createState() => _B9State();
}

class _B9State extends State<B9> {
  GlobalKey globalkeyCK = GlobalKey();

  // void initState(){
  //   WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
  //     widget.notifyParent!(getBoxSize(globalkeyCK), getBoxPosition(globalkeyCK));
  //     //print(getBoxSize(globalkeyCK));
  //     //print(getBoxPosition(globalkeyCK));
  //   });
  // }

  getBoxSize(GlobalKey key) {
    if (key.currentContext != null) {
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
  Widget build(BuildContext contextB9) {
    return Row(
      children: [
        SizedBox(width: 80.w),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Contact Us',
              style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF393838))),
          const SizedBox(height: 46),
          Container(
            margin: EdgeInsets.only(left: 264.w),
            child: Text(
                '불편하신 사항이나 문의사항이 생길 경우 메세지를 보내십시오.\n     현재 로그인 계정 이메일로 최대한 빨리 회신드리겠습니다.',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF393838))),
          ),
          const SizedBox(height: 86),
          SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 69.w),
                        child: Text('로그인 계정',
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF393838)))),
                    Container(
                        margin: EdgeInsets.only(top: 31.w),
                        child: Text('제목',
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF393838)))),
                    Container(
                        margin: EdgeInsets.only(top: 23.w),
                        child: Text('내용',
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF393838))))
                  ],
                ),
                const SizedBox(width: 26),
                Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(//로그인 계정
                      width: 640.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                              color: const Color(0xFFFDB43B), width: 1.w)),
                      child: TextField(
                        controller: myControllerEmailAsk,
                        decoration: const InputDecoration(
                            hintText: '계정 정보(수정 불가)',
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Colors.transparent))),
                      ),
                    ),
                    Container(//제목
                      margin: const EdgeInsets.only(top: 20),
                      width: 640.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                              color: const Color(0xFFFDB43B), width: 1.w)),
                      child: TextField(
                        controller: myControllerTitleAsk,
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Colors.transparent))),
                      ),
                    ),
                    Container(//내용
                      margin: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                              color: const Color(0xFFFDB43B), width: 1.w)),
                      width: 640.w,
                      height: 230.w,
                      child: TextField(
                        controller: myControllerTextAsk,
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ))),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 679, top: 24.w),
            child: ElevatedButton(
              onPressed: () {
                debugPrint('글쓰기 버튼');
                debugPrint('로그인 계정: '+myControllerEmailAsk.text);
                debugPrint('제목: '+myControllerTitleAsk.text);
                debugPrint('내용: '+myControllerTextAsk.text);
              },
              child: const Text('글쓰기',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
              style: ElevatedButton.styleFrom(
                  elevation: 1.0,
                  primary: const Color(0xFFA666FB),
                  onPrimary: const Color(0xFFFFFFFF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  fixedSize: const Size(150, 50)),
            ),
          )
        ])
      ],
    );
  }
}
