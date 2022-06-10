import 'package:equatable/equatable.dart';

abstract class AFailure extends Equatable {
  const AFailure([List properties = const <dynamic>[]]);

  @override
  List<Object> get props => [];
}

class ServerFailure extends Equatable implements AFailure {
  const ServerFailure([List properties = const <dynamic>[]]);

  @override
  List<Object> get props => [];
}

class CacheFailure extends Equatable implements AFailure {
  const CacheFailure([List properties = const <dynamic>[]]);

  @override
  List<Object> get props => [];
}
