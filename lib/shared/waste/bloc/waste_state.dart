import 'package:equatable/equatable.dart';
import 'package:radsync_flutter/models/waste/request.dart';

abstract class WasteSearchState extends Equatable {
  const WasteSearchState();

  @override
  List<Object> get props => [];
}

class WasteStateEmpty extends WasteSearchState {}

class WasteStateSuccess extends WasteSearchState {
  const WasteStateSuccess(this.items);

  final List<WasteRequest> items;

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'WasteStateSuccess { items: ${items.length} }';
}

class WasteStateStateLoading extends WasteSearchState {}

class WasteStateError extends WasteSearchState {
  const WasteStateError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
