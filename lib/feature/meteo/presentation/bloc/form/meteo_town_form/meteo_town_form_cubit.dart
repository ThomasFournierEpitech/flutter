import 'package:app_meteo/feature/meteo/presentation/input/town_input.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';

part 'meteo_town_form_state.dart';

class TownFormCubit extends Cubit<TownFormState> {
  TownFormCubit() : super(const TownFormState());

  void mapTownChangedToState(
    final String town,
  ) {
    final _town = TownInput.dirty(value: town);

    emit(TownFormState(town: _town, status: Formz.validate([_town])));
  }

  void mapTownSubmittedToState() async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        emit(TownFormState(
            status: FormzStatus.submissionSuccess, town: state.town));
      } on Exception catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
