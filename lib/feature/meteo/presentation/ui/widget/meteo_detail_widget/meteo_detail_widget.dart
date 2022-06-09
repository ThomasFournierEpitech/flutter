import 'package:app_meteo/feature/meteo/presentation/bloc/widget/meteo_detail_bloc/meteo_detail_cubit.dart';
import 'package:flutter/cupertino.dart';

class MeteoDetailWidget extends StatelessWidget {
  final String town;
  final MeteodetailCubit meteoDetailBloc;

  const MeteoDetailWidget(
      {Key? key, required this.town, required this.meteoDetailBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(meteoDetailBloc.state.resolvedAddress),
        Text("${meteoDetailBloc.state.feelsLike}"),
      ],
    );
  }
}
