import 'package:center_spot/center_spot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('centers content at the preset logical size', (tester) async {
    const contentKey = Key('content');
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(1000, 1000);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: CenterSpot(
          preset: ViewportPreset(name: 'Test', size: Size(400, 800)),
          child: ColoredBox(key: contentKey, color: Colors.white),
        ),
      ),
    );

    final box = tester.renderObject<RenderBox>(find.byKey(contentKey));
    expect(box.size, const Size(400, 800));
    expect(box.localToGlobal(Offset.zero), const Offset(300, 100));
    expect(
      box.localToGlobal(box.size.bottomRight(Offset.zero)),
      const Offset(700, 900),
    );
  });

  testWidgets('scales down visually while preserving logical MediaQuery size', (
    tester,
  ) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(200, 400);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPhysicalSize);

    Size? mediaSize;
    const contentKey = Key('content');

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CenterSpot(
          preset: const ViewportPreset(name: 'Test', size: Size(400, 800)),
          child: Builder(
            builder: (context) {
              mediaSize = MediaQuery.sizeOf(context);
              return const ColoredBox(key: contentKey, color: Colors.white);
            },
          ),
        ),
      ),
    );

    final box = tester.renderObject<RenderBox>(find.byKey(contentKey));
    expect(mediaSize, const Size(400, 800));
    expect(box.size, const Size(400, 800));
    expect(box.localToGlobal(Offset.zero), Offset.zero);
    expect(
      box.localToGlobal(box.size.bottomRight(Offset.zero)),
      const Offset(200, 400),
    );
  });

  testWidgets('passes child through when disabled', (tester) async {
    Size? mediaSize;

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: MediaQuery(
          data: const MediaQueryData(size: Size(321, 654)),
          child: CenterSpot(
            enabled: false,
            preset: ViewportPresets.mediumPhone,
            child: Builder(
              builder: (context) {
                mediaSize = MediaQuery.sizeOf(context);
                return const SizedBox.expand();
              },
            ),
          ),
        ),
      ),
    );

    expect(mediaSize, const Size(321, 654));
  });
}
