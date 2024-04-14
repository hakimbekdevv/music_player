import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/data/constants/constants.dart';
import 'package:music_player/ui/home/cubit/home_cubit.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicItem extends StatelessWidget {
  final SongModel songModel;
  MusicItem({super.key, required this.songModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.read<HomeCubit>().playSong(songModel);
      },
      title: Text(songModel.displayNameWOExt,maxLines: 1,),
      trailing: Icon(Icons.menu),
    );
  }
}
