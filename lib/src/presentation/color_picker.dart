import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:custom_color_picker/src/application/color_picker_controller.dart';

class ColorPicker extends ConsumerWidget {
  const ColorPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hue = ref.watch(colorPickerControllerProvider).value;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          color: HSVColor.fromAHSV(1.0, hue, 1.0, 1.0).toColor(),
          duration: const Duration(milliseconds: 100),
          width: 200,
          height: 200,
        ),
        const SizedBox(height: 48.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            height: 30.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  for (var h = 0.0; h < 360.0; h += 1)
                    HSVColor.fromAHSV(1.0, h, 1.0, 1.0).toColor()
                ],
                stops: [
                  for (var h = 0.0; h < 360.0; h += 1) h / 360.0,
                ],
              ),
            ),
          ),
        ),
        Slider.adaptive(
          value: hue,
          min: 0,
          max: 360,
          onChanged: (newValue) =>
              ref.read(colorPickerControllerProvider.notifier).slide(newValue),
        ),
      ],
    );
  }
}
