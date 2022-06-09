import 'package:app_meteo/feature/meteo/presentation/ui/page/meteo_detail_page.dart';
import 'package:app_meteo/feature/meteo/presentation/bloc/widget/meteo_detail_bloc/meteo_detail_cubit.dart';
import 'package:app_meteo/feature/meteo/presentation/bloc/form/meteo_town_form/meteo_town_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class MeteoTownForm extends StatelessWidget {
  const MeteoTownForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MeteodetailCubit _meteoDetailCubit =
        BlocProvider.of<MeteodetailCubit>(context);

    TownFormCubit _townFormCubit = BlocProvider.of<TownFormCubit>(context);
    final TextEditingController _towninputController = TextEditingController();

    return MultiBlocListener(
      listeners: [
        BlocListener<TownFormCubit, TownFormState>(
          listenWhen: (previous, current) {
            return true;
          },
          listener: (context, state) {
            if (state.status.isSubmissionFailure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: Text('Town Failure'),
                  ),
                );
            }

            if (state.status.isSubmissionSuccess) {
              _meteoDetailCubit.getTown(state.town.value);
            }
          },
        ),
        BlocListener<MeteodetailCubit, MeteoInfoState>(
            listener: (context, state) {
          if (state is Loaded) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MeteoDetailPage(
                    town: _townFormCubit.state.town.value,
                    meteoDetailBloc: _meteoDetailCubit),
              ),
            );
          } else if (state is Error) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text("${state.searchTown} not found"),
                ),
              );
          }
        }),
      ],
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 256),
        child: AutofillGroup(
          child: Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.center,
            children: [
              const FlutterLogo(size: 100),
              Text(
                'Meteo',
                style: Theme.of(context).textTheme.headline2,
              ),
              _TownInput(
                town: context.read<TownFormCubit>().state.town.value,
                controller: _towninputController,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: _TownFormButton(controller: _towninputController),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TownInput extends StatelessWidget {
  final TextEditingController _controller;

  _TownInput({Key? key, String? town, TextEditingController? controller})
      : _controller = controller ?? TextEditingController(text: town),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final town = context.select((TownFormCubit bloc) => bloc.state.town);
    return TextField(
      key: const Key('loginFormTownInput_textField'),
      controller: _controller,
      autofillHints: const [AutofillHints.addressCity],
      keyboardType: TextInputType.emailAddress,
      onChanged: (town) =>
          context.read<TownFormCubit>().mapTownChangedToState(town.trim()),
      decoration: InputDecoration(
        hintText: 'Town',
        errorText: town.invalid ? 'Invalid username' : null,
      ),
    );
  }
}

class _TownFormButton extends StatelessWidget {
  final TextEditingController _controller;

  const _TownFormButton({Key? key, required TextEditingController controller})
      : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final status = context.select((TownFormCubit cubit) => cubit.state.status);
    return Center(
      child: status.isSubmissionInProgress
          ? const CircularProgressIndicator()
          : ElevatedButton(
              child: const Icon(
                Icons.arrow_right_outlined,
              ),
              onPressed: status.isValidated
                  ? () {
                      _controller.clear();
                      context.read<TownFormCubit>().mapTownSubmittedToState();
                    }
                  : null,
            ),
    );
  }
}
