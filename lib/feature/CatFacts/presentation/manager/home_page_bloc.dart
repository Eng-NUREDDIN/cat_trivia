import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cat_trivia/core/AppConstants/string_constant.dart';
import 'package:cat_trivia/feature/CatFacts/domain/entities/cat_fact_entity.dart';
import 'package:cat_trivia/feature/CatFacts/domain/use_cases/get_fact_history.dart';
import 'package:cat_trivia/feature/CatFacts/domain/use_cases/get_fact_use_case.dart';
import 'package:cat_trivia/feature/CatFacts/domain/use_cases/get_fav_facts.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'home_page_event.dart';

part 'home_page_state.dart';

part 'home_page_bloc.freezed.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  GetFactUseCase getFactsUseCase;

  HomePageBloc(this.getFactsUseCase) : super(HomePageState.initial()) {
    on<HomePageEvent>((event, emit) async {
      if (event is _$_Started) {
        emit(HomePageState.initial());
      } else if (event is _$_Loading) {
        emit(state.copyWith(loading: true, done: false));
      } else if (event is _$_Done) {
        emit(state.copyWith(loading: false, done: true));
      } else if (event is _$_GetFacts) {
        await _getFacts(event, emit);
      } else if (event is _$_GetFavFacts) {
        await _getFavFacts(event, emit);
      } else if (event is _$_GetFactHistory) {
        await _getFactHistory(event, emit);
      }
    });
  }

  Future<FutureOr<void>> _getFacts(
      HomePageEvent event, Emitter<HomePageState> emit) async {
    emit(state.copyWith(index: 0, loading: true, done: false));
    final result = await getFactsUseCase();
    result.fold((l) => emit(state.copyWith(error: l.errorModel.errorMessage)),
        (r) => emit(state.copyWith(catFact: r, done: true, loading: false)));
  }

  //_getFavFacts
  _getFactHistory(HomePageEvent event, Emitter<HomePageState> emit) async {
    emit(state.copyWith(index: 2));
    final result = await GetFactHistory().call();
    emit(state.copyWith(facts: result, index: 2));
  }

  //_getFactHistory
  _getFavFacts(HomePageEvent event, Emitter<HomePageState> emit) async {
    emit(state.copyWith(index: 1));
    final result = await GetFaveFacts().call();
    emit(state.copyWith(favFacts: result, index: 1));
  }

  //add to fave
  addToFave(CatFactEntity catFactEntity) async {
    final box =  Hive.box<CatFactEntity>('fave');
    box.add(catFactEntity);
  }
}
