part of 'home_page_bloc.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default(StringConstant.catFactEntity) CatFactEntity catFact,
    bool? loading,
    String? error,
    bool? done,
    @Default(0) int index,
    List<CatFactEntity>? facts,
    List<CatFactEntity>? favFacts,
  }) = _HomePageState;

  factory HomePageState.initial() => const HomePageState(
      catFact: StringConstant.catFactEntity,
      loading: false,
      error: '',
      done: false,
      index: 0,
      facts: [],
      favFacts: []);
}
