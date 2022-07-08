// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PwdCheckForm _$PwdCheckFormFromJson(Map<String, dynamic> json) => PwdCheckForm(
      password: json['password'] as String,
    );

Map<String, dynamic> _$PwdCheckFormToJson(PwdCheckForm instance) =>
    <String, dynamic>{
      'password': instance.password,
    };

Login2Token _$Login2TokenFromJson(Map<String, dynamic> json) => Login2Token(
      token: json['token'] as String,
    );

Map<String, dynamic> _$Login2TokenToJson(Login2Token instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

AdminInfoMap _$AdminInfoMapFromJson(Map<String, dynamic> json) => AdminInfoMap(
      admininfomap: json['admininfomap'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$AdminInfoMapToJson(AdminInfoMap instance) =>
    <String, dynamic>{
      'admininfomap': instance.admininfomap,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestAdminClient implements RestAdminClient {
  _RestAdminClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://192.168.0.7:8080';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Login2Token> postPwdCheck(token, pwdCheckForm) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(pwdCheckForm.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Login2Token>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/auth/local/check',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Login2Token.fromJson(_result.data!);
    return value;
  }

  @override
  Future<dynamic> getAdminInfo(token2) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'authorization': token2};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/api/atti/admin',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> getChildInfo(token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/api/atti/child',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> getChildImage(token, imageName) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '$imageName',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
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
