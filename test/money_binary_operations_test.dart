// Copyright (c) 2025, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:mdmoney/mdmoney.dart';
import 'package:test/test.dart';

import 'constants.dart';

void main() {
  group('addition >', () {
    test('0 + 0', () {
      final amount1 = Money.fromDouble(0, defaultCurrency);
      final amount2 = Money.fromDouble(0, defaultCurrency);
      final actual = amount1 + amount2;
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('0 + 0.1', () {
      final amount1 = Money.fromDouble(0, defaultCurrency);
      final amount2 = Money.fromDouble(0.1, defaultCurrency);
      final actual = amount1 + amount2;
      final expected = Money.fromDouble(0.1, defaultCurrency);
      expect(actual, expected);
    });
    test('0 + 1', () {
      final amount1 = Money.fromDouble(0, defaultCurrency);
      final amount2 = Money.fromDouble(1, defaultCurrency);
      final actual = amount1 + amount2;
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('0 + 1.1', () {
      final amount1 = Money.fromDouble(0, defaultCurrency);
      final amount2 = Money.fromDouble(1.1, defaultCurrency);
      final actual = amount1 + amount2;
      final expected = Money.fromDouble(1.1, defaultCurrency);
      expect(actual, expected);
    });
    test('1 + 0.1', () {
      final amount1 = Money.fromDouble(1, defaultCurrency);
      final amount2 = Money.fromDouble(0.1, defaultCurrency);
      final actual = amount1 + amount2;
      final expected = Money.fromDouble(1.1, defaultCurrency);
      expect(actual, expected);
    });
    test('1 + 1.1', () {
      final amount1 = Money.fromDouble(1, defaultCurrency);
      final amount2 = Money.fromDouble(1.1, defaultCurrency);
      final actual = amount1 + amount2;
      final expected = Money.fromDouble(2.1, defaultCurrency);
      expect(actual, expected);
    });
    test('1.1 + 0.1', () {
      final amount1 = Money.fromDouble(1.1, defaultCurrency);
      final amount2 = Money.fromDouble(0.1, defaultCurrency);
      final actual = amount1 + amount2;
      final expected = Money.fromDouble(1.2, defaultCurrency);
      expect(actual, expected);
    });
    test('1.1 + 1.1', () {
      final amount1 = Money.fromDouble(1.1, defaultCurrency);
      final amount2 = Money.fromDouble(1.1, defaultCurrency);
      final actual = amount1 + amount2;
      final expected = Money.fromDouble(2.2, defaultCurrency);
      expect(actual, expected);
    });
    test('0 + -0.1', () {
      final amount1 = Money.fromDouble(0, defaultCurrency);
      final amount2 = Money.fromDouble(-0.1, defaultCurrency);
      final actual = amount1 + amount2;
      final expected = Money.fromDouble(-0.1, defaultCurrency);
      expect(actual, expected);
    });
    test('0 + -1', () {
      final amount1 = Money.fromDouble(0, defaultCurrency);
      final amount2 = Money.fromDouble(-1, defaultCurrency);
      final actual = amount1 + amount2;
      final expected = Money.fromDouble(-1, defaultCurrency);
      expect(actual, expected);
    });
    test('0 + -1.1', () {
      final amount1 = Money.fromDouble(0, defaultCurrency);
      final amount2 = Money.fromDouble(-1.1, defaultCurrency);
      final actual = amount1 + amount2;
      final expected = Money.fromDouble(-1.1, defaultCurrency);
      expect(actual, expected);
    });
    test('1 + -0.1', () {
      final amount1 = Money.fromDouble(1, defaultCurrency);
      final amount2 = Money.fromDouble(-0.1, defaultCurrency);
      final actual = amount1 + amount2;
      final expected = Money.fromDouble(0.9, defaultCurrency);
      expect(actual, expected);
    });
    test('1 + -1.1', () {
      final amount1 = Money.fromDouble(1, defaultCurrency);
      final amount2 = Money.fromDouble(-1.1, defaultCurrency);
      final actual = amount1 + amount2;
      final expected = Money.fromDouble(-0.1, defaultCurrency);
      expect(actual, expected);
    });
    test('1.1 + -0.1', () {
      final amount1 = Money.fromDouble(1.1, defaultCurrency);
      final amount2 = Money.fromDouble(-0.1, defaultCurrency);
      final actual = amount1 + amount2;
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('1.1 + -1.1', () {
      final amount1 = Money.fromDouble(1.1, defaultCurrency);
      final amount2 = Money.fromDouble(-1.1, defaultCurrency);
      final actual = amount1 + amount2;
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('-1.1 + -1.1', () {
      final amount1 = Money.fromDouble(-1.1, defaultCurrency);
      final amount2 = Money.fromDouble(-1.1, defaultCurrency);
      final actual = amount1 + amount2;
      final expected = Money.fromDouble(-2.2, defaultCurrency);
      expect(actual, expected);
    });
    test('Currency mismatch', () {
      final amount1 = Money.fromDouble(0, defaultCurrency);
      final amount2 = Money.fromDouble(0, otherCurrency);
      Money actual() => amount1 + amount2;
      final expected = throwsA(const TypeMatcher<CurrencyMismatchException>());
      expect(actual, expected);
    });
    test('a1 + a2, precision 0', () {
      final amount1 =
          Money.fromDouble(98.7654321, defaultCurrency, precision: 0);
      final amount2 =
          Money.fromDouble(12.3456789, defaultCurrency, precision: 0);
      final actual = amount1 + amount2;
      final expected = Money.fromDouble(111, defaultCurrency, precision: 0);
      expect(actual, expected);
    });
    test('a1 + -a2, precision 0', () {
      final amount1 =
          Money.fromDouble(98.7654321, defaultCurrency, precision: 0);
      final amount2 =
          Money.fromDouble(-12.3456789, defaultCurrency, precision: 0);
      final actual = amount1 + amount2;
      final expected = Money.fromDouble(87, defaultCurrency, precision: 0);
      expect(actual, expected);
    });
    test('-a1 + -a2, precision 0', () {
      final amount1 =
          Money.fromDouble(-98.7654321, defaultCurrency, precision: 0);
      final amount2 =
          Money.fromDouble(-12.3456789, defaultCurrency, precision: 0);
      final actual = amount1 + amount2;
      final expected = Money.fromDouble(-111, defaultCurrency, precision: 0);
      expect(actual, expected);
    });
    test('a1 + a2, precision 4', () {
      final amount1 =
          Money.fromDouble(98.7654321, defaultCurrency, precision: 4);
      final amount2 =
          Money.fromDouble(12.3456789, defaultCurrency, precision: 4);
      final actual = amount1 + amount2;
      final expected =
          Money.fromDouble(111.1111, defaultCurrency, precision: 4);
      expect(actual, expected);
    });
    test('a1 + -a2, precision 4', () {
      final amount1 =
          Money.fromDouble(98.7654321, defaultCurrency, precision: 4);
      final amount2 =
          Money.fromDouble(-12.3456789, defaultCurrency, precision: 4);
      final actual = amount1 + amount2;
      final expected = Money.fromDouble(86.4197, defaultCurrency, precision: 4);
      expect(actual, expected);
    });
    test('-a1 + -a2, precision 4', () {
      final amount1 =
          Money.fromDouble(-98.7654321, defaultCurrency, precision: 4);
      final amount2 =
          Money.fromDouble(-12.3456789, defaultCurrency, precision: 4);
      final actual = amount1 + amount2;
      final expected =
          Money.fromDouble(-111.1111, defaultCurrency, precision: 4);
      expect(actual, expected);
    });
    test('a1(2) + a2(4), different precisions', () {
      final amount1 =
          Money.fromDouble(98.7654321, defaultCurrency, precision: 2);
      final amount2 =
          Money.fromDouble(12.3456789, defaultCurrency, precision: 4);
      final actual = amount1 + amount2;
      final expected = Money.fromDouble(111.12, defaultCurrency, precision: 2);
      expect(actual, expected);
    });
    test('a1(4) + a2(2), different precisions', () {
      final amount1 =
          Money.fromDouble(98.7654321, defaultCurrency, precision: 4);
      final amount2 =
          Money.fromDouble(12.3456789, defaultCurrency, precision: 2);
      final actual = amount1 + amount2;
      final expected =
          Money.fromDouble(111.1154, defaultCurrency, precision: 4);
      expect(actual, expected);
    });
  });

  group('subtraction >', () {
    test('0 - 0', () {
      final amount1 = Money.fromDouble(0, defaultCurrency);
      final amount2 = Money.fromDouble(0, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('0 - 0.1', () {
      final amount1 = Money.fromDouble(0, defaultCurrency);
      final amount2 = Money.fromDouble(0.1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(-0.1, defaultCurrency);
      expect(actual, expected);
    });
    test('0 - 1', () {
      final amount1 = Money.fromDouble(0, defaultCurrency);
      final amount2 = Money.fromDouble(1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(-1, defaultCurrency);
      expect(actual, expected);
    });
    test('0 - 1.1', () {
      final amount1 = Money.fromDouble(0, defaultCurrency);
      final amount2 = Money.fromDouble(1.1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(-1.1, defaultCurrency);
      expect(actual, expected);
    });
    test('0.1 - 0', () {
      final amount1 = Money.fromDouble(0.1, defaultCurrency);
      final amount2 = Money.fromDouble(0, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(0.1, defaultCurrency);
      expect(actual, expected);
    });
    test('0.1 - 0.1', () {
      final amount1 = Money.fromDouble(0.1, defaultCurrency);
      final amount2 = Money.fromDouble(0.1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('0.1 - 1', () {
      final amount1 = Money.fromDouble(0.1, defaultCurrency);
      final amount2 = Money.fromDouble(1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(-0.9, defaultCurrency);
      expect(actual, expected);
    });
    test('0.1 - 1.1', () {
      final amount1 = Money.fromDouble(0.1, defaultCurrency);
      final amount2 = Money.fromDouble(1.1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(-1, defaultCurrency);
      expect(actual, expected);
    });
    test('1 - 0', () {
      final amount1 = Money.fromDouble(1, defaultCurrency);
      final amount2 = Money.fromDouble(0, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('1 - 0.1', () {
      final amount1 = Money.fromDouble(1, defaultCurrency);
      final amount2 = Money.fromDouble(0.1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(0.9, defaultCurrency);
      expect(actual, expected);
    });
    test('1 - 1', () {
      final amount1 = Money.fromDouble(1, defaultCurrency);
      final amount2 = Money.fromDouble(1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('1 - 1.1', () {
      final amount1 = Money.fromDouble(1, defaultCurrency);
      final amount2 = Money.fromDouble(1.1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(-0.1, defaultCurrency);
      expect(actual, expected);
    });
    test('1.1 - 0', () {
      final amount1 = Money.fromDouble(1.1, defaultCurrency);
      final amount2 = Money.fromDouble(0, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(1.1, defaultCurrency);
      expect(actual, expected);
    });
    test('1.1 - 0.1', () {
      final amount1 = Money.fromDouble(1.1, defaultCurrency);
      final amount2 = Money.fromDouble(0.1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('1.1 - 1', () {
      final amount1 = Money.fromDouble(1.1, defaultCurrency);
      final amount2 = Money.fromDouble(1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(0.1, defaultCurrency);
      expect(actual, expected);
    });
    test('1.1 - 1.1', () {
      final amount1 = Money.fromDouble(1.1, defaultCurrency);
      final amount2 = Money.fromDouble(1.1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('0 - -0.1', () {
      final amount1 = Money.fromDouble(0, defaultCurrency);
      final amount2 = Money.fromDouble(-0.1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(0.1, defaultCurrency);
      expect(actual, expected);
    });
    test('0 - -1', () {
      final amount1 = Money.fromDouble(0, defaultCurrency);
      final amount2 = Money.fromDouble(-1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('0 - -1.1', () {
      final amount1 = Money.fromDouble(0, defaultCurrency);
      final amount2 = Money.fromDouble(-1.1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(1.1, defaultCurrency);
      expect(actual, expected);
    });
    test('0.1 - -0.1', () {
      final amount1 = Money.fromDouble(0.1, defaultCurrency);
      final amount2 = Money.fromDouble(-0.1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(0.2, defaultCurrency);
      expect(actual, expected);
    });
    test('0.1 - -1', () {
      final amount1 = Money.fromDouble(0.1, defaultCurrency);
      final amount2 = Money.fromDouble(-1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(1.1, defaultCurrency);
      expect(actual, expected);
    });
    test('0.1 - -1.1', () {
      final amount1 = Money.fromDouble(0.1, defaultCurrency);
      final amount2 = Money.fromDouble(-1.1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(1.2, defaultCurrency);
      expect(actual, expected);
    });
    test('1 - -0.1', () {
      final amount1 = Money.fromDouble(1, defaultCurrency);
      final amount2 = Money.fromDouble(-0.1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(1.1, defaultCurrency);
      expect(actual, expected);
    });
    test('1 - -1', () {
      final amount1 = Money.fromDouble(1, defaultCurrency);
      final amount2 = Money.fromDouble(-1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(2, defaultCurrency);
      expect(actual, expected);
    });
    test('1 - -1.1', () {
      final amount1 = Money.fromDouble(1, defaultCurrency);
      final amount2 = Money.fromDouble(-1.1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(2.1, defaultCurrency);
      expect(actual, expected);
    });
    test('1.1 - -0.1', () {
      final amount1 = Money.fromDouble(1.1, defaultCurrency);
      final amount2 = Money.fromDouble(-0.1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(1.2, defaultCurrency);
      expect(actual, expected);
    });
    test('1.1 - -1', () {
      final amount1 = Money.fromDouble(1.1, defaultCurrency);
      final amount2 = Money.fromDouble(-1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(2.1, defaultCurrency);
      expect(actual, expected);
    });
    test('1.1 - -1.1', () {
      final amount1 = Money.fromDouble(1.1, defaultCurrency);
      final amount2 = Money.fromDouble(-1.1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(2.2, defaultCurrency);
      expect(actual, expected);
    });
    test('-0.1 - 0', () {
      final amount1 = Money.fromDouble(-0.1, defaultCurrency);
      final amount2 = Money.fromDouble(0, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(-0.1, defaultCurrency);
      expect(actual, expected);
    });
    test('-0.1 - 0.1', () {
      final amount1 = Money.fromDouble(-0.1, defaultCurrency);
      final amount2 = Money.fromDouble(0.1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(-0.2, defaultCurrency);
      expect(actual, expected);
    });
    test('-0.1 - 1', () {
      final amount1 = Money.fromDouble(-0.1, defaultCurrency);
      final amount2 = Money.fromDouble(1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(-1.1, defaultCurrency);
      expect(actual, expected);
    });
    test('-0.1 - 1.1', () {
      final amount1 = Money.fromDouble(-0.1, defaultCurrency);
      final amount2 = Money.fromDouble(1.1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(-1.2, defaultCurrency);
      expect(actual, expected);
    });
    test('-1 - 0', () {
      final amount1 = Money.fromDouble(-1, defaultCurrency);
      final amount2 = Money.fromDouble(0, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(-1, defaultCurrency);
      expect(actual, expected);
    });
    test('-1 - 0.1', () {
      final amount1 = Money.fromDouble(-1, defaultCurrency);
      final amount2 = Money.fromDouble(0.1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(-1.1, defaultCurrency);
      expect(actual, expected);
    });
    test('-1 - 1', () {
      final amount1 = Money.fromDouble(-1, defaultCurrency);
      final amount2 = Money.fromDouble(1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(-2, defaultCurrency);
      expect(actual, expected);
    });
    test('-1 - 1.1', () {
      final amount1 = Money.fromDouble(-1, defaultCurrency);
      final amount2 = Money.fromDouble(1.1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(-2.1, defaultCurrency);
      expect(actual, expected);
    });
    test('-1.1 - 0', () {
      final amount1 = Money.fromDouble(-1.1, defaultCurrency);
      final amount2 = Money.fromDouble(0, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(-1.1, defaultCurrency);
      expect(actual, expected);
    });
    test('-1.1 - 0.1', () {
      final amount1 = Money.fromDouble(-1.1, defaultCurrency);
      final amount2 = Money.fromDouble(0.1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(-1.2, defaultCurrency);
      expect(actual, expected);
    });
    test('-1.1 - 1', () {
      final amount1 = Money.fromDouble(-1.1, defaultCurrency);
      final amount2 = Money.fromDouble(1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(-2.1, defaultCurrency);
      expect(actual, expected);
    });
    test('-1.1 - 1.1', () {
      final amount1 = Money.fromDouble(-1.1, defaultCurrency);
      final amount2 = Money.fromDouble(1.1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(-2.2, defaultCurrency);
      expect(actual, expected);
    });
    test('-1.1 - -1.1', () {
      final amount1 = Money.fromDouble(-1.1, defaultCurrency);
      final amount2 = Money.fromDouble(-1.1, defaultCurrency);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('Currency mismatch', () {
      final amount1 = Money.fromDouble(0, defaultCurrency);
      final amount2 = Money.fromDouble(0, otherCurrency);
      Money actual() => amount1 - amount2;
      final expected = throwsA(const TypeMatcher<CurrencyMismatchException>());
      expect(actual, expected);
    });
    test('a1 - a2, precision 0', () {
      final amount1 =
          Money.fromDouble(98.7654321, defaultCurrency, precision: 0);
      final amount2 =
          Money.fromDouble(12.3456789, defaultCurrency, precision: 0);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(87, defaultCurrency, precision: 0);
      expect(actual, expected);
    });
    test('a1 - -a2, precision 0', () {
      final amount1 =
          Money.fromDouble(98.7654321, defaultCurrency, precision: 0);
      final amount2 =
          Money.fromDouble(-12.3456789, defaultCurrency, precision: 0);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(111, defaultCurrency, precision: 0);
      expect(actual, expected);
    });
    test('-a1 - -a2, precision 0', () {
      final amount1 =
          Money.fromDouble(-98.7654321, defaultCurrency, precision: 0);
      final amount2 =
          Money.fromDouble(-12.3456789, defaultCurrency, precision: 0);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(-87, defaultCurrency, precision: 0);
      expect(actual, expected);
    });
    test('a1 - a2, precision 4', () {
      final amount1 =
          Money.fromDouble(98.7654321, defaultCurrency, precision: 4);
      final amount2 =
          Money.fromDouble(12.3456789, defaultCurrency, precision: 4);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(86.4197, defaultCurrency, precision: 4);
      expect(actual, expected);
    });
    test('a1 - -a2, precision 4', () {
      final amount1 =
          Money.fromDouble(98.7654321, defaultCurrency, precision: 4);
      final amount2 =
          Money.fromDouble(-12.3456789, defaultCurrency, precision: 4);
      final actual = amount1 - amount2;
      final expected =
          Money.fromDouble(111.1111, defaultCurrency, precision: 4);
      expect(actual, expected);
    });
    test('-a1 - -a2, precision 4', () {
      final amount1 =
          Money.fromDouble(-98.7654321, defaultCurrency, precision: 4);
      final amount2 =
          Money.fromDouble(-12.3456789, defaultCurrency, precision: 4);
      final actual = amount1 - amount2;
      final expected =
          Money.fromDouble(-86.4197, defaultCurrency, precision: 4);
      expect(actual, expected);
    });
    test('a1(2) - a2(4), different precisions', () {
      final amount1 =
          Money.fromDouble(98.7654321, defaultCurrency, precision: 2);
      final amount2 =
          Money.fromDouble(12.3456789, defaultCurrency, precision: 4);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(86.42, defaultCurrency, precision: 2);
      expect(actual, expected);
    });
    test('a1(4) - a2(2), different precisions', () {
      final amount1 =
          Money.fromDouble(98.7654321, defaultCurrency, precision: 4);
      final amount2 =
          Money.fromDouble(12.3456789, defaultCurrency, precision: 2);
      final actual = amount1 - amount2;
      final expected = Money.fromDouble(86.4154, defaultCurrency, precision: 4);
      expect(actual, expected);
    });
  });

  group('multiplication >', () {
    test('0 * 0', () {
      final amount = Money.fromDouble(0, defaultCurrency);
      final coef = Amount.zero;
      final actual = amount * coef;
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('0 * 0.1', () {
      final amount = Money.fromDouble(0, defaultCurrency);
      final coef = Amount.fromDouble(0.1);
      final actual = amount * coef;
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('0 * 1', () {
      final amount = Money.fromDouble(0, defaultCurrency);
      final coef = Amount.one;
      final actual = amount * coef;
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('0 * 1.1', () {
      final amount = Money.fromDouble(0, defaultCurrency);
      final coef = Amount.fromDouble(1.1);
      final actual = amount * coef;
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('1 * 0.1', () {
      final amount = Money.fromDouble(1, defaultCurrency);
      final coef = Amount.fromDouble(0.1);
      final actual = amount * coef;
      final expected = Money.fromDouble(0.1, defaultCurrency);
      expect(actual, expected);
    });
    test('1 * 1.1', () {
      final amount = Money.fromDouble(1, defaultCurrency);
      final coef = Amount.fromDouble(1.1);
      final actual = amount * coef;
      final expected = Money.fromDouble(1.1, defaultCurrency);
      expect(actual, expected);
    });
    test('1.1 * 0.1', () {
      final amount = Money.fromDouble(1.1, defaultCurrency);
      final coef = Amount.fromDouble(0.1);
      final actual = amount * coef;
      final expected = Money.fromDouble(0.11, defaultCurrency);
      expect(actual, expected);
    });
    test('1.1 * 1.1', () {
      final amount = Money.fromDouble(1.1, defaultCurrency);
      final coef = Amount.fromDouble(1.1);
      final actual = amount * coef;
      final expected = Money.fromDouble(1.21, defaultCurrency);
      expect(actual, expected);
    });
    test('0 * -0.1', () {
      final amount = Money.fromDouble(0, defaultCurrency);
      final coef = Amount.fromDouble(-0.1);
      final actual = amount * coef;
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('0 * -1', () {
      final amount = Money.fromDouble(0, defaultCurrency);
      final coef = -Amount.one;
      final actual = amount * coef;
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('0 * -1.1', () {
      final amount = Money.fromDouble(0, defaultCurrency);
      final coef = Amount.fromDouble(-1.1);
      final actual = amount * coef;
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('1 * -0.1', () {
      final amount = Money.fromDouble(1, defaultCurrency);
      final coef = Amount.fromDouble(-0.1);
      final actual = amount * coef;
      final expected = Money.fromDouble(-0.1, defaultCurrency);
      expect(actual, expected);
    });
    test('1 * -1.1', () {
      final amount = Money.fromDouble(1, defaultCurrency);
      final coef = Amount.fromDouble(-1.1);
      final actual = amount * coef;
      final expected = Money.fromDouble(-1.1, defaultCurrency);
      expect(actual, expected);
    });
    test('1.1 * -0.1', () {
      final amount = Money.fromDouble(1.1, defaultCurrency);
      final coef = Amount.fromDouble(-0.1);
      final actual = amount * coef;
      final expected = Money.fromDouble(-0.11, defaultCurrency);
      expect(actual, expected);
    });
    test('1.1 * -1.1', () {
      final amount = Money.fromDouble(1.1, defaultCurrency);
      final coef = Amount.fromDouble(-1.1);
      final actual = amount * coef;
      final expected = Money.fromDouble(-1.21, defaultCurrency);
      expect(actual, expected);
    });
    test('ceil rounding', () {
      final amount = Money.fromDouble(123.45, defaultCurrency);
      final coef = Amount.fromDouble(1.24);
      final actual = amount * coef;
      final expected = Money.fromDouble(153.078, defaultCurrency);
      expect(expected.toDouble(), 153.08);
      expect(actual, expected);
    });
    test('floor rounding', () {
      final amount = Money.fromDouble(123.45, defaultCurrency);
      final coef = Amount.fromDouble(0.23);
      final actual = amount * coef;
      final expected = Money.fromDouble(28.3935, defaultCurrency);
      expect(expected.toDouble(), 28.39);
      expect(actual, expected);
    });
    test('a(0) * 11', () {
      final amount = Money.fromDouble(1.123456, defaultCurrency, precision: 0);
      final coef = Amount.fromDouble(11.0);
      final actual = amount * coef;
      final expected = Money.fromDouble(11, defaultCurrency, precision: 0);
      expect(actual, expected);
    });
    test('a(4) * 1.1', () {
      final amount = Money.fromDouble(1.123456, defaultCurrency, precision: 4);
      final coef = Amount.fromDouble(11.0);
      final actual = amount * coef;
      final expected = Money.fromDouble(12.3585, defaultCurrency, precision: 4);
      expect(actual, expected);
    });
    test('a(0) * -1.1', () {
      final amount = Money.fromDouble(1.123456, defaultCurrency, precision: 0);
      final coef = Amount.fromDouble(-11.0);
      final actual = amount * coef;
      final expected = Money.fromDouble(-11, defaultCurrency, precision: 0);
      expect(actual, expected);
    });
    test('a(4) * -1.1', () {
      final amount = Money.fromDouble(1.123456, defaultCurrency, precision: 4);
      final coef = Amount.fromDouble(-11.0);
      final actual = amount * coef;
      final expected =
          Money.fromDouble(-12.3585, defaultCurrency, precision: 4);
      expect(actual, expected);
    });
  });

  group('division >', () {
    test('0 / 0 (NaN)', () {
      final amount = Money.fromDouble(0, defaultCurrency);
      final coef = Amount.zero;
      Amount actual() => amount / coef;
      final expected = throwsA(const TypeMatcher<NotANumberException>());
      expect(actual, expected);
    });
    test('0 / 0.1', () {
      final amount = Money.fromDouble(0, defaultCurrency);
      final coef = Amount.fromDouble(0.1);
      final actual = amount / coef;
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('0 / 2', () {
      final amount = Money.fromDouble(0, defaultCurrency);
      final coef = Amount.fromDouble(2.0);
      final actual = amount / coef;
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('0 / 1.25', () {
      final amount = Money.fromDouble(0, defaultCurrency);
      final coef = Amount.fromDouble(1.25);
      final actual = amount / coef;
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('0.1 / 0.1', () {
      final amount = Money.fromDouble(0.1, defaultCurrency);
      final coef = Amount.fromDouble(0.1);
      final actual = amount / coef;
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('0.1 / 2', () {
      final amount = Money.fromDouble(0.1, defaultCurrency);
      final coef = Amount.fromDouble(2.0);
      final actual = amount / coef;
      final expected = Money.fromDouble(0.05, defaultCurrency);
      expect(actual, expected);
    });
    test('0.1 / 1.25', () {
      final amount = Money.fromDouble(0.1, defaultCurrency);
      final coef = Amount.fromDouble(1.25);
      final actual = amount / coef;
      final expected = Money.fromDouble(0.08, defaultCurrency);
      expect(actual, expected);
    });
    test('1 / 0.1', () {
      final amount = Money.fromDouble(1, defaultCurrency);
      final coef = Amount.fromDouble(0.1);
      final actual = amount / coef;
      final expected = Money.fromDouble(10, defaultCurrency);
      expect(actual, expected);
    });
    test('1 / 2', () {
      final amount = Money.fromDouble(1, defaultCurrency);
      final coef = Amount.fromDouble(2.0);
      final actual = amount / coef;
      final expected = Money.fromDouble(0.5, defaultCurrency);
      expect(actual, expected);
    });
    test('1 / 1.25', () {
      final amount = Money.fromDouble(1, defaultCurrency);
      final coef = Amount.fromDouble(1.25);
      final actual = amount / coef;
      final expected = Money.fromDouble(0.8, defaultCurrency);
      expect(actual, expected);
    });
    test('1.25 / 0.1', () {
      final amount = Money.fromDouble(1.25, defaultCurrency);
      final coef = Amount.fromDouble(0.1);
      final actual = amount / coef;
      final expected = Money.fromDouble(12.5, defaultCurrency);
      expect(actual, expected);
    });
    test('1.1 / 2', () {
      final amount = Money.fromDouble(1.1, defaultCurrency);
      final coef = Amount.fromDouble(2.0);
      final actual = amount / coef;
      final expected = Money.fromDouble(0.55, defaultCurrency);
      expect(actual, expected);
    });
    test('4.5 / 1.5', () {
      final amount = Money.fromDouble(4.5, defaultCurrency);
      final coef = Amount.fromDouble(1.5);
      final actual = amount / coef;
      final expected = Money.fromDouble(3, defaultCurrency);
      expect(actual, expected);
    });
    test('0 / -0.1', () {
      final amount = Money.fromDouble(0, defaultCurrency);
      final coef = Amount.fromDouble(-0.1);
      final actual = amount / coef;
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('0 / -2', () {
      final amount = Money.fromDouble(0, defaultCurrency);
      final coef = Amount.fromDouble(-2.0);
      final actual = amount / coef;
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('0 / -1.25', () {
      final amount = Money.fromDouble(0, defaultCurrency);
      final coef = Amount.fromDouble(-1.25);
      final actual = amount / coef;
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('0.1 / -0.1', () {
      final amount = Money.fromDouble(0.1, defaultCurrency);
      final coef = Amount.fromDouble(-0.1);
      final actual = amount / coef;
      final expected = Money.fromDouble(-1, defaultCurrency);
      expect(actual, expected);
    });
    test('0.1 / -2', () {
      final amount = Money.fromDouble(0.1, defaultCurrency);
      final coef = Amount.fromDouble(-2.0);
      final actual = amount / coef;
      final expected = Money.fromDouble(-0.05, defaultCurrency);
      expect(actual, expected);
    });
    test('0.1 / -1.25', () {
      final amount = Money.fromDouble(0.1, defaultCurrency);
      final coef = Amount.fromDouble(-1.25);
      final actual = amount / coef;
      final expected = Money.fromDouble(-0.08, defaultCurrency);
      expect(actual, expected);
    });
    test('1 / -0.1', () {
      final amount = Money.fromDouble(1, defaultCurrency);
      final coef = Amount.fromDouble(-0.1);
      final actual = amount / coef;
      final expected = Money.fromDouble(-10, defaultCurrency);
      expect(actual, expected);
    });
    test('1 / -2', () {
      final amount = Money.fromDouble(1, defaultCurrency);
      final coef = Amount.fromDouble(-2.0);
      final actual = amount / coef;
      final expected = Money.fromDouble(-0.5, defaultCurrency);
      expect(actual, expected);
    });
    test('1 / -1.25', () {
      final amount = Money.fromDouble(1, defaultCurrency);
      final coef = Amount.fromDouble(-1.25);
      final actual = amount / coef;
      final expected = Money.fromDouble(-0.8, defaultCurrency);
      expect(actual, expected);
    });
    test('1.25 / -0.1', () {
      final amount = Money.fromDouble(1.25, defaultCurrency);
      final coef = Amount.fromDouble(-0.1);
      final actual = amount / coef;
      final expected = Money.fromDouble(-12.5, defaultCurrency);
      expect(actual, expected);
    });
    test('1.1 / -2', () {
      final amount = Money.fromDouble(1.1, defaultCurrency);
      final coef = Amount.fromDouble(-2.0);
      final actual = amount / coef;
      final expected = Money.fromDouble(-0.55, defaultCurrency);
      expect(actual, expected);
    });
    test('4.5 / -1.5', () {
      final amount = Money.fromDouble(4.5, defaultCurrency);
      final coef = Amount.fromDouble(-1.5);
      final actual = amount / coef;
      final expected = Money.fromDouble(-3, defaultCurrency);
      expect(actual, expected);
    });
    test('ceil rounding', () {
      final amount = Money.fromDouble(4.55, defaultCurrency);
      final coef = Amount.fromDouble(2.0);
      final actual = amount / coef;
      final expected = Money.fromDouble(2.275, defaultCurrency);
      expect(expected.toDouble(), 2.28);
      expect(actual, expected);
    });
    test('floor rounding', () {
      final amount = Money.fromDouble(1.45, defaultCurrency);
      final coef = Amount.fromDouble(3.0);
      final actual = amount / coef;
      final expected = Money.fromDouble(0.48333333333, defaultCurrency);
      expect(expected.toDouble(), 0.48);
      expect(actual, expected);
    });
    test('infinite', () {
      final amount = Money.fromDouble(maxFinite, defaultCurrency);
      final coef = Amount.fromDouble(double.minPositive);
      Amount actual() => amount / coef;
      final expected = throwsA(const TypeMatcher<InfiniteNumberException>());
      expect(actual, expected);
    });
    test('a(0) / 11', () {
      final amount = Money.fromDouble(1.123456, defaultCurrency, precision: 0);
      final coef = Amount.fromDouble(11.0);
      final actual = amount / coef;
      final expected = Money.fromDouble(0, defaultCurrency, precision: 0);
      expect(actual, expected);
    });
    test('a(4) / 11', () {
      final amount = Money.fromDouble(1.123456, defaultCurrency, precision: 4);
      final coef = Amount.fromDouble(11.0);
      final actual = amount / coef;
      final expected = Money.fromDouble(0.1021, defaultCurrency, precision: 4);
      expect(actual, expected);
    });
    test('a(0) / -11', () {
      final amount = Money.fromDouble(1.123456, defaultCurrency, precision: 0);
      final coef = Amount.fromDouble(-11.0);
      final actual = amount / coef;
      final expected = Money.fromDouble(0, defaultCurrency, precision: 0);
      expect(actual, expected);
    });
    test('a(4) / -11', () {
      final amount = Money.fromDouble(1.123456, defaultCurrency, precision: 4);
      final coef = Amount.fromDouble(-11.0);
      final actual = amount / coef;
      final expected = Money.fromDouble(-0.1021, defaultCurrency, precision: 4);
      expect(actual, expected);
    });
  });

  group('less than (<) >', () {
    test('less', () {
      final amount1 = Money.fromDouble(1.1, defaultCurrency);
      final amount2 = Money.fromDouble(2.2, defaultCurrency);
      final actual = amount1 < amount2;
      const expected = true;
      expect(actual, expected);
    });
    test('equal', () {
      final amount1 = Money.fromDouble(1.1, defaultCurrency);
      final amount2 = Money.fromDouble(1.1, defaultCurrency);
      final actual = amount1 < amount2;
      const expected = false;
      expect(actual, expected);
    });
    test('greater', () {
      final amount1 = Money.fromDouble(2.2, defaultCurrency);
      final amount2 = Money.fromDouble(1.1, defaultCurrency);
      final actual = amount1 < amount2;
      const expected = false;
      expect(actual, expected);
    });
    test('Currency mismatch', () {
      final amount1 = Money.fromDouble(0, defaultCurrency);
      final amount2 = Money.fromDouble(0, otherCurrency);
      bool actual() => amount1 < amount2;
      final expected = throwsA(const TypeMatcher<CurrencyMismatchException>());
      expect(actual, expected);
    });

    test('less, precision 4', () {
      final amount1 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final amount2 = Money.fromDouble(2.2345, defaultCurrency, precision: 4);
      final actual = amount1 < amount2;
      const expected = true;
      expect(actual, expected);
    });
    test('equal, precision 4', () {
      final amount1 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final amount2 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final actual = amount1 < amount2;
      const expected = false;
      expect(actual, expected);
    });
    test('greater, precision 4', () {
      final amount1 = Money.fromDouble(2.2345, defaultCurrency, precision: 4);
      final amount2 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final actual = amount1 < amount2;
      const expected = false;
      expect(actual, expected);
    });

    test('a1(2) < a2(4), different precisions', () {
      final amount1 = Money.fromDouble(1.12, defaultCurrency, precision: 2);
      final amount2 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final actual = amount1 < amount2;
      const expected = true;
      expect(actual, expected);
    });
    test('a1(4) < a2(2), different precisions', () {
      final amount1 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final amount2 = Money.fromDouble(1.12, defaultCurrency, precision: 2);
      final actual = amount1 < amount2;
      const expected = false;
      expect(actual, expected);
    });
  });

  group('less than or equal (<=) >', () {
    test('less', () {
      final amount1 = Money.fromDouble(1.1, defaultCurrency);
      final amount2 = Money.fromDouble(2.2, defaultCurrency);
      final actual = amount1 <= amount2;
      const expected = true;
      expect(actual, expected);
    });
    test('equal', () {
      final amount1 = Money.fromDouble(1.1, defaultCurrency);
      final amount2 = Money.fromDouble(1.1, defaultCurrency);
      final actual = amount1 <= amount2;
      const expected = true;
      expect(actual, expected);
    });
    test('greater', () {
      final amount1 = Money.fromDouble(2.2, defaultCurrency);
      final amount2 = Money.fromDouble(1.1, defaultCurrency);
      final actual = amount1 <= amount2;
      const expected = false;
      expect(actual, expected);
    });
    test('Currency mismatch', () {
      final amount1 = Money.fromDouble(0, defaultCurrency);
      final amount2 = Money.fromDouble(0, otherCurrency);
      bool actual() => amount1 <= amount2;
      final expected = throwsA(const TypeMatcher<CurrencyMismatchException>());
      expect(actual, expected);
    });

    test('less, precision 4', () {
      final amount1 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final amount2 = Money.fromDouble(2.2345, defaultCurrency, precision: 4);
      final actual = amount1 <= amount2;
      const expected = true;
      expect(actual, expected);
    });
    test('equal, precision 4', () {
      final amount1 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final amount2 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final actual = amount1 <= amount2;
      const expected = true;
      expect(actual, expected);
    });
    test('greater, precision 4', () {
      final amount1 = Money.fromDouble(2.2345, defaultCurrency, precision: 4);
      final amount2 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final actual = amount1 <= amount2;
      const expected = false;
      expect(actual, expected);
    });

    test('a1(2) < a2(4), different precisions', () {
      final amount1 = Money.fromDouble(1.12, defaultCurrency, precision: 2);
      final amount2 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final actual = amount1 <= amount2;
      const expected = true;
      expect(actual, expected);
    });
    test('a1(4) < a2(2), different precisions', () {
      final amount1 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final amount2 = Money.fromDouble(1.12, defaultCurrency, precision: 2);
      final actual = amount1 <= amount2;
      const expected = false;
      expect(actual, expected);
    });
  });

  group('greater than (>) >', () {
    test('less', () {
      final amount1 = Money.fromDouble(1.1, defaultCurrency);
      final amount2 = Money.fromDouble(2.2, defaultCurrency);
      final actual = amount1 > amount2;
      const expected = false;
      expect(actual, expected);
    });
    test('equal', () {
      final amount1 = Money.fromDouble(1.1, defaultCurrency);
      final amount2 = Money.fromDouble(1.1, defaultCurrency);
      final actual = amount1 > amount2;
      const expected = false;
      expect(actual, expected);
    });
    test('greater', () {
      final amount1 = Money.fromDouble(2.2, defaultCurrency);
      final amount2 = Money.fromDouble(1.1, defaultCurrency);
      final actual = amount1 > amount2;
      const expected = true;
      expect(actual, expected);
    });
    test('Currency mismatch', () {
      final amount1 = Money.fromDouble(0, defaultCurrency);
      final amount2 = Money.fromDouble(0, otherCurrency);
      bool actual() => amount1 > amount2;
      final expected = throwsA(const TypeMatcher<CurrencyMismatchException>());
      expect(actual, expected);
    });

    test('less, precision 4', () {
      final amount1 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final amount2 = Money.fromDouble(2.2345, defaultCurrency, precision: 4);
      final actual = amount1 > amount2;
      const expected = false;
      expect(actual, expected);
    });
    test('equal, precision 4', () {
      final amount1 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final amount2 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final actual = amount1 > amount2;
      const expected = false;
      expect(actual, expected);
    });
    test('greater, precision 4', () {
      final amount1 = Money.fromDouble(2.2345, defaultCurrency, precision: 4);
      final amount2 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final actual = amount1 > amount2;
      const expected = true;
      expect(actual, expected);
    });

    test('a1(2) < a2(4), different precisions', () {
      final amount1 = Money.fromDouble(1.12, defaultCurrency, precision: 2);
      final amount2 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final actual = amount1 > amount2;
      const expected = false;
      expect(actual, expected);
    });
    test('a1(4) < a2(2), different precisions', () {
      final amount1 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final amount2 = Money.fromDouble(1.12, defaultCurrency, precision: 2);
      final actual = amount1 > amount2;
      const expected = true;
      expect(actual, expected);
    });
  });

  group('greater than or equal (>=) >', () {
    test('less', () {
      final amount1 = Money.fromDouble(1.1, defaultCurrency);
      final amount2 = Money.fromDouble(2.2, defaultCurrency);
      final actual = amount1 >= amount2;
      const expected = false;
      expect(actual, expected);
    });
    test('equal', () {
      final amount1 = Money.fromDouble(1.1, defaultCurrency);
      final amount2 = Money.fromDouble(1.1, defaultCurrency);
      final actual = amount1 >= amount2;
      const expected = true;
      expect(actual, expected);
    });
    test('greater', () {
      final amount1 = Money.fromDouble(2.2, defaultCurrency);
      final amount2 = Money.fromDouble(1.1, defaultCurrency);
      final actual = amount1 >= amount2;
      const expected = true;
      expect(actual, expected);
    });
    test('Currency mismatch', () {
      final amount1 = Money.fromDouble(0, defaultCurrency);
      final amount2 = Money.fromDouble(0, otherCurrency);
      bool actual() => amount1 >= amount2;
      final expected = throwsA(const TypeMatcher<CurrencyMismatchException>());
      expect(actual, expected);
    });

    test('less, precision 4', () {
      final amount1 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final amount2 = Money.fromDouble(2.2345, defaultCurrency, precision: 4);
      final actual = amount1 >= amount2;
      const expected = false;
      expect(actual, expected);
    });
    test('equal, precision 4', () {
      final amount1 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final amount2 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final actual = amount1 >= amount2;
      const expected = true;
      expect(actual, expected);
    });
    test('greater, precision 4', () {
      final amount1 = Money.fromDouble(2.2345, defaultCurrency, precision: 4);
      final amount2 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final actual = amount1 >= amount2;
      const expected = true;
      expect(actual, expected);
    });

    test('a1(2) < a2(4), different precisions', () {
      final amount1 = Money.fromDouble(1.12, defaultCurrency, precision: 2);
      final amount2 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final actual = amount1 >= amount2;
      const expected = false;
      expect(actual, expected);
    });
    test('a1(4) < a2(2), different precisions', () {
      final amount1 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final amount2 = Money.fromDouble(1.12, defaultCurrency, precision: 2);
      final actual = amount1 >= amount2;
      const expected = true;
      expect(actual, expected);
    });
  });

  group('compareTo >', () {
    test('-1', () {
      final amount1 = Money.fromDouble(1.1, defaultCurrency);
      final amount2 = Money.fromDouble(2.2, defaultCurrency);
      final actual = amount1.compareTo(amount2);
      const expected = -1;
      expect(actual, expected);
    });
    test('0', () {
      final amount1 = Money.fromDouble(1.1, defaultCurrency);
      final amount2 = Money.fromDouble(1.1, defaultCurrency);
      final actual = amount1.compareTo(amount2);
      const expected = 0;
      expect(actual, expected);
    });
    test('+1', () {
      final amount1 = Money.fromDouble(2.2, defaultCurrency);
      final amount2 = Money.fromDouble(1.1, defaultCurrency);
      final actual = amount1.compareTo(amount2);
      const expected = 1;
      expect(actual, expected);
    });
    test('Currency mismatch', () {
      final amount1 = Money.fromDouble(0, defaultCurrency);
      final amount2 = Money.fromDouble(0, otherCurrency);
      int actual() => amount1.compareTo(amount2);
      final expected = throwsA(const TypeMatcher<CurrencyMismatchException>());
      expect(actual, expected);
    });

    test('-1, precision 4', () {
      final amount1 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final amount2 = Money.fromDouble(2.2345, defaultCurrency, precision: 4);
      final actual = amount1.compareTo(amount2);
      const expected = -1;
      expect(actual, expected);
    });
    test('0, precision 4', () {
      final amount1 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final amount2 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final actual = amount1.compareTo(amount2);
      const expected = 0;
      expect(actual, expected);
    });
    test('+1, precision 4', () {
      final amount1 = Money.fromDouble(2.2345, defaultCurrency, precision: 4);
      final amount2 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final actual = amount1.compareTo(amount2);
      const expected = 1;
      expect(actual, expected);
    });

    test('a1(2) compareTo a2(4), different precisions', () {
      final amount1 = Money.fromDouble(1.12, defaultCurrency, precision: 2);
      final amount2 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final actual = amount1.compareTo(amount2);
      const expected = -1;
      expect(actual, expected);
    });
    test('a1(4) compareTo a2(2), different precisions', () {
      final amount1 = Money.fromDouble(1.1234, defaultCurrency, precision: 4);
      final amount2 = Money.fromDouble(1.12, defaultCurrency, precision: 2);
      final actual = amount1.compareTo(amount2);
      const expected = 1;
      expect(actual, expected);
    });
  });
}
