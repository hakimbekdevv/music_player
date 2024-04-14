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
        appBar: AppBar(
          bottom: const TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(
                child: Text("Playlists"),
              ),
              Tab(
                child: Text("Tracks"),
              ),
              Tab(
                child: Text("Albums"),
              ),
              Tab(
                child: Text("Artists"),
              ),
              Tab(
                child: Text("Genres"),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            SizedBox(),
            TracksScreen(),
            SizedBox(),
            SizedBox(),
            SizedBox(),
          ],
        ),
        bottomNavigationBar: Container(
          // color: Colors.grey,
          height: itemHeight*2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder(
                stream: context.watch<HomeCubit>().player.positionStream,
                builder: (context, snapshot) => ProgressBar(
                  thumbGlowRadius: 0,
                  thumbRadius: 5,
                  progress: snapshot.data!,
                  progressBarColor:Colors.yellow,
                  thumbColor: Colors.yellow,
                  total: context.watch<HomeCubit>().player.duration??Duration(seconds: 0),
                  onSeek: (value) {
                    context.read<HomeCubit>().player.seek(value);
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(context.watch<HomeCubit>().currentSong!.title??""),
                      IconButton(
                        onPressed: () {
                          context.read<HomeCubit>().playPause();
                        },
                        icon: !context.read<HomeCubit>().player.playing?Icon(CupertinoIcons.play_fill):Icon(CupertinoIcons.pause_fill),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<HomeCubit>().enableShuffleMode();
                        },
                        icon: context.read<HomeCubit>(). player.shuffleModeEnabled?Icon(CupertinoIcons.shuffle):Icon(CupertinoIcons.arrow_right_arrow_left),
                      ),
                    ],
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
