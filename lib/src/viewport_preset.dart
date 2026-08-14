import 'package:flutter/widgets.dart';

/// A logical viewport configuration used by [CenterSpot].
@immutable
class ViewportPreset {
  const ViewportPreset({required this.name, required this.size});

  /// A human-readable name for logs and test descriptions.
  final String name;

  /// The viewport size in logical pixels.
  final Size size;

  /// Returns this preset with width and height swapped.
  ViewportPreset get landscape =>
      ViewportPreset(name: '$name landscape', size: size.flipped);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ViewportPreset && name == other.name && size == other.size;

  @override
  int get hashCode => Object.hash(name, size);

  @override
  String toString() => 'ViewportPreset($name, ${size.width}×${size.height})';
}

/// Common logical viewport sizes.
abstract final class ViewportPresets {
  static const compactPhone = ViewportPreset(
    name: 'Compact phone',
    size: Size(360, 800),
  );

  static const mediumPhone = ViewportPreset(
    name: 'Medium phone',
    size: Size(390, 844),
  );

  static const largePhone = ViewportPreset(
    name: 'Large phone',
    size: Size(430, 932),
  );

  static const tablet = ViewportPreset(name: 'Tablet', size: Size(768, 1024));

  static const all = [compactPhone, mediumPhone, largePhone, tablet];
}
