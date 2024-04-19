

import 'package:flutter/cupertino.dart';

import '../../utils/tools/file_importers.dart';

class MusicItem extends StatelessWidget {
  final SongModel songModel;
  final int id;
  MusicItem({super.key, required this.songModel, required this.id});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: itemHeight+10,
      child: ListTile(
        splashColor: Colors.transparent,
        onTap: () {
          context.read<HomeCubit>().playSong(songModel);
        },
        enabled: true,
        subtitle: Text(songModel.artist??"",maxLines: 1,style: TextStyle(color: id==songModel.id?Colors.yellow:Colors.white,fontSize: Theme.of(context).textTheme.bodySmall!.fontSize),),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
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
            decoration: const BoxDecoration(
              color: Colors.black12,
            ),
            child: const Icon(CupertinoIcons.music_note_2,color: Colors.white,size: 30,),
          ),
        ),
        title: Text(songModel.title??"",maxLines: 1,style: TextStyle(color: id==songModel.id?Colors.yellow:Colors.white,fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize),),
        trailing: IconButton(
          onPressed: () {
            context.read<HomeCubit>().aditionControlSheet(context,songModel: songModel);
          },
          icon: Icon(Icons.more_vert,color: Theme.of(context).iconTheme.color,),
        ),
      ),
    );
  }
}
