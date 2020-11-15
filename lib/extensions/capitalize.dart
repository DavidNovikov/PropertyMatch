extension Capitalize on String {
  String capitalizeFirstLetter() =>
      '${this[0].toUpperCase()}${this.substring(1)}';
}
