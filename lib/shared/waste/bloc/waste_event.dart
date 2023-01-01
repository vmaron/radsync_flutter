import 'package:equatable/equatable.dart';
import 'package:radsync_flutter/models/waste/filter.dart';

class WasteSearchEvent extends Equatable {
  const WasteSearchEvent({required this.filter});

  final WasteRequestFilter filter;

  @override
  List<Object> get props => [filter];

  @override
  String toString() => 'Filter changed: ${filter.toJson()}';
}
