import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radsync_flutter/models/constants.dart';
import 'package:radsync_flutter/models/waste/request.dart';
import 'package:radsync_flutter/modules/api/waste_request_service.dart';
import 'waste_event.dart';
import 'waste_state.dart';

class WasteSearchBloc extends Bloc<WasteSearchEvent, WasteSearchState> {
  WasteSearchBloc(this.repository) : super(const WasteSearchState()) {
    on<WasteSearchEvent>((event, emit) async {
      await _onFilterChanged(event, emit);
    });
  }

  final WasteRequestService repository;

  Future<void> _onFilterChanged(WasteSearchEvent event, Emitter<WasteSearchState> emit) async {
    emit(state.copyWith(status: FetchStatus.loading, error: ''));
    try {
      final results = await repository.getPendingRequests(event.filter);
      emit(state.copyWith(status: FetchStatus.success, items: results.data));
    } on Exception catch (e) {
      emit(state.copyWith(status: FetchStatus.failure, error: e.toString()));
    }
  }
}
