// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportInfo _$ReportInfoFromJson(Map<String, dynamic> json) => ReportInfo(
      startDate: json['startDate'] as String,
      comment: json['comment'] as String?,
      endDate: json['endDate'] as String?,
      identification: json['identification'] as int,
      turn: json['turn'] as int,
      headCount: json['headCount'] as int,
      surveyCount: json['surveyCount'] as int,
    );

Map<String, dynamic> _$ReportInfoToJson(ReportInfo instance) =>
    <String, dynamic>{
      'identification': instance.identification,
      'turn': instance.turn,
      'headCount': instance.headCount,
      'comment': instance.comment,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'surveyCount': instance.surveyCount,
    };

ChildInfo _$ChildInfoFromJson(Map<String, dynamic> json) => ChildInfo(
      comment: json['comment'] as String,
      name: json['name'] as String,
      birthday: json['birthday'] as String,
      identification: json['identification'] as int,
      imagePath: json['imagePath'] as String,
      sex: json['sex'] as String,
    );

Map<String, dynamic> _$ChildInfoToJson(ChildInfo instance) => <String, dynamic>{
      'identification': instance.identification,
      'name': instance.name,
      'birthday': instance.birthday,
      'sex': instance.sex,
      'comment': instance.comment,
      'imagePath': instance.imagePath,
    };

ChildImage _$ChildImageFromJson(Map<String, dynamic> json) => ChildImage(
      image: json['image'],
    );

Map<String, dynamic> _$ChildImageToJson(ChildImage instance) =>
    <String, dynamic>{
      'image': instance.image,
    };

ChildInfoRid _$ChildInfoRidFromJson(Map<String, dynamic> json) => ChildInfoRid(
      comment: json['comment'] as String,
      name: json['name'] as String,
      birthday: json['birthday'] as String,
      identification: json['identification'] as int,
      imagePath: json['imagePath'] as String,
      sex: json['sex'] as String,
      surveyed: json['surveyed'] as String,
    );

Map<String, dynamic> _$ChildInfoRidToJson(ChildInfoRid instance) =>
    <String, dynamic>{
      'identification': instance.identification,
      'name': instance.name,
      'birthday': instance.birthday,
      'sex': instance.sex,
      'comment': instance.comment,
      'imagePath': instance.imagePath,
      'surveyed': instance.surveyed,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestSurveyClient implements RestSurveyClient {
  _RestSurveyClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://192.168.0.7:8080';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<ReportInfo>> getReportInfo(token, year) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'year': year};
    final _headers = <String, dynamic>{r'authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ReportInfo>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/atti/report',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => ReportInfo.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<String> postStartReport(token, comment) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = comment;
    final _result = await _dio.fetch<String>(_setStreamType<String>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/api/atti/report',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<List<ChildInfo>> getChildInfo(token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ChildInfo>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/atti/child',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => ChildInfo.fromJson(i as Map<String, dynamic>))
        .toList();
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

  @override
  Future<List<ChildInfoRid>> getChildInfoRid(token, rid) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'rid': rid};
    final _headers = <String, dynamic>{r'authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ChildInfoRid>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/atti/child',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => ChildInfoRid.fromJson(i as Map<String, dynamic>))
        .toList();
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
