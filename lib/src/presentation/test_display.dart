import 'package:custom_color_picker/src/application/color_picker_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReactiveDisplay extends ConsumerWidget {
  const ReactiveDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(colorPickerControllerProvider);

    final colorInHex = HSVColor.fromAHSV(state.alpha, state.hue, 1.0, 1.0)
        .toColor()
        .value
        .toRadixString(16);

    return Column(
      children: [
        Text(
          'You picked #$colorInHex',
          style: TextStyle(
            color:
                HSVColor.fromAHSV(state.alpha, state.hue, 1.0, 1.0).toColor(),
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}