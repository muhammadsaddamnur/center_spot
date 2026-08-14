import 'package:flutter/widgets.dart';

import 'viewport_preset.dart';

/// Centers an app viewport at a fixed logical size without device chrome or UI.
///
/// Put this widget in [WidgetsApp.builder] or `MaterialApp.builder` so routes,
/// dialogs, and overlays all receive the simulated [MediaQuery].
class CenterSpot extends StatelessWidget {
  const CenterSpot({
    required this.preset,
    required this.child,
    this.enabled = true,
    this.alignment = Alignment.center,
    this.backgroundColor = const Color(0xFF202124),
    this.clipBehavior = Clip.hardEdge,
    super.key,
  });

  /// The logical viewport to expose to the application.
  final ViewportPreset preset;

  /// The application content, normally the child received by an app builder.
  final Widget child;

  /// Whether the fixed preview viewport is active.
  final bool enabled;

  /// Where the viewport is placed in the host window.
  final AlignmentGeometry alignment;

  /// Color shown around the viewport when the host window is larger.
  final Color backgroundColor;

  /// How content outside the viewport is clipped.
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    if (!enabled) return child;

    assert(
      preset.size.width > 0 && preset.size.height > 0,
      'CenterSpot preset size must be greater than zero.',
    );
    final hostMedia = MediaQuery.maybeOf(context);
    final simulatedMedia = (hostMedia ?? const MediaQueryData()).copyWith(
      size: preset.size,
    );

    return ColoredBox(
      color: backgroundColor,
      child: Align(
        alignment: alignment,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: SizedBox.fromSize(
            size: preset.size,
            child: ClipRect(
              clipBehavior: clipBehavior,
              child: MediaQuery(data: simulatedMedia, child: child),
            ),
          ),
        ),
      ),
    );
  }
}
