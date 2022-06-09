import 'package:app_meteo/feature/meteo/domain/a_repository/a_meteo_repository.dart';
import 'package:app_meteo/feature/meteo/domain/entity/meteo_info.dart';
import 'package:app_meteo/feature/meteo/domain/usecase/get_town_meteo_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMeteoRepository extends Mock implements AMeteoRepository {
  MockMeteoRepository();
}

class Cat {
  String sound() => "Meow";
  bool eatFood(String food, {required bool hungry}) => true;
  Future<void> chew() async => print("Chewing...");
  int walk(List<String> places) => 7;
  void sleep() {}
  void hunt(String place, String prey) {}
  int lives = 9;
}

// Mock class
class MockCat extends Mock implements Cat {}

void main() async {
  late GetTownMeteoUsecase usecase;
  late MockMeteoRepository mockMeteoRepository;

  setUp(() {
    mockMeteoRepository = MockMeteoRepository();
    usecase = GetTownMeteoUsecase(mockMeteoRepository);
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
