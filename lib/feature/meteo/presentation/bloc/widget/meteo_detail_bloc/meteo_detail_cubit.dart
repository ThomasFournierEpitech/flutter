import 'package:app_meteo/core/error/a_failure.dart';
import 'package:app_meteo/feature/meteo/domain/a_repository/a_meteo_repository.dart';
import 'package:app_meteo/feature/meteo/domain/entity/meteo_info.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'meteo_detail_state.dart';

class MeteodetailCubit extends Cubit<MeteoInfoState> {
  MeteodetailCubit({required this.meteoRepository})
      : super(const Unknow(
            resolvedAddress: "undefined",
            feelsLike: double.nan,
            searchTown: "undefined"));

  AMeteoRepository meteoRepository;

  void getTown(String town) async {
    final Either<AFailure, MeteoInfo> meteoInfo =
        (await meteoRepository.getTownMeteo(town));
    meteoInfo.fold((l) {
      emit(Error(searchTown: town));
    }, (r) {
      emit(Loaded(
          resolvedAddress: r.resolvedAddress,
          feelsLike: r.feelsLike,
          searchTown: town));
      emit(Unknow(
          resolvedAddress: r.resolvedAddress,
          feelsLike: r.feelsLike,
          searchTown: town));
    });
  }
}
