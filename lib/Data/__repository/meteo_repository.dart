import 'dart:convert';

import 'package:app_meteo/_Domain/entity/meteo_info.dart';
import 'package:http/http.dart' as http;

class MeteoRepository {
  final String baseUrl =
      "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline";

  final String apiKey = "S86SL92MLMRU5CQHLGUV63PCS";


  Future<MeteoInfo> fetchMeteo(town) async {
    final String url =
        "$baseUrl/$town?unitGroup=metric&key=$apiKey&contentType=json";
    final response = await http.get(Uri.parse(url));
    final meteo = MeteoInfo.fromJson(jsonDecode(response.body));

    return meteo;
  }
}
