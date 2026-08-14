import 'package:center_spot/center_spot.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ViewportPreset', () {
    test('stores its name and logical size', () {
      const preset = ViewportPreset(
        name: 'Design mobile',
        size: Size(375, 812),
      );

      expect(preset.name, 'Design mobile');
      expect(preset.size, const Size(375, 812));
      expect(preset.toString(), 'ViewportPreset(Design mobile, 375.0×812.0)');
    });

    test('landscape swaps dimensions and updates the name', () {
      const preset = ViewportPreset(
        name: 'Design mobile',
        size: Size(375, 812),
      );

      expect(
        preset.landscape,
        const ViewportPreset(
          name: 'Design mobile landscape',
          size: Size(812, 375),
        ),
      );
    });

    test('supports value equality and stable hash codes', () {
      const first = ViewportPreset(name: 'Test', size: Size(400, 800));
      const same = ViewportPreset(name: 'Test', size: Size(400, 800));
      const differentName = ViewportPreset(name: 'Other', size: Size(400, 800));

      expect(first, same);
      expect(first.hashCode, same.hashCode);
      expect(first, isNot(differentName));
    });
  });

  group('ViewportPresets', () {
    test('contains every built-in preset in display order', () {
      expect(ViewportPresets.all, const [
        ViewportPresets.compactPhone,
        ViewportPresets.mediumPhone,
        ViewportPresets.largePhone,
        ViewportPresets.tablet,
      ]);
    });

    test('uses the documented logical sizes', () {
      expect(ViewportPresets.compactPhone.size, const Size(360, 800));
      expect(ViewportPresets.mediumPhone.size, const Size(390, 844));
      expect(ViewportPresets.largePhone.size, const Size(430, 932));
      expect(ViewportPresets.tablet.size, const Size(768, 1024));
    });
  });
}
