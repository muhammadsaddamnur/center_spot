# center_spot

A tiny, frame-free Flutter viewport preview. It centers your application at a
fixed preset size and exposes that logical size through `MediaQuery`. There is
no device frame, toolbar, or runtime settings panel.

## Usage

Add `CenterSpot` to your `MaterialApp.builder`:

```dart
import 'package:center_spot/center_spot.dart';
import 'package:flutter/material.dart';

MaterialApp(
  builder: (context, child) => CenterSpot(
    enabled: true,
    preset: ViewportPresets.mediumPhone,
    child: child!,
  ),
  home: const HomePage(),
);
```

The viewport stays at its preset logical dimensions. When the host window is
smaller, it scales down uniformly; when the window is larger, it remains at the
preset size and stays centered.

Create a custom preset when needed:

```dart
const mobile = ViewportPreset(
  name: 'Design mobile',
  size: Size(375, 812),
);
```

Landscape is available with `mobile.landscape`. Built-in presets are
`compactPhone` (360×800), `mediumPhone` (390×844), `largePhone` (430×932), and
`tablet` (768×1024).
