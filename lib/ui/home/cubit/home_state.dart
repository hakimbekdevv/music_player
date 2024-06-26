import 'package:music_player/utils/tools/file_importers.dart';

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



