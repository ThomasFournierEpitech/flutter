import 'package:app_meteo/Data/__repository/meteo_repository.dart';
import 'package:app_meteo/_Domain/entity/meteo_info.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'meteo_detail_state.dart';

class MeteodetailCubit extends Cubit<MeteoInfoState> {
  MeteodetailCubit()
      : super(const MeteoInfoState(
            feelsLike: 0,
            resolvedAddress: "",
            status: MeteoInfoStateStatus.unknow));

  MeteoRepository meteoRepository = MeteoRepository();

  void getTown(town) async {
    try {
      final MeteoInfo meteoInfo = (await meteoRepository.fetchMeteo(town));
      emit(state.copyWith(resolvedAddress: meteoInfo.resolvedAddress, feelsLike: meteoInfo.feelsLike, status: MeteoInfoStateStatus.valid));
      emit(state.copyWith(status: MeteoInfoStateStatus.unknow));
    } on Exception catch (_) {
      emit(MeteoInfoState(
          resolvedAddress: town,
          feelsLike: 0,
          status: MeteoInfoStateStatus.error));
    }
  }
}
