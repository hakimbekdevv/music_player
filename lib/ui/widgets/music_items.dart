

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
      leading: QueryArtworkWidget(
        id: songModel.id,
        artworkWidth: itemImageWidth,
        artworkHeight: itemImageHeight,
        type: ArtworkType.AUDIO,
        artworkBorder: BorderRadius.circular(0),
        artworkFit: BoxFit.cover,
        nullArtworkWidget: Container(
          height: itemImageHeight,
          width: itemImageWidth,
          decoration: BoxDecoration(
            color: Colors.black12,
          ),
          child: Icon(Icons.music_note,color: Colors.white,),
        ),
      ),
      title: Text(songModel.displayNameWOExt,maxLines: 1,style: TextStyle(color: Colors.white),),
      trailing: Icon(Icons.menu),
    );
  }
}
