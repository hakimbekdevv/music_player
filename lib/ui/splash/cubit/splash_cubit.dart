
import '../../../utils/tools/file_importers.dart';

class SplashCubit extends Cubit<SplashStates>{
  SplashCubit():super(SplashInitialState()){
    // init();
  }

  void init() async {
    await Future.delayed(Duration(seconds: 3));
  }

}