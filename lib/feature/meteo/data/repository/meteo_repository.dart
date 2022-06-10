import 'package:app_meteo/core/error/a_failure.dart';
import 'package:app_meteo/core/network/network_info.dart';
import 'package:app_meteo/feature/meteo/data/datasource/meteo_local_datasource.dart';
import 'package:app_meteo/feature/meteo/data/datasource/meteo_remote_datasource.dart';
import 'package:app_meteo/feature/meteo/domain/a_repository/a_meteo_repository.dart';
import 'package:app_meteo/feature/meteo/domain/entity/meteo_info.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

class MeteoRepository implements AMeteoRepository {
  final String baseUrl =
      "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline";

  final String apiKey = "S86SL92MLMRU5CQHLGUV63PCS";

  final AMeteoRemoteDataSource remoteDataSource;
  final AMeteoLocalDataSource localDataSource;
  final ANetworkInfo networkInfo;

  MeteoRepository(
      {required this.localDataSource,
      required this.remoteDataSource,
      required this.networkInfo});

  @override
  Future<Either<AFailure, MeteoInfo>> getTownMeteo(town) async {
    try {
      if (await networkInfo.isConnected) {
        final remoteMeteo = await remoteDataSource.getRemoteTownMeteo(town);

        localDataSource.cacheMeteoTown(remoteMeteo);
        return Right(remoteMeteo);
      } else {
        return Right(await localDataSource.getLocalTownMeteo());
      }
    } on ServerFailure {
      return const Left(ServerFailure());
    } on CacheFailure {
      return const Left(CacheFailure());
    }
  }
}
