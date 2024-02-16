import 'package:custom_color_picker/src/application/color_picker_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReactiveDisplay extends ConsumerWidget {
  const ReactiveDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(colorPickerControllerProvider);

    String stringValue = '';

    submit() {
      ref.read(colorPickerControllerProvider.notifier).takeHex(stringValue);
    }

    return Column(
      children: [
        Text(
          state.colorHexValue,
          style: TextStyle(
            color:
                HSVColor.fromAHSV(state.alpha, state.hue, state.saturation, 1.0)
                    .toColor(),
            fontSize: 24,
          ),
        ),
        TextField(
          onChanged: (value) {
            stringValue = value;
          },
        ),
        TextButton(
          onPressed: () {
            submit();
          },
          child: Text('submit'),
        ),
      ],
    );
  }
}
// #1ABC9C