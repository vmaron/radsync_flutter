import 'package:json_annotation/json_annotation.dart';
part 'filter.g.dart';

@JsonSerializable()
class WasteRequestFilter {
  final int pageNumber;
  final int pageSize;
  final List<String>? costCenterArray;
  final List<String>? statusArray;
  final List<String>? roomArray;
  final List<String>? buildingArray;
  final List<String>? requestTypeArray;
  final int? frequency;

  WasteRequestFilter(
      {required this.pageNumber,
        required this.pageSize,
        this.costCenterArray,
        this.statusArray,
        this.roomArray,
        this.buildingArray,
        this.requestTypeArray,
        this.frequency});

  factory WasteRequestFilter.fromJson(Map<String, dynamic> json) => _$WasteRequestFilterFromJson(json);
  Map<String, dynamic> toJson() => _$WasteRequestFilterToJson(this);
}