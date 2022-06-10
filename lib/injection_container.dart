import 'package:app_meteo/feature/meteo/injection_container.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.I;

Future<int> init() async {
  await meteoInit();

  return Future.value(0);
}
