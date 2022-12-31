// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WasteRequestFilter _$WasteRequestFilterFromJson(Map<String, dynamic> json) =>
    WasteRequestFilter(
      pageNumber: json['pageNumber'] as int,
      pageSize: json['pageSize'] as int,
      costCenterArray: (json['costCenterArray'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      statusArray: (json['statusArray'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      roomArray: (json['roomArray'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      buildingArray: (json['buildingArray'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      requestTypeArray: (json['requestTypeArray'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      frequency: json['frequency'] as int?,
    );

Map<String, dynamic> _$WasteRequestFilterToJson(WasteRequestFilter instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'costCenterArray': instance.costCenterArray,
      'statusArray': instance.statusArray,
      'roomArray': instance.roomArray,
      'buildingArray': instance.buildingArray,
      'requestTypeArray': instance.requestTypeArray,
      'frequency': instance.frequency,
    };
