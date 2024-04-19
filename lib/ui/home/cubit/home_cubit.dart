import 'package:music_player/ui/home/cubit/home_state.dart';
import 'package:music_player/ui/widgets/adition_control.dart';
import 'package:music_player/utils/tools/file_importers.dart';

class HomeCubit extends Cubit<HomeStates> {

  HomeCubit():super(HomeInitialState()){
    getSongs();
  }

  final OnAudioQuery audioQuery = OnAudioQuery();
  List<SongModel> songs = [];
  SongModel? currentSong;
  final player = AudioPlayer();


  getSongs() async {
    try {
      emit(HomeLoadingState());
      songs = await audioQuery.querySongs();
      currentSong = songs[0];
      final playlist = ConcatenatingAudioSource(
        children: songs.map((song) => AudioSource.uri(Uri.parse(song.uri!),tag: song.id)).toList(),
      );
      await player.setAudioSource(playlist,);
      emit(HomeLoadedState(songs: songs));
    } catch(e) {
      emit(HomeErrorState(error: "Xatolik yuz berdi"));
    }
  }

  void playSong(SongModel song) {
    try {
      currentSong = song;
      player.stop();
      emit(HomeChangeState());
      int selectedSongIndex = songs.indexWhere((value) => song.id == value.id);
      if (selectedSongIndex<player.currentIndex!) {
        player.seek(Duration.zero,index:player.currentIndex!-(player.currentIndex!-selectedSongIndex).abs());
      } else {
        player.seek(Duration.zero,index: player.currentIndex!+(player.currentIndex!-selectedSongIndex).abs());
      }
      player.play();
      streamSong();
      // emit(HomeChangeState());
    } catch (e) {
      emit(HomeErrorState(error: "Xatolik yuz berdi"));
    }
  }

  void streamSong() {
    player.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        player.seek(Duration.zero, index: player.currentIndex! + 1);
      }
    });
  }

  void playPause() {
    player.playing? player.pause():player.play();
    emit(HomeChangeState());
  }

  void nextTo() {
    if (player.currentIndex==songs.length-1) {
      player.seek(Duration.zero, index: 0);
      currentSong=songs[0];
    } else  {
      player.seek(Duration.zero, index: player.currentIndex! + 1);
      int selectedSongIndex = songs.indexWhere((value) =>  player.sequenceState?.currentSource!.tag.toString() == value.id.toString())+1;
      currentSong = songs[selectedSongIndex];
    }
    player.play();
    emit(HomeChangeState());
  }

  void enableShuffleMode() {
    player.shuffleModeEnabled?player.setShuffleModeEnabled(false):player.setShuffleModeEnabled(true);
    emit(HomeChangeState());
  }

  aditionControlSheet(BuildContext context,{SongModel? songModel}) {
    return showBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: Colors.transparent,
        builder:(context) => AditionControl(songModel: songModel)
    );
  }

}