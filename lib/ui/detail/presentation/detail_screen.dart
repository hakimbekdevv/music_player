
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../utils/tools/file_importers.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music",style: Theme.of(context).textTheme.bodyLarge,),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Flexible(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(left: 50,right: 50,bottom:  100,top: 80),
                child: QueryArtworkWidget(
                  id: context.watch<HomeCubit>().currentSong!.id,
                  type: ArtworkType.AUDIO,
                  artworkBorder: BorderRadius.circular(0),
                  artworkFit: BoxFit.cover,
                  nullArtworkWidget: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white24,
                    ),
                    child: const Icon(CupertinoIcons.music_note_2,color: Colors.white,size: 120,),
                  ),
                ),
              ),
            ),
            // SizedBox(height: 50,),
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                              context.watch<HomeCubit>().currentSong!.title ?? "",
                              style: TextStyle(color: Colors.white,fontSize: 19),
                              maxLines: 1,
                              overflow: TextOverflow.visible,
                            )
                        ),
                        const SizedBox(width: 10,),
                        LikeButton(
                          likeBuilder: (isLiked) {
                            return !isLiked?Icon(CupertinoIcons.heart,size: 30):Icon(CupertinoIcons.heart_fill,color: Colors.red,size: 30,);
                          },
                        )
                      ],
                    ),
                    Text(context.watch<HomeCubit>().currentSong!.artist ?? "",style: Theme.of(context).textTheme.bodySmall,),
                    Row(
                      children: [

                      ],
                    ),
                    // ProgressBar(
                    //   total: context.watch<HomeCubit>().player.duration!,
                    //   onSeek: (value) => context.watch<HomeCubit>().player.seek(position),
                    //
                    // )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
