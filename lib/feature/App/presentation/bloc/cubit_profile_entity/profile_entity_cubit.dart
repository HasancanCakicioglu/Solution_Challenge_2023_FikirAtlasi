import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/profile_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/create_profile_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/get_profile_usecase.dart';

class ProfileEntityCubit extends Cubit<ProfileEntity> {
  ProfileEntityCubit(this.createProfileUsecase, this.getProfileUsecase)
      : super(const ProfileEntity());
  CreateProfileUsecase createProfileUsecase;
  GetProfileUsecase getProfileUsecase;

  // Profil bilgilerini güncellemek için kullanılan metod
  void updateProfile(ProfileEntity profileEntity) {
    emit(profileEntity);
  }

  Future<void> getOrSetProfile() async {
    await createProfileUsecase.call(const ProfileEntity()).then((value) async{
      value.fold((l) async{
      }, (r) async{
        if (r != null){
          final profileEntityUser = await  getProfileUsecase.call(r);
          updateProfile(profileEntityUser);
        }
      });
    });
  }
}
