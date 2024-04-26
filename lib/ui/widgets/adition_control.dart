import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/tools/file_importers.dart';

class AditionControl extends StatelessWidget {
  final SongModel? songModel;
  AditionControl({super.key, required this.songModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(.8)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                          songModel!.title ?? "",
                          style: Theme.of(context).textTheme.bodyLarge,
                          maxLines: 1,
                          overflow: TextOverflow.visible,
                        )
                    ),
                    const SizedBox(width: 10,),
                    const LikeButton(
                      size: 25,
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                context.read<HomeCubit>().nextTo();
                              },
                              icon:const Icon(CupertinoIcons.forward_end,size: 28,)
                          ),
                          const Text("Play next",)
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                context.read<HomeCubit>().nextTo();
                              },
                              icon:const Icon(CupertinoIcons.plus_app,size: 28)
                          ),
                          const Text('Add to')
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                context.read<HomeCubit>().nextTo();
                              },
                              icon:const Icon(Icons.share_outlined,size: 28)
                          ),
                          const Text("Share")
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                context.read<HomeCubit>().nextTo();
                              },
                              icon:const Icon(CupertinoIcons.delete,size: 28)
                          ),
                          const Text("Delete")
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
