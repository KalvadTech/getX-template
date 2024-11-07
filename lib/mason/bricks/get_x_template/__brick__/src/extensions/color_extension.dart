import 'dart:ui';

/// Extension to convert between hex color strings and `Color` objects.
extension HexColor on Color {
  /// Converts a hex string to a [Color] object.
  ///
  /// The hex string can be in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  /// If the string is only 6 or 7 characters long, an opaque alpha value of "ff" is added by default.
  ///
  /// Example:
  /// ```dart
  /// Color color = HexColor.fromHex("#aabbcc");
  /// ```
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) {
      buffer.write('ff'); // Default alpha value.
    }
    buffer.write(hexString.replaceFirst('#', '')); // Remove the hash if present.
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Converts a [Color] object to a hex string.
  ///
  /// If [leadingHashSign] is set to `true` (default), the string will start with "#".
  ///
  /// Example:
  /// ```dart
  /// String hex = color.toHex(); // Outputs "#ffaabbcc".
  /// ```
  String toHex({bool leadingHashSign = true}) {
    return '${leadingHashSign ? '#' : ''}'
        '${alpha.toRadixString(16).padLeft(2, '0')}'
        '${red.toRadixString(16).padLeft(2, '0')}'
        '${green.toRadixString(16).padLeft(2, '0')}'
        '${blue.toRadixString(16).padLeft(2, '0')}';
  }
}
