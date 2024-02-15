import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:custom_color_picker/src/application/color_picker_controller.dart';
import 'package:custom_color_picker/src/presentation/color_slider.dart';

class ColorPicker extends ConsumerWidget {
  const ColorPicker({
    super.key,
    this.withOpacity = false,
    this.withSaturation = false,
  });

  final bool withOpacity;
  final bool withSaturation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(colorPickerControllerProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          color: state.color.toColor(),
          duration: const Duration(milliseconds: 100),
          width: 200,
          height: 200,
        ),
        const SizedBox(height: 48.0),
        const ColorSlider(ColorPickerValue.hue),
        if (withOpacity) const ColorSlider(ColorPickerValue.alpha),
        if (withSaturation) const ColorSlider(ColorPickerValue.saturation),
      ],
    );
  }
}
