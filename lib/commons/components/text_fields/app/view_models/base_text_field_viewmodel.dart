import 'package:flutter/foundation.dart';
import 'package:medical_test_app/commons/components/text_fields/app/domains/entities/text_field_entity.dart';
import 'package:medical_test_app/commons/components/text_fields/app/domains/entities/validation_message_entity.dart';

class BaseTextFieldViewModel extends ChangeNotifier
    implements ValueListenable<TextFieldEntity> {
  TextFieldEntity _state;

  BaseTextFieldViewModel(TextFieldEntity initialState) : _state = initialState;

  @override
  TextFieldEntity get value => _state;

  bool get isDirty => _state.isDirty;

  void updateText(String newText) {
    bool wasPreviouslyEmpty = _state.text.isEmpty;
    _state = _state.copyWith(
      labelText: _state.labelText,
      text: newText,
      isDirty: wasPreviouslyEmpty && newText.isNotEmpty ? true : _state.isDirty,
    );

    notifyListeners();
  }

  void clearText() {
    // Reset the text and set isDirty to false when clearing
    _state = _state.copyWith(text: '', isDirty: false);
    notifyListeners();
  }

  void toggleObscureText() {
    // Toggle the obscureText flag
    _state = _state.copyWith(obscureText: !_state.obscureText);
    notifyListeners();
  }

  List<ValidationMessage> validateText(TextFieldEntity state) {
    return [];
  }

  bool isValid(String text) {
    return false;
  }
}
