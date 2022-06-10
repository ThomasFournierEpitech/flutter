import 'dart:convert';

import 'package:app_meteo/core/error/a_failure.dart';
import 'package:app_meteo/feature/meteo/data/model/meteo_info_model.dart';
import 'package:app_meteo/feature/meteo/domain/entity/meteo_info.dart';
import 'package:http/http.dart' as http;

abstract class AMeteoRemoteDataSource {
  Future<MeteoInfoModel> getRemoteTownMeteo(town);
}

class MeteoRemoteDataSource implements AMeteoRemoteDataSource {
  final String baseUrl =
      "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline";

  final String apiKey = "S86SL92MLMRU5CQHLGUV63PCS";

  final http.Client client;

  MeteoRemoteDataSource({required this.client});

  @override
  Future<MeteoInfoModel> getRemoteTownMeteo(town) async {
    try {
      final String url =
          "$baseUrl/$town?unitGroup=metric&key=$apiKey&contentType=json";
      final response = await client.get(Uri.parse(url));
      final remoteMeteo = MeteoInfoModel.fromJson(jsonDecode(response.body));

      return remoteMeteo;
    } on Exception {
      throw const ServerFailure();
    }
  }
}
