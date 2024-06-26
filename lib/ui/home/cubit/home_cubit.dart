
import 'package:music_player/utils/tools/file_importers.dart';

class HomeCubit extends Cubit<HomeStates> {

  HomeCubit():super(HomeInitialState()){
    getSongs();
  }

  final OnAudioQuery audioQuery = OnAudioQuery();
  List<SongModel> songs = [];
  SongModel? currentSong;
  final player = AudioPlayer();
  Timer? _debounce;


  getSongs() async {
    try {
      emit(HomeLoadingState());
      songs = await audioQuery.querySongs();
      currentSong = songs[0];
      final playlist = ConcatenatingAudioSource(
        children: songs.map((song) => AudioSource.uri(Uri.parse(song.uri!),tag: song)).toList(),
      );

      await player.setAudioSource(playlist,);
      emit(HomeLoadedState(songs: songs));
    } catch(e) {
      print(e);
      emit(HomeErrorState(error: "Xatolik yuz berdi"));
    }
  }

  void playSong(SongModel song) {
    currentSong = song;
    player.stop();
    emit(HomeChangeState());
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      try {
        currentSong = song;
        player.stop();
        int selectedSongIndex = songs.indexWhere((value) => song.id == value.id);
        player.seek(Duration.zero, index: selectedSongIndex);
        player.play();
        emit(HomeChangeState());
        streamSong();
      } catch (e) {
        emit(HomeErrorState(error: "Xatolik yuz berdi"));
      }
    });
  }

  void streamSong() {
    player.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        nextTo();
        emit(HomeChangeState());
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
      player.seekToNext();
    }
    player.play();
    currentSong = player.sequenceState!.currentSource!.tag;
    emit(HomeChangeState());
  }

  void previous() {
    if (player.currentIndex==songs.length-1) {
      currentSong=songs[0];
    } else  {
      player.seekToPrevious();
      currentSong = currentSong = player.sequenceState!.currentSource!.tag;
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