import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peer_relationship_chart/widjets//child_addndelete_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../retrofit/admin.dart';

//아이 수정
final _kidAddFormKey = GlobalKey<FormState>(); //TextFormField key // 추가된 아이들 수
const autoLoginStorage = FlutterSecureStorage();

void update(BuildContext context) async {
  Dio dio = Dio();
  final client = RestAdminClient(dio);
  final token = await autoLoginStorage.read(
      key: "signInToken");
  final response = await client
      .getChildInfo(token.toString())
      .catchError((Object obj) {
    final res = (obj as DioError).response;
    switch (res!.statusCode) {
      case 401:
        print('401 : 유효하지 않은 토큰21입니다.');
        break;
      case 419:
        print('419 : 토큰이 만료되었습니다.');
        break;
      case 500:
        print('500 : 서버 에러.');
        break;
      default:
        break;
    }
    return obj.response;
  });
  Provider.of<KidList>(context, listen: false).clearKid();
  for (Map value in response) {
    List<dynamic> list1 = [];
    Map<String, String> headers = new Map();
    headers['authorization'] = token!;
    Image childImage = Image.network(
      "http://192.168.0.7:8080/" +
          value['imagePath'],
      headers: headers,
      height: 70.w,
      width: 70.w,
      fit: BoxFit.cover,
    );
    list1.add(childImage);
    list1.add(value['name']);
    list1.add(value['birthday']);
    list1.add(value['sex']);
    list1.add(value['comment']);
    Provider.of<KidList>(context, listen: false).updateKid(list1); //provider 송금
    //print('update: ${Provider.of<KidList>(context, listen: false).rowKidList}');
  }
}

void showPopUpB11_2_Update(context) {

  showDialog(
      context: context,
      builder: (BuildContext contextB11_2_Update) {
        return ChangeNotifierProvider<KidList>(
          create: (_) => KidList(),
          builder: (contextProvider, child) {
            return Dialog(
              backgroundColor: Colors.transparent,
              child: SingleChildScrollView(
                child: Container(
                    width: 1000,
                    height: 550,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFFCF9F4)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(414.w, 47.w, 0.w, 0.w),
                          child: Text('아이 수정', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w400, color: const Color(0xFF393838)),
                          ),
                        ),
                        SingleChildScrollView(
                            child: Container(
                                width: 959.w,
                                height: 275.w,
                                margin: EdgeInsets.only(top: 30.w, left: 20.w),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(
                                        color: const Color(0xFFFBB348),
                                        width: 1.w)),
                                child: ListView(
                                    children: [
                                  Form(
                                    key: _kidAddFormKey,
                                    child: DataTable(
                                        columnSpacing: 24.w,
                                        headingRowColor:
                                        MaterialStateProperty.all(
                                            const Color(0xFFFED796)),
                                        dataRowHeight: 40.w,
                                        headingRowHeight: 40.w,
                                        columns:
                                        //Provider.of<KidList>(contextProvider).columnKidList,
                                        contextProvider.watch<KidList>().columnKidList,
                                        rows:
                                        //Provider.of<KidList>(contextProvider).rowKidList
                                        contextProvider.watch<KidList>().rowKidList
                                    ),
                                  ),
                                ]
                                )
                            )
                        ),
                        SizedBox(height: 42.w),
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                          Container(
                            //margin: EdgeInsets.only(left: 155.w),
                            child: ElevatedButton(
                              onPressed: () {
                                debugPrint('수정');
                              },
                              child: const Text('수정', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                              style: ElevatedButton.styleFrom(
                                  elevation: 1.0,
                                  primary: const Color(0xFFFFFFFF),
                                  onPrimary: const Color(0xFF393838),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  side: const BorderSide(
                                      color: Color(0xFFA666FB)),
                                  fixedSize: const Size(150, 50)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 50.w),
                            child: ElevatedButton(
                              onPressed: () {
                                debugPrint('불러오기');
                                update(contextProvider);
                                //Navigator.pop(contextB11_2_Update); //result 반영 dialog 종료
                              },
                              child: const Text('불러오기',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400)),
                              style: ElevatedButton.styleFrom(
                                  elevation: 1.0,
                                  primary: const Color(0xFFFFFFFF),
                                  onPrimary: const Color(0xFF393838),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  side: const BorderSide(
                                      color: Color(0xFFA666FB)),
                                  fixedSize: const Size(150, 50)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 50.w),
                            child: ElevatedButton(
                              onPressed: () {
                                debugPrint('저장');
                                Navigator.pop(contextB11_2_Update); //result 반영 dialog 종료
                              },
                              child: const Text('저장',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400)),
                              style: ElevatedButton.styleFrom(
                                  elevation: 1.0,
                                  primary: const Color(0xFFFFFFFF),
                                  onPrimary: const Color(0xFF393838),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  side: const BorderSide(
                                      color: Color(0xFFA666FB)),
                                  fixedSize: const Size(150, 50)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 50.w),
                            child: ElevatedButton(
                              onPressed: () {
                                debugPrint('취소');
                                Navigator.pop(
                                    contextB11_2_Update); //result 반영 dialog 종료
                              },
                              child: const Text('취소',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400)),
                              style: ElevatedButton.styleFrom(
                                  elevation: 1.0,
                                  primary: const Color(0xFFFFFFFF),
                                  onPrimary: const Color(0xFF393838),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  side: const BorderSide(
                                      color: Color(0xFFA666FB)),
                                  fixedSize: const Size(150, 50)),
                            ),
                          )
                        ])
                      ],
                    )

                ),
              ),
            );
          });
      });
}
