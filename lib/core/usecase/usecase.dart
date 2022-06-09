import 'package:app_meteo/core/error/a_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UserCase<Type, Params> {
  Future<Either<AFailure, Type>> call(Params params);
}

class NoPramas extends Equatable {
  @override
  List<Object> get props => [];
}
