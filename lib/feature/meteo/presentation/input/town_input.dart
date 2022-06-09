import 'package:formz/formz.dart';

// Define input validation errors
enum TownInputError { empty }

// Extend FormzInput and provide the input type and error type.
class TownInput extends FormzInput<String, TownInputError> {
  // Call super.pure to represent an unmodified form input.
  const TownInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const TownInput.dirty({String value = ''}) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  TownInputError? validator(String value) {
    return value.isEmpty ? TownInputError.empty : null;
  }
}