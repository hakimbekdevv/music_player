import 'package:music_player/utils/tools/file_importers.dart';





class TracksScreen extends StatelessWidget {
  const TracksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: context.watch<HomeCubit>().songs.length,
      itemBuilder: (context, index) {
        return MusicItem(songModel: context.watch<HomeCubit>().songs[index],id:context.watch<HomeCubit>().currentSong!.id);
      },
    );
  }
}
