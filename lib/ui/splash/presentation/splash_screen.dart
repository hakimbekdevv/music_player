import 'package:music_player/utils/tools/file_importers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SplashPage"),
        actions: [
          IconButton(
            onPressed: () =>  context.pushReplacement(RouteNames.home),
            icon: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
