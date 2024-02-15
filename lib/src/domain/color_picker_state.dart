import 'package:flutter/material.dart';

import 'package:custom_color_picker/src/util/hex_parser.dart';

class ColorPickerState {
  const ColorPickerState({
    this.alpha = 1.0,
    this.hue = 0.0,
    this.saturation = 1.0,
    this.vValue = 1.0,
    this.color = const HSVColor.fromAHSV(1.0, 0.0, 1.0, 1.0),
    this.colorHexValue = '#ffff0000',
  });

  final double alpha;
  final double hue;
  final double saturation;
  final double vValue;
  final HSVColor color;
  final String colorHexValue;

  ColorPickerState copyWith({
    double? alpha,
    double? hue,
    double? saturation,
    double? vValue,
    HSVColor? color,
    String? colorHexValue,
  }) {
    return ColorPickerState(
      alpha: alpha ?? this.alpha,
      hue: hue ?? this.hue,
      saturation: saturation ?? this.saturation,
      vValue: vValue ?? this.vValue,
      color: HSVColor.fromAHSV(
        this.alpha,
        this.hue,
        this.saturation,
        this.vValue,
      ),
      colorHexValue: parseIntoHexString(
        this.color.toColor(),
      ),
    );
  }
}
