part of 'meteo_detail_cubit.dart';


enum MeteoInfoStateStatus { valid, error, unknow}

class MeteoInfoState extends Equatable {

  final String resolvedAddress;

  final double feelsLike;

  final MeteoInfoStateStatus status;

  const MeteoInfoState(
      {required this.resolvedAddress,
      required this.feelsLike,
      this.status = MeteoInfoStateStatus.valid});

  factory MeteoInfoState.fromJson(Map<String, dynamic> json) {
    return MeteoInfoState(
        resolvedAddress: json['resolvedAddress'],
        feelsLike: json['currentConditions']['feelslike'],
        status: MeteoInfoStateStatus.valid);
  }

  MeteoInfoState copyWith({
    MeteoInfoStateStatus? status,
    String? resolvedAddress,
    double? feelsLike,
  }) =>
      MeteoInfoState(
        status: status ?? this.status,
        resolvedAddress: resolvedAddress ?? this.resolvedAddress,
        feelsLike: feelsLike ?? this.feelsLike,
      );

  @override
  List<Object> get props => [feelsLike, status, resolvedAddress];
}
