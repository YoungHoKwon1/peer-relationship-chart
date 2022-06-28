import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'survey.g.dart';

@RestApi(baseUrl: 'http://1.249.212.198:8080')
abstract class RestSurveyClient{
  factory RestSurveyClient(Dio dio, {String baseUrl}) = _RestSurveyClient;

  @GET('/api/atti/report')
  Future<List<ReportInfo>> getReportInfo(
      @Header('authorization') String token,
      @Query('year') String year
      );
  @POST('/api/atti/report')
  Future<String> postStartReport(
      @Header('authorization') String token,
      @Body() String comment,
      );
  @GET('/api/atti/child')
  Future<List<ChildInfo>> getChildInfo(
      @Header('authorization') String token,
      );
  @GET('{imagePath}')
  Future<dynamic> getChildImage(
      @Header('authorization') String token,
      @Path('imagePath') String imageName,
      );
  @GET('/api/atti/child')
  Future<List<ChildInfoRid>> getChildInfoRid(
      @Header('authorization') String token,
      @Query('rid') String rid,
      );
}

@JsonSerializable()
class ReportInfo{
  int identification;
  int turn;
  int headCount;
  String? comment;
  String startDate;
  String? endDate;
  int surveyCount;

  ReportInfo({
    required this.startDate,
    required this.comment,
    required this.endDate,
    required this.identification,
    required this.turn,
    required this.headCount,
    required this.surveyCount,
});
  factory ReportInfo.fromJson(Map<String, dynamic> json)=> _$ReportInfoFromJson(json);
  Map<String, dynamic> toJson()=> _$ReportInfoToJson(this);
}

@JsonSerializable()
class ChildInfo{
  int identification;
  String name;
  String birthday;
  String sex;
  String comment;
  String imagePath;

  ChildInfo({
    required this.comment,
    required this.name,
    required this.birthday,
    required this.identification,
    required this.imagePath,
    required this.sex,
});
  factory ChildInfo.fromJson(Map<String, dynamic> json) => _$ChildInfoFromJson(json);
  Map<String, dynamic> toJson()=> _$ChildInfoToJson(this);
}

@JsonSerializable()
class ChildImage{
  dynamic image;

  ChildImage({
    required this.image,
});
  factory ChildImage.fromJson(Map<String, dynamic> json) => _$ChildImageFromJson(json);
  Map<String, dynamic> toJson()=> _$ChildImageToJson(this);
}


@JsonSerializable()
class ChildInfoRid{
  int identification;
  String name;
  String birthday;
  String sex;
  String comment;
  String imagePath;
  String surveyed;

  ChildInfoRid({
    required this.comment,
    required this.name,
    required this.birthday,
    required this.identification,
    required this.imagePath,
    required this.sex,
    required this.surveyed
  });
  factory ChildInfoRid.fromJson(Map<String, dynamic> json) => _$ChildInfoRidFromJson(json);
  Map<String, dynamic> toJson()=> _$ChildInfoRidToJson(this);
}