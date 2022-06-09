import 'dart:convert';

import 'package:app_meteo/core/error/a_failure.dart';
import 'package:app_meteo/feature/meteo/data/datasource/meteo_remote_datasource.dart';
import 'package:app_meteo/feature/meteo/domain/a_repository/a_meteo_repository.dart';
import 'package:app_meteo/feature/meteo/domain/entity/meteo_info.dart';
import 'package:dartz/dartz.dart';

class MeteoRepository implements AMeteoRepository {
  final String baseUrl =
      "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline";

  final String apiKey = "S86SL92MLMRU5CQHLGUV63PCS";

  @override
  Future<Either<AFailure, MeteoInfo>> getTownMeteo(town) async {

    try {
      final remoteMeteo =
          await MeteoRemoteDataSource().getRemoteTownMeteo(town);

      return Right(remoteMeteo);
    } on ServerFailure {
      return const Left(ServerFailure());
    }
  }
}
