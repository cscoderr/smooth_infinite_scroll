// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smooth_infinite_scroll/smooth_infinite_scroll.dart';

void main() {
  group('SmoothInfiniteScroll', () {
    test('can be instantiated', () {
      expect(
        SmoothInfiniteScroll(
          items: const [],
          item: SizedBox(),
        ),
        isNotNull,
      );
    });
  });
}
