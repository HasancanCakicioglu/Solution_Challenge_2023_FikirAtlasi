import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardFinishedControllerCubit extends Cubit<bool> {
  OnBoardFinishedControllerCubit() : super(false);

  void onBoardFinished() {
    emit(true);
  }
}