// Copyright (c) 2025, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:mdmoney/mdmoney.dart';
import 'package:test/test.dart';

void main() {
  test('AED', () {
    final actual = FiatCurrency.parse('AED');
    const expected = FiatCurrency.aed;
    expect(actual, expected);
  });

  group('default >', () {
    test('get default', () {
      final actual = FiatCurrency.$default;
      const expected = FiatCurrency.uah;
      expect(actual, expected);
    });
    test('isDefault true', () {
      final actual = FiatCurrency.uah.isDefault;
      const expected = true;
      expect(actual, expected);
    });
    test('isDefault false', () {
      final actual = FiatCurrency.eur.isDefault;
      const expected = false;
      expect(actual, expected);
    });
    test('set default', () {
      FiatCurrency.setDefaultCurrency(FiatCurrency.eur);
      final actual = FiatCurrency.$default;
      const expected = FiatCurrency.eur;
      expect(actual, expected);
    });
  });

  group('toString >', () {
    test('icon', () {
      final actual = FiatCurrency.eur.toString();
      const expected = '€';
      expect(actual, expected);
    });
    test('code', () {
      final actual = FiatCurrency.xag.toString();
      const expected = 'XAG';
      expect(actual, expected);
    });
  });
}
