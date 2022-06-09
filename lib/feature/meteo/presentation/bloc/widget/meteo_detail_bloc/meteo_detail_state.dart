part of 'meteo_detail_cubit.dart';

enum MeteoInfoStateStatus { valid, error, unknow }

abstract class MeteoInfoState extends Equatable {
  final String searchTown;

  final String resolvedAddress;

  final double feelsLike;

  const MeteoInfoState({
    required this.resolvedAddress,
    required this.feelsLike,
    required this.searchTown,
  });

  @override
  List<Object> get props => [feelsLike, resolvedAddress, searchTown];
}

class Unknow extends MeteoInfoState {
  const Unknow(
      {required feelsLike, required resolvedAddress, required searchTown})
      : super(
            feelsLike: feelsLike,
            resolvedAddress: resolvedAddress,
            searchTown: searchTown);
}

class Loading extends MeteoInfoState {
  const Loading(String searchTown)
      : super(
            feelsLike: double.nan,
            resolvedAddress: "undefined",
            searchTown: searchTown);
}

class Loaded extends MeteoInfoState {
  const Loaded(
      {required feelsLike, required resolvedAddress, required searchTown})
      : super(
            feelsLike: feelsLike,
            resolvedAddress: resolvedAddress,
            searchTown: searchTown);
}

class Error extends MeteoInfoState {
  const Error({required searchTown})
      : super(
            feelsLike: double.nan,
            resolvedAddress: "undefined",
            searchTown: searchTown);
}
