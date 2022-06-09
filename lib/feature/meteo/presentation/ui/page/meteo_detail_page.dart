import 'package:app_meteo/feature/meteo/presentation/ui/widget/meteo_detail_widget/meteo_detail_widget.dart';
import 'package:app_meteo/feature/meteo/presentation/bloc/widget/meteo_detail_bloc/meteo_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeteoDetailPage extends StatelessWidget {
  final String town;
  final MeteodetailCubit meteoDetailBloc;

  const MeteoDetailPage(
      {Key? key, required this.town, required this.meteoDetailBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MeteoDetail'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MeteodetailCubit(),
          ),
        ],
        child: MeteoDetailWidget(
          town: town,
          meteoDetailBloc: meteoDetailBloc,
        ),
      ),
    );
  }
}
