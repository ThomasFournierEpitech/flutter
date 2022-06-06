import 'package:equatable/equatable.dart';

class MeteoInfo extends Equatable {

  final String resolvedAddress;

  final double feelsLike;


  const MeteoInfo(
      {required this.resolvedAddress,
      required this.feelsLike,
      });

  factory MeteoInfo.fromJson(Map<String, dynamic> json) {
    return MeteoInfo(
        resolvedAddress: json['resolvedAddress'],
        feelsLike: json['currentConditions']['feelslike'],
        );
  }

  @override
  List<Object> get props => [feelsLike, resolvedAddress];
}
