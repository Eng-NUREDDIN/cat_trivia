part of 'home_page_bloc.dart';

@freezed
class HomePageEvent with _$HomePageEvent {
  const factory HomePageEvent.started() = _Started;

  const factory HomePageEvent.loading() = _Loading;

  const factory HomePageEvent.done() = _Done;

  const factory HomePageEvent.error() = _Error;

  const factory HomePageEvent.getFacts() = _GetFacts;

  const factory HomePageEvent.getFavFacts() = _GetFavFacts;

  const factory HomePageEvent.getFactHistory() = _GetFactHistory;
}
