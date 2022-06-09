import 'package:app_meteo/feature/meteo/presentation/ui/page/meteo_town_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MeteoApp());
}

class MeteoApp extends StatelessWidget {
  const MeteoApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MeteoHomePage(),
    );
  }
}
