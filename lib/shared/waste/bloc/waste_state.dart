import 'package:equatable/equatable.dart';
import 'package:radsync_flutter/models/constants.dart';
import 'package:radsync_flutter/models/waste/request.dart';

class WasteSearchState extends Equatable {
  const WasteSearchState({this.status = FetchStatus.initial, this.items = const [], this.error = ''});

  final FetchStatus status;
  final List<WasteRequest> items;
  final String error;

  @override
  List<Object> get props => [status, items, error];

  WasteSearchState copyWith({
    FetchStatus? status,
    List<WasteRequest>? items,
    String? error,
  }) {
    return WasteSearchState(
        status: status ?? this.status,
        items: items ?? this.items.toList(),
        error: error ?? this.error);
  }
}
