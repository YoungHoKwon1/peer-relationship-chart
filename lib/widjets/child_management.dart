import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:peer_relationship_chart/retrofit/survey.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ChildInfoSet with ChangeNotifier{
  int identification;
  String name;
  String birthday;
  String sex;
  String comment;
  String imagePath;
  Image childFace;

  ChildInfoSet({
    required this.sex,
    required this.imagePath,
    required this.name,
    required this.comment,
    required this.identification,
    required this.childFace,
    required this.birthday,
  });
}

class ChildManagement with ChangeNotifier {
  List<ChildInfoSet> childInfos = [];
  static final autoLoginStorage = FlutterSecureStorage();



  Future<void> ChildInfos(var response) async {
    Dio dio = Dio();
    final client = RestSurveyClient(dio);
    final token = await autoLoginStorage.read(key: "signInToken");
    Map<String, dynamic> headers = {};
    headers['authorization'.toString()] = token;
    var options = BaseOptions(
      headers: headers,
    );
    Dio dio2 = Dio(options);

    for (int i = 0; i < response.length; i++) {
      print(response[i].imagePath);
      final imageResponse = await client.getChildImage(token.toString(), "/" + response[i].imagePath)
          .catchError((Object obj) {
        final res = (obj as DioError).response;
        switch (res!.statusCode) {
          case 401:
            print(401);
            break;
          case 404:
            print(404);
            break;
          case 419:
            print(419);
            break;
          case 500:
            print(500);
            break;
          default:
            break;
        }
        return obj.response;
      });
      // String  url = "http://1.249.212.198:8080/" + response[i].imagePath;
      // final http.Response imageResponseTest = (await dio2.get(url)
      //     .catchError((Object obj) {
      //   final res = (obj as DioError).response;
      //   switch (res!.statusCode) {
      //     case 401:
      //       print(401);
      //       break;
      //     case 404:
      //       print(404);
      //       break;
      //     case 419:
      //       print(419);
      //       break;
      //     case 500:
      //       print(500);
      //       break;
      //     default:
      //       break;
      //   }
      //   return obj.response;
      // }
      // )) as http.Response;
      print("null check");
      // final decodedResponse = json.decode(imageResponseTest.body);
      this.childInfos.add(ChildInfoSet(
          sex: response[i].sex,
          imagePath: response[i].imagePath,
          name: response[i].name,
          comment: response[i].comment,
          identification: response[i].identification,
          childFace: imageResponse,
          birthday: response[i].birthday));
      notifyListeners();
      print(childInfos[i].name);

    }
  }
}
