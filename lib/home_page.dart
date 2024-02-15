import 'package:custom_color_picker/src/presentation/color_picker.dart';
import 'package:custom_color_picker/src/presentation/test_display.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ColorPicker(
              withOpacity: true,
            ),
            ReactiveDisplay(),
          ],
        ),
      ),
    );
  }
}
