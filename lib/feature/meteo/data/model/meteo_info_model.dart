import 'package:app_meteo/feature/meteo/domain/entity/meteo_info.dart';
import 'package:equatable/equatable.dart';

class MeteoInfoModel extends MeteoInfo {
  const MeteoInfoModel({
    required String resolvedAddress,
    required double feelsLike,
  }) : super(resolvedAddress: resolvedAddress, feelsLike: feelsLike);

  factory MeteoInfoModel.fromJson(Map<String, dynamic> json) {
    return MeteoInfoModel(
      resolvedAddress: json['resolvedAddress'],
      feelsLike: (json['currentConditions']['feelslike'] as num).toDouble(),
    );
  }
}