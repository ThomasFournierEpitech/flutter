import 'dart:convert';

import 'package:app_meteo/core/error/a_failure.dart';
import 'package:app_meteo/feature/meteo/data/model/meteo_info_model.dart';
import 'package:app_meteo/feature/meteo/domain/entity/meteo_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AMeteoLocalDataSource {
  Future<MeteoInfo> getLocalTownMeteo();
  Future<void> cacheMeteoTown(MeteoInfoModel town);
}

class MeteoLocalDataSource implements AMeteoLocalDataSource {
  SharedPreferences storage;

  MeteoLocalDataSource({required this.storage});

  @override
  Future<MeteoInfo> getLocalTownMeteo() async {
    try {
      final String? json = storage.getString("meteoTown");
      late Map<String, dynamic> jsonParsed;

      if (json != null) {
        jsonParsed = jsonDecode(json);
      } else {
        throw const CacheFailure();
      }
      final meteoInfo = MeteoInfoModel.fromJson(jsonParsed);
      return Future.value(meteoInfo);
    } on Exception {
      throw const CacheFailure();
    }
  }

  @override
  Future<void> cacheMeteoTown(MeteoInfoModel meteoInfo) async {
    storage.setString('meteoTown', jsonEncode(meteoInfo.toJson()));
  }
}
