import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest.g.dart';

@RestApi(baseUrl: 'http://192.168.0.7:8080')
abstract class RestClient{

  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/api/version')
  Future<Versions> getVersionInfo();

  @POST('/api/auth/local')
  Future<LoginToken> postLogin(
      @Body() LoginForm loginForm
      );

  @POST('/api/auth/local/email')
  Future<LoginToken> postCertifyEmail(
      @Body() EmailForm emailForm
      );
  @GET('/api/auth/local/email')
  Future<LoginToken> getCertifyEmail(
      @Header('authorization') String token,
      @Query('code') String emailCode
      );

  @POST('/api/auth/local/new')
  Future<String> postSignUP(
      @Header('authorization') String token,
      @Body() SignUp signUp
      );

}

@JsonSerializable()
class Versions{
  String version;

  Versions({
    required this.version,
  });

  factory Versions.fromJson(Map<String, dynamic> json) => _$VersionsFromJson(json);

  Map<String, dynamic> toJson() => _$VersionsToJson(this);
}

@JsonSerializable()
class LoginForm{
  String email;
  String password;

  LoginForm({
    required this.email,
    required this.password,
});
  factory LoginForm.fromJson(Map<String, dynamic> json) => _$LoginFormFromJson(json);
  Map<String, dynamic> toJson() => _$LoginFormToJson(this);
}

@JsonSerializable()
class LoginToken{
  String token;


  LoginToken({
    required this.token,

});
  factory LoginToken.fromJson(Map<String, dynamic> json) => _$LoginTokenFromJson(json);
  Map<String, dynamic> toJson() => _$LoginTokenToJson(this);
}

@JsonSerializable()
class EmailForm{
  String email;

  EmailForm({
    required this.email,
});
  factory EmailForm.fromJson(Map<String, dynamic> json) => _$EmailFormFromJson(json);
  Map<String, dynamic> toJson() => _$EmailFormToJson(this);
}

@JsonSerializable()
class SignUp{
  String password;
  String name;
  String phoneNumber;

  SignUp({
    required this.password,
    required this.name,
    required this.phoneNumber
});
  factory SignUp.fromJson(Map<String, dynamic> json) => _$SignUpFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpToJson(this);
}