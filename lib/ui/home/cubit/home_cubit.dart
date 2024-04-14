import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/ui/home/cubit/home_state.dart';
import 'package:on_audio_query/on_audio_query.dart';

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
        children: songs.map((song) => AudioSource.uri(Uri.parse(song.uri!))).toList(),
      );
      await player.setAudioSource(playlist,);
      player.play();
      emit(HomeLoadedState(songs: songs));
    } catch(e) {
      emit(HomeErrorState(error: "Xatolik yuz berdi"));
    }
  }

  void playSong(SongModel song) async {
    try {
      player.stop();
      currentSong = song;
      int selectedSongIndex = songs.indexWhere((value) => song.id == value.id);
      if (selectedSongIndex<player.currentIndex!) {
        player.seek(Duration.zero,index:player.currentIndex!-(player.currentIndex!-selectedSongIndex).abs());
      } else {
        player.seek(Duration.zero,index: player.currentIndex!+(player.currentIndex!-selectedSongIndex).abs());
      }
      streamSong();
      player.play();
      emit(HomeLoadedState(songs: songs));
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
    emit(HomeLoadedState(songs: songs));
  }


}