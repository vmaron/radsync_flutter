import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radsync_flutter/models/waste/request.dart';
import 'package:radsync_flutter/modules/api/waste_request_service.dart';
import 'waste_event.dart';
import 'waste_state.dart';

class WasteSearchBloc extends Bloc<WasteSearchEvent, WasteSearchState> {
  WasteSearchBloc(this.repository) : super(WasteStateEmpty()) {
    on<WasteSearchEvent>((event, emit) async {
      await _onFilterChanged(event, emit);
    });
  }

  final WasteRequestService repository;

  Future<void> _onFilterChanged(WasteSearchEvent event, Emitter<WasteSearchState> emit) async {
    final searchTerm = event.filter;
    emit(WasteStateStateLoading());

    try {
      final results = await repository.getPendingRequests(searchTerm);
      emit(WasteStateSuccess(results.data.cast<WasteRequest>()));
    } on Exception catch (e) {
      emit(WasteStateError(e.toString()));
    }
  }
}
