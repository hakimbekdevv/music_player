import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_player/utils/tools/file_importers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeStates>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(child: CircularProgressIndicator.adaptive(),);
        } else if (state is HomeErrorState) {
          return Center(
            child: Text(state.error!),
          );
        }
        else if (state is HomeLoadedState){
          return _myScaffold(context);
        } else {
          return const SizedBox();
        }
      },
    );
  }

  DefaultTabController _myScaffold(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 1,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                color: Colors.white10.withAlpha(100),
              ),
            ),
          ),
          elevation: 0,
          bottom: TabBar(
            dividerHeight: 0,
            labelColor: Theme.of(context).colorScheme.onPrimary,
            unselectedLabelColor: Theme.of(context).colorScheme.primary,
            indicatorColor: const Color.fromRGBO(232, 213, 19, 1.0),
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: const [
              Tab(
                child: Text("PLAYLISTS"),
              ),
              Tab(
                child: Text("TRACKS"),
              ),
              Tab(
                child: Text("ALBUMS"),
              ),
              Tab(
                child: Text("ARTISTS"),
              ),
              Tab(
                child: Text("GENRES"),
              ),
            ],
          ),
        ),
        drawer: const Drawer(),
        body: const TabBarView(
          children: [
            SizedBox(),
            TracksScreen(),
            SizedBox(),
            SizedBox(),
            SizedBox(),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: itemHeight,
          width: itemHeight,
          child: Row(
            children: [
              SizedBox(
                height: itemImageHeight,
                width: itemImageWidth,
                child: QueryArtworkWidget(
                  id: context.watch<HomeCubit>().currentSong!.id,
                  type: ArtworkType.AUDIO,
                  artworkBorder: BorderRadius.circular(0),
                  artworkFit: BoxFit.cover,
                  nullArtworkWidget: Icon(Icons.music_note),
                ),
              ),
              Text(context.watch<HomeCubit>().currentSong!.title??""),
              IconButton(
                onPressed: () {
                  context.read<HomeCubit>().playPause();
                },
                icon: !context.read<HomeCubit>().player.playing?const Icon(Icons.play_arrow_rounded):const Icon(Icons.pause),
              ),
              IconButton(
                onPressed: () {
                  context.read<HomeCubit>().enableShuffleMode();
                },
                icon: context.read<HomeCubit>(). player.shuffleModeEnabled?const Icon(Icons.shuffle):const Icon(Icons.arrow_right_alt),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
