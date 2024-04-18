import 'package:music_player/utils/tools/file_importers.dart';

abstract class SplashStates {
  SplashStates();
}

class  SplashInitialState extends SplashStates {
  SplashInitialState();
}

class SplashLoadingState extends SplashStates {
  SplashLoadingState();
}

class SplashLoadedState extends SplashStates {
  List<SongModel> songs=[];
  SplashLoadedState({required this.songs});
}

class SplashErrorState extends SplashStates {
  String? error;
  SplashErrorState({this.error});
}




