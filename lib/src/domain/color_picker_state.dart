class ColorPickerState {
  const ColorPickerState({
    required this.value,
  });

  final double value;

  ColorPickerState copyWith({
    required double value,
  }) {
    return ColorPickerState(
      value: value,
    );
  }
}
