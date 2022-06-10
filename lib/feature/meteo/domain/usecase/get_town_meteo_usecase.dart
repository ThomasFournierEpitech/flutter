import 'package:app_meteo/core/error/a_failure.dart';
import 'package:app_meteo/core/usecase/usecase.dart';
import 'package:app_meteo/feature/meteo/data/datasource/meteo_remote_datasource.dart';
import 'package:app_meteo/feature/meteo/domain/a_repository/a_meteo_repository.dart';
import 'package:app_meteo/feature/meteo/domain/entity/meteo_info.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetTownMeteoUsecase implements UserCase<MeteoInfo, Params> {
  final AMeteoRepository meteoRepository;

  final AMeteoRemoteDataSource remoteDataSource;


  GetTownMeteoUsecase(
      {required this.meteoRepository, required this.remoteDataSource});

  @override
  Future<Either<AFailure, MeteoInfo>> call(Params params) async {
    return await meteoRepository.getTownMeteo(params.town);
  }
}

class Params extends Equatable {
  const Params({
    required this.town,
  });

  final String town;

  @override
  List<Object> get props => [town];
}
