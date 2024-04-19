
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: Column(
        children: [
          SizedBox(height: 30,),
          QueryArtworkWidget(
            id: context.watch<HomeCubit>().currentSong!.id,
            type: ArtworkType.AUDIO,
            artworkWidth: 220,
            artworkHeight: 220,
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
          SizedBox(height: 50,),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                            context.watch<HomeCubit>().currentSong!.title ?? "",
                            style: Theme.of(context).textTheme.bodyLarge,
                            maxLines: 1,
                            overflow: TextOverflow.visible,
                          )
                      ),
                      const SizedBox(width: 10,),
                      const LikeButton(
                        circleColor: CircleColor(start: Colors.green, end: Colors.black),
                        bubblesColor: BubblesColor(dotPrimaryColor: Colors.green,dotSecondaryColor: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
