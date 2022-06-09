import 'package:equatable/equatable.dart';

class MeteoInfo extends Equatable {
  final String resolvedAddress;

  final double feelsLike;

  const MeteoInfo({
    required this.resolvedAddress,
    required this.feelsLike,
  });

  @override
  List<Object> get props => [feelsLike, resolvedAddress];
}
