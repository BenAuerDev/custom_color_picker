class ColorPickerState {
  const ColorPickerState({
    this.alpha = 1.0,
    this.hue = 0.0,
    this.saturation = 1.0,
    this.vValue = 1.0,
  });

  final double alpha;
  final double hue;
  final double saturation;
  final double vValue;

  ColorPickerState copyWith({
    double? alpha,
    double? hue,
    double? saturation,
    double? vValue,
  }) {
    return ColorPickerState(
      alpha: alpha ?? this.alpha,
      hue: hue ?? this.hue,
      saturation: saturation ?? this.saturation,
      vValue: vValue ?? this.vValue,
    );
  }
}
