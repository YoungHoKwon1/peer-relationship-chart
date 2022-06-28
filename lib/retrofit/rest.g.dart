// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Versions _$VersionsFromJson(Map<String, dynamic> json) => Versions(
      version: json['version'] as String,
    );

Map<String, dynamic> _$VersionsToJson(Versions instance) => <String, dynamic>{
      'version': instance.version,
    };

LoginForm _$LoginFormFromJson(Map<String, dynamic> json) => LoginForm(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginFormToJson(LoginForm instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

LoginToken _$LoginTokenFromJson(Map<String, dynamic> json) => LoginToken(
      token: json['token'] as String,
    );

Map<String, dynamic> _$LoginTokenToJson(LoginToken instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

EmailForm _$EmailFormFromJson(Map<String, dynamic> json) => EmailForm(
      email: json['email'] as String,
    );

Map<String, dynamic> _$EmailFormToJson(EmailForm instance) => <String, dynamic>{
      'email': instance.email,
    };

SignUp _$SignUpFromJson(Map<String, dynamic> json) => SignUp(
      password: json['password'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$SignUpToJson(SignUp instance) => <String, dynamic>{
      'password': instance.password,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://1.249.212.198:8080';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Versions> getVersionInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Versions>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/version',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Versions.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LoginToken> postLogin(loginForm) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(loginForm.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LoginToken>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/auth/local',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginToken.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LoginToken> postCertifyEmail(emailForm) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(emailForm.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LoginToken>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/auth/local/email',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginToken.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LoginToken> getCertifyEmail(token, emailCode) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'code': emailCode};
    final _headers = <String, dynamic>{r'authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LoginToken>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/auth/local/email',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginToken.fromJson(_result.data!);
    return value;
  }

  @override
  Future<String> postSignUP(token, signUp) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(signUp.toJson());
    final _result = await _dio.fetch<String>(_setStreamType<String>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/api/auth/local/new',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
