# center_spot

A small, frame-free Flutter viewport preview for responsive UI development.
`CenterSpot` centers an application at a fixed logical size and exposes that
size through `MediaQuery`, without adding a device frame, toolbar, or runtime
settings panel.

## Features

- Preview an app at a predictable logical viewport size.
- Scale the preview down automatically when the host window is smaller.
- Keep the preview centered, or place it with a custom alignment.
- Use built-in phone and tablet presets or define your own.
- Switch any preset to landscape orientation.
- Enable or disable the preview without changing the widget tree.
- Run on Android, iOS, Linux, macOS, web, and Windows.

## Getting started

Add the package to your application:

```shell
flutter pub add center_spot
```

Import it and wrap the child from `MaterialApp.builder` or
`WidgetsApp.builder`:

```dart
import 'package:center_spot/center_spot.dart';
import 'package:flutter/material.dart';

MaterialApp(
  builder: (context, child) => CenterSpot(
    preset: ViewportPresets.mediumPhone,
    child: child!,
  ),
  home: const HomePage(),
);
```

Putting `CenterSpot` in the app builder ensures that routes, dialogs, and
overlays receive the simulated `MediaQuery`.

## Presets

The package includes these logical viewport sizes:

| Preset | Size |
| --- | ---: |
| `ViewportPresets.compactPhone` | 360 × 800 |
| `ViewportPresets.mediumPhone` | 390 × 844 |
| `ViewportPresets.largePhone` | 430 × 932 |
| `ViewportPresets.tablet` | 768 × 1024 |

Create a custom preset when your design uses another size:

```dart
const mobile = ViewportPreset(
  name: 'Design mobile',
  size: Size(375, 812),
);
```

Use `mobile.landscape` to swap its width and height.

## Customization

`CenterSpot` can be positioned and styled to suit the host window:

```dart
CenterSpot(
  enabled: isPreviewEnabled,
  preset: ViewportPresets.tablet.landscape,
  alignment: Alignment.topCenter,
  backgroundColor: const Color(0xFF101114),
  clipBehavior: Clip.antiAlias,
  child: child,
)
```

When the host is larger than the preset, the viewport keeps its logical size.
When the host is smaller, the viewport scales down uniformly while its child
continues to receive the preset size from `MediaQuery`.

See the complete runnable application in the [`example`](example) directory.

## Platform support

`center_spot` uses only Flutter's platform-independent widget APIs and supports
Android, iOS, Linux, macOS, web, and Windows.

## License

This project is available under the [MIT License](LICENSE).
