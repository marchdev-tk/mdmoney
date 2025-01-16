// Copyright (c) 2025, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:mdmoney/mdmoney.dart';
import 'package:test/test.dart';

void main() {
  group('exception messages >', () {
    test('NoCurrencyException', () {
      final actual = const NoCurrencyException().message;
      const expected = 'No currency was provided or it is unknown!';
      expect(actual, expected);
    });
    test('CurrencyMismatchException', () {
      final actual = const CurrencyMismatchException().message;
      const expected = 'Currencies of both operands must be equal!';
      expect(actual, expected);
    });
  });
}
