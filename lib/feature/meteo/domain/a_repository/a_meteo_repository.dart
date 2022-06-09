import 'package:app_meteo/core/error/a_failure.dart';
import 'package:app_meteo/feature/meteo/domain/entity/meteo_info.dart';
import 'package:dartz/dartz.dart';

abstract class AMeteoRepository {
  Future<Either<AFailure, MeteoInfo>> getTownMeteo(String town);
}
