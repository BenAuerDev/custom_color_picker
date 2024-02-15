class ColorPickerState {
  const ColorPickerState({
    required this.hue,
  });

  final double hue;

  ColorPickerState copyWith({
    required double value,
  }) {
    return ColorPickerState(
      hue: value,
    );
  }
}
