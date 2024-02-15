import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:custom_color_picker/src/domain/color_picker_state.dart';

part 'color_picker_controller.g.dart';

@riverpod
class ColorPickerController extends _$ColorPickerController {
  @override
  ColorPickerState build() {
    return const ColorPickerState(hue: 0.0);
  }

  void changeOpacity(double value) {
    state = state.copyWith(
      alpha: value,
    );
  }

  void changeHue(double value) {
    state = state.copyWith(
      hue: value,
    );
  }

  void changeSaturation(double value) {
    state = state.copyWith(
      saturation: value,
    );
  }

  void changeVValue(double value) {
    state = state.copyWith(
      vValue: value,
    );
  }

  void takeHex(String hex) {
    final hexValue = hex.startsWith('#') ? hex.substring(1) : hex;

    state = state.copyWith(hue: int.parse(hexValue, radix: 16).toDouble());
  }
}
