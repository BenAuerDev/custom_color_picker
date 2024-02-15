import 'package:custom_color_picker/src/domain/color_picker_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'color_picker_controller.g.dart';

@riverpod
class ColorPickerController extends _$ColorPickerController {
  @override
  ColorPickerState build() {
    return const ColorPickerState(hue: 0.0);
  }

  void changeHue(double value) {
    state = state.copyWith(hue: value);
  }

  void changeOpacity(double value) {
    state = state.copyWith(alpha: value);
  }

  void takeHex(String hex) {
    final hexValue = hex.startsWith('#') ? hex.substring(1) : hex;

    state = state.copyWith(hue: int.parse(hexValue, radix: 16).toDouble());
  }
}
