

import '../../utils/tools/file_importers.dart';

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
