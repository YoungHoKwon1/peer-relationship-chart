import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peer_relationship_chart/retrofit/admin.dart';
import 'package:file_picker/file_picker.dart';
//import 'package:file_picker/file_picker.dart';

//b11_1, b11_2의 아이들 리스트뷰
class KidList extends ChangeNotifier {
  int _kidNum = 0; //총 아이 수 계산
  final autoLoginStorage = FlutterSecureStorage();
  late File imageFile;

  //textField: controller 부여
  List<List<TextEditingController>> _kidListController = List.generate(
      400, (i) => List.generate(6, (j) => TextEditingController()),
      growable: true);

  //List<bool> selected = [];
  // List<DataRow> selectedList = [];
  int selectedIndex = -1;
  List<DataRow> _rowKidList = [];
  List<DataColumn> _columnKidList = [
    // DataColumn(
    //     label: Expanded(
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: const [
    //           Text('id'),
    //         ],
    //       ),
    //     )),
    DataColumn(
        label: Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('사진'),
        ],
      ),
    )),
    DataColumn(
        label: Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('이름'),
        ],
      ),
    )),
    DataColumn(
        label: Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('생년월일'),
        ],
      ),
    )),
    DataColumn(
        label: Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('성별'),
        ],
      ),
    )),
    DataColumn(
        label: Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('코멘트'),
        ],
      ),
    )),
  ];

  List<DataRow> get rowKidList => _rowKidList;

  List<DataColumn> get columnKidList => _columnKidList;

  List<List<TextEditingController>> get kidListController => _kidListController;

  // 아이추가
  void addKid() {
    // debugPrint('생성전 아이들 수: $_kidNum');
    // _rowKidList.add(DataRow(cells: [
    //   for (int i = 0; i < 5; i++) ...[
    //       DataCell(Center(child: TextFormField(controller: kidListController[_kidNum][i],))),
    //   ],
    // ]));
    // _kidNum++;
    // debugPrint('$_kidNum번째 아이');
    // notifyListeners();
  }

  //Clean: Datatable
  void clearKid() {
    _rowKidList.clear();
  }

  //b11_1, b11_2에 쏴주는www
  void getKid(List list) {
    _kidNum++;
    PickedFile? _image;
    debugPrint('$_kidNum번째 아이');
    _rowKidList.add(DataRow(cells: [
      for (int i = 1; i < 6; i++) ...[
        if (i == 1) ...[
          DataCell(
              Center(child: list[i]),
              //onTap:
          ), //사진입력
        ] else ...[
          DataCell(Center(child: Text(list[i]))),
        ]
      ]
    ]));
    notifyListeners();
  }

  void updateKid(List list) {
    String txt = '';
    _kidNum++;
    debugPrint('$_kidNum번째 아이');
    _kidListController[_kidNum][0].text = list[0];
    _rowKidList.add(DataRow(cells: [
      for (int i = 1; i < 6; i++) ...[
        if (i == 1) ...[
          DataCell(
            Center(child: list[i]),
              //onTap: getImgFromGallery
          ), //사진입력
        ] else ...[
          DataCell(Center(
              child: TextFormField(
            decoration: InputDecoration(hintText: list[i]),
            controller: _kidListController[_kidNum][i]..text = list[i],
          ))),
        ]
      ]
    ]));
    print(_kidListController[_kidNum][0].text);
    notifyListeners();
  }

  int kidkk = 1;
  int correctionCounts = 0;
  List<String> imageFiles = [];
  List<dynamic> corrections = [];

  void saveKid(List list) async {
    //_kidNum = 0;
    bool yesDifference;
    Map<String, dynamic> mapUpdate = {};
    print(mapUpdate);
    //List<String> imageFiles = [];
    for (int i = 0; i < 6; i++) {
      if (i == 0) {
        if (_kidListController[kidkk][0].text != list[i]) {
          print('controller - id 값 불일치');
          print('${_kidListController[kidkk][0].text} 그리고 ${list[i]}');
          break;
        }
        print('id 일치: $kidkk');
      } else if (_kidListController[kidkk][i].text != list[i]) {
        bool yesDifference = true;
        print('내용 변경이 있는wwwww: $kidkk, $i');
        mapUpdate['id'] = int.parse(list[0]);
        switch (i) {
          case 1:
            print('사진수정');
            mapUpdate['imageName'] = _kidListController[kidkk][i].text;
            imageFiles.add(_kidListController[kidkk][i].text);
            print(
                '${_kidListController[kidkk][i].text}<-----------------------${list[i]}');
            break;
          case 2:
            print('이름수정');
            mapUpdate['name'] = _kidListController[kidkk][i].text;
            print(
                '${_kidListController[kidkk][i].text}<-----------------------${list[i]}');
            break;
          case 3:
            print('생일수정');
            mapUpdate['birthday'] = _kidListController[kidkk][i].text;
            print(
                '${_kidListController[kidkk][i].text}<-----------------------${list[i]}');
            break;
          case 4:
            print('성별수정');
            mapUpdate['sex'] = _kidListController[kidkk][i].text;
            print(
                '${_kidListController[kidkk][i].text}<-----------------------${list[i]}');
            break;
          case 5:
            print('코멘트수정');
            mapUpdate['comment'] = _kidListController[kidkk][i].text;
            print(
                '${_kidListController[kidkk][i].text}<-----------------------${list[i]}');
            break;
          default:
            break;
        } //switch
      } //내용 비교
      //id이후
      else {
        yesDifference = false;
        print('내용 변동 없음:  $kidkk, $i');
        //print('${_kidListController[kidkk][i].text}-----------------------${list[i]}');
      }
    } //row 하나
    if (yesDifference = true) {
      correctionCounts++;
    }
    corrections.add(mapUpdate);
    kidkk++;
    print('correction: $corrections');
    print('correctionCounts: $correctionCounts');
    print('imageFiles: $imageFiles');
    put1();
  }
  // Future<void> uploadFiles() async {
  //   // file picker를 통해 파일 여러개 선택
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);
  //
  //   if (result != null) {
  //     final filePaths = result.paths;
  //
  //     // 파일 경로를 통해 formData 생성
  //     var dio = Dio();
  //     var formData = FormData.fromMap({
  //       'files' : List.generate(filePaths,
  //               (index) => MultipartFile.fromFileSync(filePaths[index]!))
  //     });
  //
  //     // 업로드 요청
  //     final response = await dio.post('/upload', data: formData);
  //
  //   } else {
  //     // 아무런 파일도 선택되지 않음.
  //   }
  // }
  void put1() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if(result != null) {
      final filePaths = result.paths;
      Dio dio = Dio();
      var formData = FormData.fromMap({'files' : List.generate(filePaths.length, (index) => MultipartFile.fromFileSync(filePaths[index]!))});
      final client = RestAdminClient(dio);
      final token2 = await autoLoginStorage.read(key: 'signInToken');
      ChangedInfo changedInfo = ChangedInfo(
          //formData: formData,
          corrections: corrections, correctionCount: correctionCounts);
      final response = await client.putChildInfo(token2.toString(), changedInfo)
          .catchError((Object obj) {
        final res = (obj as DioError).response;
        switch (res!.statusCode) {
          case 200:
            print('200 : 성공적으로 처리되어 리소스 변경됨');
            break;
          case 401:
            print('401 : 유효하지 않은 토큰21입니다.');
            break;
          case 403:
            print('403 :거부됨. 이메일인증용 임시jwt를 여기다가 갔다쓴경우.');
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
    }
  }

  // Future getImgFromGallery() async {
  //   var image = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     File imageFile = File(pickedFile.path);
  //   }
  // }
}
