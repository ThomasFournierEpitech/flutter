import 'package:app_meteo/feature/meteo/data/datasource/meteo_remote_datasource.dart';
import 'package:app_meteo/feature/meteo/domain/a_repository/a_meteo_repository.dart';
import 'package:app_meteo/feature/meteo/domain/entity/meteo_info.dart';
import 'package:app_meteo/feature/meteo/domain/usecase/get_town_meteo_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockMeteoRepository extends Mock implements AMeteoRepository {
  MockMeteoRepository();
}

void main() async {
  late GetTownMeteoUsecase usecase;
  late MockMeteoRepository mockMeteoRepository;
  final AMeteoRemoteDataSource remoteDataSource =
      MeteoRemoteDataSource(client: http.Client());

  setUp(() {
    mockMeteoRepository = MockMeteoRepository();
    usecase = GetTownMeteoUsecase(
        remoteDataSource: remoteDataSource,
        meteoRepository: mockMeteoRepository);
  });

  const String town = "Paris";
  const MeteoInfo tTown = MeteoInfo(resolvedAddress: "Paris", feelsLike: 0);

  test("should get town meteo for the town from repository", () async {
    // //arrange
    when(() => mockMeteoRepository.getTownMeteo(any()))
        .thenAnswer((_) async => const Right(tTown));

    // //act
    final result = await usecase(const Params(town: town));
    // //assert
    expect(result, const Right(tTown));
    verify(() => mockMeteoRepository.getTownMeteo(town));
    verifyNoMoreInteractions(mockMeteoRepository);
  });
}
