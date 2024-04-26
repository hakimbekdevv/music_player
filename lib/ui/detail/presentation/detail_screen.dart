
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
                  artworkWidth: double.infinity,
                  artworkHeight: double.infinity,
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
                    SizedBox(height:20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(CupertinoIcons.plus_app,size: 30,),
                        ),
                        IconButton(
                          onPressed: () {
                          },
                          icon: Icon(CupertinoIcons.waveform_path_ecg,size: 30,),
                        ),
                        IconButton(
                          onPressed: () {
                            context.watch<HomeCubit>().aditionControlSheet(context,songModel: context.watch<HomeCubit>().currentSong);
                          },
                          icon: Icon(Icons.more_horiz_outlined,size: 30,),
                        ),
                      ],
                    ),
                    SizedBox(height:20,),
                    StreamBuilder(
                      stream: context.watch<HomeCubit>().player.positionStream,
                      builder: (context, snapshot) => ProgressBar(
                        thumbGlowRadius: 0,
                        thumbRadius: 5,
                        progress: snapshot.data??Duration(seconds: 0),
                        progressBarColor:Colors.yellow,
                        thumbColor: Colors.yellow,
                        total: context.watch<HomeCubit>().player.duration??Duration(seconds: 0),
                        onSeek: (value) {
                          context.read<HomeCubit>().player.seek(value);
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            context.read<HomeCubit>().enableShuffleMode();
                          },
                          icon: context.read<HomeCubit>(). player.shuffleModeEnabled?const Icon(Icons.shuffle):const Icon(Icons.repeat),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  context.read<HomeCubit>().nextTo();
                                },
                                icon:Icon(CupertinoIcons.backward_end_fill,size: 32,)
                            ),
                            SizedBox(width: 20,),
                            IconButton(
                              onPressed: () {
                                context.read<HomeCubit>().playPause();
                              },
                              icon: !context.read<HomeCubit>().player.playing?
                              const Icon(CupertinoIcons.play_fill,size: 32,)
                                  :const Icon(CupertinoIcons.pause_fill,size: 32,),
                            ),
                            SizedBox(width: 20,),
                            IconButton(
                                onPressed: () {
                                  context.read<HomeCubit>().nextTo();
                                },
                                icon:Icon(CupertinoIcons.forward_end_fill,size: 32,)
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            context.read<HomeCubit>().enableShuffleMode();
                          },
                          icon: Icon(CupertinoIcons.bell),
                        ),
                      ],
                    )
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
