class ColorPickerState {
  const ColorPickerState({
    this.alpha = 1.0,
    this.hue = 0.0,
  });

  final double alpha;
  final double hue;

  ColorPickerState copyWith({
    double? alpha,
    double? hue,
  }) {
    return ColorPickerState(
      alpha: alpha ?? this.alpha,
      hue: hue ?? this.hue,
    );
  }
}
