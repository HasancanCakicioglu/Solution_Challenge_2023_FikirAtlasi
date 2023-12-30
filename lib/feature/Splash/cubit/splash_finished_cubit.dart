import 'package:bloc/bloc.dart';

class SplashFinishedControllerCubit extends Cubit<bool> {
  SplashFinishedControllerCubit() : super(false);

  void splashFinishedAtLeastOnce() {
    emit(true);
  }
}



