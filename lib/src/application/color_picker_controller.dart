import 'package:custom_color_picker/src/domain/color_picker_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'color_picker_controller.g.dart';

@riverpod
class ColorPickerController extends _$ColorPickerController {
  @override
  ColorPickerState build() {
    return const ColorPickerState(hue: 0.0);
  }

  void slide(double value) {
    state = state.copyWith(value: value);
  }

  void takeHex(String hex) {
    final hexValue = hex.startsWith('#') ? hex.substring(1) : hex;

    state = state.copyWith(value: int.parse(hexValue, radix: 16).toDouble());
  }
}
