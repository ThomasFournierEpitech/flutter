import 'package:app_meteo/feature/meteo/presentation/ui/form/meteo_town_form/meteo_town_form.dart';
import 'package:app_meteo/feature/meteo/presentation/bloc/widget/meteo_detail_bloc/meteo_detail_cubit.dart';
import 'package:app_meteo/feature/meteo/presentation/bloc/form/meteo_town_form/meteo_town_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeteoHomePage extends StatelessWidget {
  const MeteoHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MeteodetailCubit(),
        ),
        BlocProvider(
          create: (context) => TownFormCubit(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MeteoApp'),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Container(
                  margin: const EdgeInsets.all(10.0),
                  width: 300.0,
                  child: const MeteoTownForm())
            ])),
      ),
    );
  }
}
