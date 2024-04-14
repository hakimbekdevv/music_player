import 'package:on_audio_query/on_audio_query.dart';

abstract class HomeStates {
  HomeStates();
}

class  HomeInitialState extends HomeStates {
  HomeInitialState();
}

class HomeLoadingState extends HomeStates {
  HomeLoadingState();
}

class HomeLoadedState extends HomeStates {
  List<SongModel> songs=[];
  HomeLoadedState({required this.songs});
}

class HomeChangeState extends HomeStates {
  HomeChangeState();
}

class HomeErrorState extends HomeStates {
  String? error;
  HomeErrorState({this.error});
}

enum BaseStates{errorState,loadingState,loadedState,changeState}


