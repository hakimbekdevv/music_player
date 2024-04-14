import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/cubit/home_cubit.dart';
import '../../home/presentation/widgets/music_items.dart';

class TracksScreen extends StatelessWidget {
  const TracksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: context.watch<HomeCubit>().songs.length,
      itemBuilder: (context, index) {
        return MusicItem(songModel: context.watch<HomeCubit>().songs[index],);
      },
    );
  }
}
