import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'admin.g.dart';
//flutter pub run build_runner build
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

  @GET('/api/atti/child')
  Future<dynamic> getChildInfo(
      @Header('authorization') String token,
      );
  @GET('{imagePath}')
  Future<dynamic> getChildImage(
      @Header('authorization') String token,
      @Path('imagePath') String imageName,
      );
  @PUT('/api/atti/child')
  Future<dynamic> putChildInfo(
      @Header('authorization') String token2,
      @Body() ChangedInfo changedInfo
      );
}

@JsonSerializable()
class ChangedInfo {
  //FormData formData;
  List<dynamic> corrections;
  int correctionCount;
  ChangedInfo({
    //required this.formData,
    required this.corrections,
    required this.correctionCount
  });
  factory ChangedInfo.fromJson(Map<String, dynamic> json) => _$ChangedInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ChangedInfoToJson(this);
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


