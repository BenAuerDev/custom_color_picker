import 'package:custom_color_picker/src/application/color_picker_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum ColorPickerValue {
  alpha,
  hue,
  saturation,
}

class ColorSlider extends ConsumerWidget {
  const ColorSlider(
    this.parameter, {
    super.key,
  });

  final ColorPickerValue parameter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(colorPickerControllerProvider);

    late double value;
    late List<Color> gradientColors;
    late List<double> stops;
    late Function(double) changeValue;

    switch (parameter) {
      // Alpha/Opacity
      // Goes from 0.0 to 1.0
      // Stops every 0.01
      case ColorPickerValue.alpha:
        value = state.alpha;
        gradientColors = [
          for (var alpha = 0.0; alpha < 1.0; alpha += 0.01)
            HSVColor.fromAHSV(alpha, 1.0, 1.0, 1.0).toColor()
        ];
        stops = [for (var alpha = 0.0; alpha < 1.0; alpha += 0.01) alpha];
        changeValue = (newValue) => ref
            .read(colorPickerControllerProvider.notifier)
            .changeOpacity(newValue);
        break;

      // Hue
      // Goes from 0.0 to 360.0
      // Stops every 1
      case ColorPickerValue.hue:
        value = state.hue;
        gradientColors = [
          for (var h = 0.0; h < 360.0; h += 1)
            HSVColor.fromAHSV(1.0, h, 1.0, 1.0).toColor()
        ];
        stops = [for (var h = 0; h < 360.0; h += 1) h / 360.0];
        changeValue = (newValue) => ref
            .read(colorPickerControllerProvider.notifier)
            .changeHue(newValue);
        break;

      // Saturation
      // Goes from 0.0 to 1.0
      // Stops every 0.01
      case ColorPickerValue.saturation:
        value = state.saturation;
        gradientColors = [
          for (var v = 1.0; v >= 0.0; v -= 0.01)
            HSVColor.fromAHSV(1.0, 0.0, 0.0, v).toColor()
        ];
        stops = [for (var s = 0.0; s < 1.0; s += 0.01) s];
        changeValue = (newValue) => ref
            .read(colorPickerControllerProvider.notifier)
            .changeSaturation(newValue);
        break;
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                parameter.toString().split('.').last.toUpperCase(),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            height: 30.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradientColors,
                stops: stops,
              ),
            ),
          ),
        ),
        Slider.adaptive(
          value: value,
          min: 0,
          max: parameter == ColorPickerValue.hue ? 360 : 1.0,
          onChanged: (newValue) => changeValue(newValue),
        ),
      ],
    );
  }
}
