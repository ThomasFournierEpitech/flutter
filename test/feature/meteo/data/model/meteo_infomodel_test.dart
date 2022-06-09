import 'dart:convert';

import 'package:app_meteo/feature/meteo/data/model/meteo_info_model.dart';
import 'package:app_meteo/feature/meteo/domain/entity/meteo_info.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixture/fixture.dart';

void main() {
  const meteoInfoModel =
      MeteoInfoModel(resolvedAddress: "test Text", feelsLike: 0);

  test("should be a subclass of MeteoInfo entity", () async {
    expect(meteoInfoModel, isA<MeteoInfo>());
  });

  group("fromJson", () {
    test("should return a valid model when the JSON is valid", () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture("meteo_info_fixture.json"));

      final result = MeteoInfoModel.fromJson(jsonMap);

      expect(result, meteoInfoModel);
    });
  });
}
