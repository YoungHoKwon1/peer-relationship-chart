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
  Future<String> getAdminInfo(
      @Header('authorization') String token2,
      // @Query('admininfo') AdminInfoForm adminInfoForm,
      // @Path('imagePath') String imageName
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

@JsonSerializable()
class Login2Token{
  String token;


  Login2Token({
    required this.token,

  });
  factory Login2Token.fromJson(Map<String, dynamic> json) => _$Login2TokenFromJson(json);
  Map<String, dynamic> toJson() => _$Login2TokenToJson(this);
}

// @JsonSerializable()
// class AdminInfoForm{
//   String email;
//   String name;
//   String phoneNumber;
//
//   AdminInfoForm({
//     required this.email,
//     required this.name,
//     required this.phoneNumber,
//   });
//   factory AdminInfoForm.fromJson(Map<String, dynamic> json) => _$AdminInfoFormFromJson(json);
//   Map<String, dynamic> toJson() => _$AdminInfoFormToJson(this);
// }
