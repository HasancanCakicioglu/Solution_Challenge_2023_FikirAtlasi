

import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Services/domain/repository/services_repository.dart';

class GetGeoFirePointUsecase{
  final ServicesRepository repository;

  GetGeoFirePointUsecase(this.repository);

  GeoFirePoint call(double latitude, double longitude){
    return repository.getGeoFirePoint(latitude, longitude);
  }
}