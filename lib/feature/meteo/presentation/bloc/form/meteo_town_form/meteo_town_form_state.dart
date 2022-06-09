part of 'meteo_town_form_cubit.dart';

class TownFormState {
  const TownFormState({
    this.status = FormzStatus.pure,
    this.town = const TownInput.pure(),
  });

  final FormzStatus status;
  final TownInput town;

  TownFormState copyWith({
    FormzStatus? status,
    TownInput? town,
  }) =>
      TownFormState(
        status: status ?? this.status,
        town: town ?? this.town,
      );


}