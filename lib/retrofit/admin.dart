import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'admin.g.dart';

@RestApi(baseUrl: 'http://192.168.0.7:8080')
abstract class RestAdminClient {
  factory RestAdminClient(Dio dio, {String baseUrl}) = _RestAdminClient;

  @POST('/api/auth/local/check')
  Future<Login2Token> postPwdCheck(
      @Header('authorization') String token,
      @Body() PwdCheckForm pwdCheckForm
      );

  @GET('/api/atti/admin')
  Future<dynamic> getAdminInfo(
      @Header('authorization') String token2,
      );
}

@JsonSerializable()
class PwdCheckForm{
  String password;
  PwdCheckForm({
    required this.password,
  });
  factory PwdCheckForm.fromJson(Map<String, dynamic> json) => _$PwdCheckFormFromJson(json);
  Map<String, dynamic> toJson() => _$PwdCheckFormToJson(this);
}

//2차 비번 인증 후 받을 2번째 토큰
@JsonSerializable()
class Login2Token{
  String token;
  Login2Token({
    required this.token,
  });
  factory Login2Token.fromJson(Map<String, dynamic> json) => _$Login2TokenFromJson(json);
  Map<String, dynamic> toJson() => _$Login2TokenToJson(this);
}

//admin정보 받을 Map
// @JsonSerializable()
// class AdminInfoList{
//   List<dynamic> admininfolist;
//   AdminInfoList({
//     required this.admininfolist
// });
//   factory AdminInfoList.fromJson(Map<String, dynamic> json) => _$AdminInfoListFromJson(json);
//   Map<String, dynamic> toJson() => _$AdminInfoListToJson(this);
// }

@JsonSerializable()
class AdminInfoMap{
  Map<String, dynamic> admininfomap;
  AdminInfoMap({
    required this.admininfomap
  });
  factory AdminInfoMap.fromJson(Map<String, dynamic> json) => _$AdminInfoMapFromJson(json);
  Map<String, dynamic> toJson() => _$AdminInfoMapToJson(this);
}
