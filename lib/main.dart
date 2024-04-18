
import 'package:music_player/utils/tools/file_importers.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit(),),
        BlocProvider(create: (context) => SplashCubit(),)
      ],
      child: MaterialApp.router(
        title: 'Music Player',
        routerConfig: router,
        builder: (context, child) => BackgroundWrapper(child: child!),
        darkTheme: MyTheme.lightThemeData,
        theme: MyTheme.lightThemeData,
      ),
    );
  }
}

