import 'package:app_meteo/core/network/network_info.dart';
import 'package:app_meteo/feature/meteo/data/datasource/meteo_local_datasource.dart';
import 'package:app_meteo/feature/meteo/data/datasource/meteo_remote_datasource.dart';
import 'package:app_meteo/feature/meteo/data/repository/meteo_repository.dart';
import 'package:app_meteo/feature/meteo/domain/a_repository/a_meteo_repository.dart';
import 'package:app_meteo/feature/meteo/domain/usecase/get_town_meteo_usecase.dart';
import 'package:app_meteo/feature/meteo/presentation/bloc/widget/meteo_detail_bloc/meteo_detail_cubit.dart';
import 'package:app_meteo/injection_container.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<int> meteoInit() async {
  //External
  sl.registerSingleton(http.Client());
  sl.registerSingleton(Connectivity());
  sl.registerSingleton(await SharedPreferences.getInstance());

  //Core
  sl.registerSingleton<ANetworkInfo>(NetworkInfo(connecitonChecker: sl()));
  // //Datasource
  sl.registerSingleton<AMeteoRemoteDataSource>(
      MeteoRemoteDataSource(client: sl()));
  sl.registerSingleton<AMeteoLocalDataSource>(
      MeteoLocalDataSource(storage: sl()));

  sl.registerSingleton<AMeteoRepository>(MeteoRepository(
      localDataSource: sl(), remoteDataSource: sl(), networkInfo: sl()));

  sl.registerSingleton<GetTownMeteoUsecase>(
      GetTownMeteoUsecase(meteoRepository: sl(), remoteDataSource: sl()));
  // //Bloc
  sl.registerFactory<MeteodetailCubit>(
      () => MeteodetailCubit(meteoRepository: sl(), getTownMeteoUsecase: sl()));

  return Future.value(0);
}
