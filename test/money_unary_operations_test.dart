// Copyright (c) 2024, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:mdmoney/mdmoney.dart';
import 'package:test/test.dart';

import 'constants.dart';

void main() {
  group('isZero >', () {
    test('-1', () {
      final actual = Money.fromInt(-1, defaultCurrency).isZero;
      const expected = false;
      expect(actual, expected);
    });
    test('0', () {
      final actual = Money.fromInt(0, defaultCurrency).isZero;
      const expected = true;
      expect(actual, expected);
    });
    test('1', () {
      final actual = Money.fromInt(1, defaultCurrency).isZero;
      const expected = false;
      expect(actual, expected);
    });
  });

  group('isGreaterThanZero >', () {
    test('-1', () {
      final actual = Money.fromInt(-1, defaultCurrency).isGreaterThanZero;
      const expected = false;
      expect(actual, expected);
    });
    test('0', () {
      final actual = Money.fromInt(0, defaultCurrency).isGreaterThanZero;
      const expected = false;
      expect(actual, expected);
    });
    test('1', () {
      final actual = Money.fromInt(1, defaultCurrency).isGreaterThanZero;
      const expected = true;
      expect(actual, expected);
    });
  });

  group('isGreaterThanOrEqualZero >', () {
    test('-1', () {
      final actual =
          Money.fromInt(-1, defaultCurrency).isGreaterThanOrEqualZero;
      const expected = false;
      expect(actual, expected);
    });
    test('0', () {
      final actual = Money.fromInt(0, defaultCurrency).isGreaterThanOrEqualZero;
      const expected = true;
      expect(actual, expected);
    });
    test('1', () {
      final actual = Money.fromInt(1, defaultCurrency).isGreaterThanOrEqualZero;
      const expected = true;
      expect(actual, expected);
    });
  });

  group('isLessThanZero >', () {
    test('-1', () {
      final actual = Money.fromInt(-1, defaultCurrency).isLessThanZero;
      const expected = true;
      expect(actual, expected);
    });
    test('0', () {
      final actual = Money.fromInt(0, defaultCurrency).isLessThanZero;
      const expected = false;
      expect(actual, expected);
    });
    test('1', () {
      final actual = Money.fromInt(1, defaultCurrency).isLessThanZero;
      const expected = false;
      expect(actual, expected);
    });
  });

  group('isLessThanOrEqualZero >', () {
    test('-1', () {
      final actual = Money.fromInt(-1, defaultCurrency).isLessThanOrEqualZero;
      const expected = true;
      expect(actual, expected);
    });
    test('0', () {
      final actual = Money.fromInt(0, defaultCurrency).isLessThanOrEqualZero;
      const expected = true;
      expect(actual, expected);
    });
    test('1', () {
      final actual = Money.fromInt(1, defaultCurrency).isLessThanOrEqualZero;
      const expected = false;
      expect(actual, expected);
    });
  });

  group('abs >', () {
    test('1.5', () {
      final actual = Money.fromDouble(1.5, defaultCurrency).abs();
      final expected = Money.fromDouble(1.5, defaultCurrency);
      expect(actual, expected);
    });
    test('1', () {
      final actual = Money.fromDouble(1, defaultCurrency).abs();
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('0.99', () {
      final actual = Money.fromDouble(0.99, defaultCurrency).abs();
      final expected = Money.fromDouble(0.99, defaultCurrency);
      expect(actual, expected);
    });
    test('0.01', () {
      final actual = Money.fromDouble(0.01, defaultCurrency).abs();
      final expected = Money.fromDouble(0.01, defaultCurrency);
      expect(actual, expected);
    });
    test('0', () {
      final actual = Money.fromDouble(0, defaultCurrency).abs();
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('-0.01', () {
      final actual = Money.fromDouble(-0.01, defaultCurrency).abs();
      final expected = Money.fromDouble(0.01, defaultCurrency);
      expect(actual, expected);
    });
    test('-0.99', () {
      final actual = Money.fromDouble(-0.99, defaultCurrency).abs();
      final expected = Money.fromDouble(0.99, defaultCurrency);
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Money.fromDouble(-1, defaultCurrency).abs();
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('-1.5', () {
      final actual = Money.fromDouble(-1.5, defaultCurrency).abs();
      final expected = Money.fromDouble(1.5, defaultCurrency);
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual =
          Money.fromDouble(123.456789, defaultCurrency, precision: 0).abs();
      final expected =
          Money.fromDouble(123.456789, defaultCurrency, precision: 0);
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual =
          Money.fromDouble(123.456789, defaultCurrency, precision: 4).abs();
      final expected =
          Money.fromDouble(123.456789, defaultCurrency, precision: 4);
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual =
          Money.fromDouble(-123.456789, defaultCurrency, precision: 0).abs();
      final expected =
          Money.fromDouble(123.456789, defaultCurrency, precision: 0);
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual =
          Money.fromDouble(-123.456789, defaultCurrency, precision: 4).abs();
      final expected =
          Money.fromDouble(123.456789, defaultCurrency, precision: 4);
      expect(actual, expected);
    });
  });

  group('round >', () {
    test('1.5', () {
      final actual = Money.fromDouble(1.5, defaultCurrency).round();
      final expected = Money.fromDouble(2, defaultCurrency);
      expect(actual, expected);
    });
    test('1.49', () {
      final actual = Money.fromDouble(1.49, defaultCurrency).round();
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('1', () {
      final actual = Money.fromDouble(1, defaultCurrency).round();
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('0.5', () {
      final actual = Money.fromDouble(0.50, defaultCurrency).round();
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('0.49', () {
      final actual = Money.fromDouble(0.49, defaultCurrency).round();
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('0', () {
      final actual = Money.fromDouble(0, defaultCurrency).round();
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('-0.49', () {
      final actual = Money.fromDouble(-0.49, defaultCurrency).round();
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('-0.5', () {
      final actual = Money.fromDouble(-0.5, defaultCurrency).round();
      final expected = Money.fromDouble(-1, defaultCurrency);
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Money.fromDouble(-1, defaultCurrency).round();
      final expected = Money.fromDouble(-1, defaultCurrency);
      expect(actual, expected);
    });
    test('-1.49', () {
      final actual = Money.fromDouble(-1.49, defaultCurrency).round();
      final expected = Money.fromDouble(-1, defaultCurrency);
      expect(actual, expected);
    });
    test('-1.5', () {
      final actual = Money.fromDouble(-1.5, defaultCurrency).round();
      final expected = Money.fromDouble(-2, defaultCurrency);
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual =
          Money.fromDouble(123.56789, defaultCurrency, precision: 0).round();
      final expected = Money.fromDouble(124, defaultCurrency, precision: 0);
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual =
          Money.fromDouble(123.56789, defaultCurrency, precision: 4).round();
      final expected = Money.fromDouble(124, defaultCurrency, precision: 4);
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual =
          Money.fromDouble(-123.56789, defaultCurrency, precision: 0).round();
      final expected = Money.fromDouble(-124, defaultCurrency, precision: 0);
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual =
          Money.fromDouble(-123.56789, defaultCurrency, precision: 4).round();
      final expected = Money.fromDouble(-124, defaultCurrency, precision: 4);
      expect(actual, expected);
    });
  });

  group('ceil >', () {
    test('1.5', () {
      final actual = Money.fromDouble(1.5, defaultCurrency).ceil();
      final expected = Money.fromDouble(2, defaultCurrency);
      expect(actual, expected);
    });
    test('1.49', () {
      final actual = Money.fromDouble(1.49, defaultCurrency).ceil();
      final expected = Money.fromDouble(2, defaultCurrency);
      expect(actual, expected);
    });
    test('1', () {
      final actual = Money.fromDouble(1, defaultCurrency).ceil();
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('0.5', () {
      final actual = Money.fromDouble(0.50, defaultCurrency).ceil();
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('0.49', () {
      final actual = Money.fromDouble(0.49, defaultCurrency).ceil();
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('0', () {
      final actual = Money.fromDouble(0, defaultCurrency).ceil();
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('-0.49', () {
      final actual = Money.fromDouble(-0.49, defaultCurrency).ceil();
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('-0.5', () {
      final actual = Money.fromDouble(-0.5, defaultCurrency).ceil();
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Money.fromDouble(-1, defaultCurrency).ceil();
      final expected = Money.fromDouble(-1, defaultCurrency);
      expect(actual, expected);
    });
    test('-1.49', () {
      final actual = Money.fromDouble(-1.49, defaultCurrency).ceil();
      final expected = Money.fromDouble(-1, defaultCurrency);
      expect(actual, expected);
    });
    test('-1.5', () {
      final actual = Money.fromDouble(-1.5, defaultCurrency).ceil();
      final expected = Money.fromDouble(-1, defaultCurrency);
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual =
          Money.fromDouble(123.56789, defaultCurrency, precision: 0).ceil();
      final expected = Money.fromDouble(124, defaultCurrency, precision: 0);
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual =
          Money.fromDouble(123.56789, defaultCurrency, precision: 4).ceil();
      final expected = Money.fromDouble(124, defaultCurrency, precision: 4);
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual =
          Money.fromDouble(-123.56789, defaultCurrency, precision: 0).ceil();
      final expected = Money.fromDouble(-124, defaultCurrency, precision: 0);
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual =
          Money.fromDouble(-123.56789, defaultCurrency, precision: 4).ceil();
      final expected = Money.fromDouble(-123, defaultCurrency, precision: 4);
      expect(actual, expected);
    });
  });

  group('floor >', () {
    test('1.5', () {
      final actual = Money.fromDouble(1.5, defaultCurrency).floor();
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('1.49', () {
      final actual = Money.fromDouble(1.49, defaultCurrency).floor();
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('1', () {
      final actual = Money.fromDouble(1, defaultCurrency).floor();
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('0.5', () {
      final actual = Money.fromDouble(0.50, defaultCurrency).floor();
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('0.49', () {
      final actual = Money.fromDouble(0.49, defaultCurrency).floor();
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('0', () {
      final actual = Money.fromDouble(0, defaultCurrency).floor();
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('-0.49', () {
      final actual = Money.fromDouble(-0.49, defaultCurrency).floor();
      final expected = Money.fromDouble(-1, defaultCurrency);
      expect(actual, expected);
    });
    test('-0.5', () {
      final actual = Money.fromDouble(-0.5, defaultCurrency).floor();
      final expected = Money.fromDouble(-1, defaultCurrency);
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Money.fromDouble(-1, defaultCurrency).floor();
      final expected = Money.fromDouble(-1, defaultCurrency);
      expect(actual, expected);
    });
    test('-1.49', () {
      final actual = Money.fromDouble(-1.49, defaultCurrency).floor();
      final expected = Money.fromDouble(-2, defaultCurrency);
      expect(actual, expected);
    });
    test('-1.5', () {
      final actual = Money.fromDouble(-1.5, defaultCurrency).floor();
      final expected = Money.fromDouble(-2, defaultCurrency);
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual =
          Money.fromDouble(123.56789, defaultCurrency, precision: 0).floor();
      final expected = Money.fromDouble(124, defaultCurrency, precision: 0);
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual =
          Money.fromDouble(123.56789, defaultCurrency, precision: 4).floor();
      final expected = Money.fromDouble(123, defaultCurrency, precision: 4);
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual =
          Money.fromDouble(-123.56789, defaultCurrency, precision: 0).floor();
      final expected = Money.fromDouble(-124, defaultCurrency, precision: 0);
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual =
          Money.fromDouble(-123.56789, defaultCurrency, precision: 4).floor();
      final expected = Money.fromDouble(-124, defaultCurrency, precision: 4);
      expect(actual, expected);
    });
  });

  group('subtraction >', () {
    test('1.5', () {
      final actual = -Money.fromDouble(1.5, defaultCurrency);
      final expected = Money.fromDouble(-1.5, defaultCurrency);
      expect(actual, expected);
    });
    test('1', () {
      final actual = -Money.fromDouble(1, defaultCurrency);
      final expected = Money.fromDouble(-1, defaultCurrency);
      expect(actual, expected);
    });
    test('0.99', () {
      final actual = -Money.fromDouble(0.99, defaultCurrency);
      final expected = Money.fromDouble(-0.99, defaultCurrency);
      expect(actual, expected);
    });
    test('0.01', () {
      final actual = -Money.fromDouble(0.01, defaultCurrency);
      final expected = Money.fromDouble(-0.01, defaultCurrency);
      expect(actual, expected);
    });
    test('0', () {
      final actual = -Money.fromDouble(0, defaultCurrency);
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('-0.01', () {
      final actual = -Money.fromDouble(-0.01, defaultCurrency);
      final expected = Money.fromDouble(0.01, defaultCurrency);
      expect(actual, expected);
    });
    test('-0.99', () {
      final actual = -Money.fromDouble(-0.99, defaultCurrency);
      final expected = Money.fromDouble(0.99, defaultCurrency);
      expect(actual, expected);
    });
    test('-1', () {
      final actual = -Money.fromDouble(-1, defaultCurrency);
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('-1.5', () {
      final actual = -Money.fromDouble(-1.5, defaultCurrency);
      final expected = Money.fromDouble(1.5, defaultCurrency);
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual =
          -Money.fromDouble(123.56789, defaultCurrency, precision: 0);
      final expected =
          Money.fromDouble(-123.56789, defaultCurrency, precision: 0);
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual =
          -Money.fromDouble(123.56789, defaultCurrency, precision: 4);
      final expected =
          Money.fromDouble(-123.56789, defaultCurrency, precision: 4);
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual =
          -Money.fromDouble(-123.56789, defaultCurrency, precision: 0);
      final expected =
          Money.fromDouble(123.56789, defaultCurrency, precision: 0);
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual =
          -Money.fromDouble(-123.56789, defaultCurrency, precision: 4);
      final expected =
          Money.fromDouble(123.56789, defaultCurrency, precision: 4);
      expect(actual, expected);
    });
  });

  group('hashCode >', () {
    test('value 1.11, precision 2', () {
      final money = Money.fromDouble(1.11, FiatCurrency.$default, precision: 2);
      final actual = money.hashCode;
      final expected = money.value.hashCode ^
          money.precision.hashCode ^
          money.currency.hashCode;
      expect(actual, expected);
    });
  });

  group('toAmount >', () {
    test('1.5', () {
      final actual = Money.fromDouble(1.5, defaultCurrency).toAmount();
      final expected = Amount.fromDouble(1.5);
      expect(actual, expected);
    });
    test('1', () {
      final actual = Money.fromDouble(1, defaultCurrency).toAmount();
      final expected = Amount.oneIntOf(defaultCurrency.precision);
      expect(actual, expected);
    });
    test('0.99', () {
      final actual = Money.fromDouble(0.99, defaultCurrency).toAmount();
      final expected =
          Amount.fromDouble(0.99, precision: defaultCurrency.precision);
      expect(actual, expected);
    });
    test('0.01', () {
      final actual = Money.fromDouble(0.01, defaultCurrency).toAmount();
      final expected = Amount.oneOf(defaultCurrency.precision);
      expect(actual, expected);
    });
    test('0', () {
      final actual = Money.fromDouble(0, defaultCurrency).toAmount();
      final expected = Amount.zeroOf(defaultCurrency.precision);
      expect(actual, expected);
    });
    test('-0.01', () {
      final actual = Money.fromDouble(-0.01, defaultCurrency).toAmount();
      final expected = -Amount.oneOf(defaultCurrency.precision);
      expect(actual, expected);
    });
    test('-0.99', () {
      final actual = Money.fromDouble(-0.99, defaultCurrency).toAmount();
      final expected =
          Amount.fromDouble(-0.99, precision: defaultCurrency.precision);
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Money.fromDouble(-1, defaultCurrency).toAmount();
      final expected = -Amount.oneIntOf(defaultCurrency.precision);
      expect(actual, expected);
    });
    test('-1.5', () {
      final actual = Money.fromDouble(-1.5, defaultCurrency).toAmount();
      final expected =
          Amount.fromDouble(-1.5, precision: defaultCurrency.precision);
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual =
          Money.fromDouble(123.56789, defaultCurrency, precision: 0).toAmount();
      final expected = Amount.fromDouble(124.0, precision: 0);
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual =
          Money.fromDouble(123.56789, defaultCurrency, precision: 4).toAmount();
      final expected = Amount.fromDouble(123.5679, precision: 4);
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual = Money.fromDouble(-123.56789, defaultCurrency, precision: 0)
          .toAmount();
      final expected = Amount.fromDouble(-124.0, precision: 0);
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual = Money.fromDouble(-123.56789, defaultCurrency, precision: 4)
          .toAmount();
      final expected = Amount.fromDouble(-123.5679, precision: 4);
      expect(actual, expected);
    });
  });

  group('toString >', () {
    group('AF-RF-DSF >', () {
      test('fixedDouble/none/point', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        final expected = '1000.10${defaultCurrency.icon}';
        expect(actual, expected);
      });
      test('fixedDouble/space/point', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.space,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        final expected = '1 000.10${defaultCurrency.icon}';
        expect(actual, expected);
      });
      test('fixedDouble/none/comma', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        final expected = '1000,10${defaultCurrency.icon}';
        expect(actual, expected);
      });
      test('fixedDouble/space/comma', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.space,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        final expected = '1 000,10${defaultCurrency.icon}';
        expect(actual, expected);
      });
      test('fixedDouble precision 0', () {
        final actual = Money.fromDouble(
          100.123456,
          defaultCurrency,
          precision: 0,
        ).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.fixedDouble,
        );
        final expected = '100${defaultCurrency.icon}';
        expect(actual, expected);
      });
      test('fixedDouble precision 4', () {
        final actual = Money.fromDouble(
          100.123456,
          defaultCurrency,
          precision: 4,
        ).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.fixedDouble,
        );
        final expected = '100.1235${defaultCurrency.icon}';
        expect(actual, expected);
      });
      test('fixedDouble precision 8', () {
        final actual = Money.fromDouble(
          100.123456,
          defaultCurrency,
          precision: 8,
        ).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.fixedDouble,
        );
        final expected = '100.12345600${defaultCurrency.icon}';
        expect(actual, expected);
      });

      test('integer/none/point', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.integer,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        final expected = '1000${defaultCurrency.icon}';
        expect(actual, expected);
      });
      test('integer/space/point', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.integer,
          rankFormat: RankFormat.space,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        final expected = '1 000${defaultCurrency.icon}';
        expect(actual, expected);
      });
      test('integer/none/comma', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.integer,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        final expected = '1000${defaultCurrency.icon}';
        expect(actual, expected);
      });
      test('integer/space/comma', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.integer,
          rankFormat: RankFormat.space,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        final expected = '1 000${defaultCurrency.icon}';
        expect(actual, expected);
      });
      test('integer precision 0', () {
        final actual = Money.fromDouble(
          100.123456,
          defaultCurrency,
          precision: 0,
        ).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.integer,
        );
        final expected = '100${defaultCurrency.icon}';
        expect(actual, expected);
      });
      test('integer precision 4', () {
        final actual = Money.fromDouble(
          100.123456,
          defaultCurrency,
          precision: 4,
        ).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.integer,
        );
        final expected = '100${defaultCurrency.icon}';
        expect(actual, expected);
      });
      test('integer precision 8', () {
        final actual = Money.fromDouble(
          100.123456,
          defaultCurrency,
          precision: 8,
        ).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.integer,
        );
        final expected = '100${defaultCurrency.icon}';
        expect(actual, expected);
      });

      test('flexibleDouble/none/point', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.flexibleDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        final expected = '1000.1${defaultCurrency.icon}';
        expect(actual, expected);
      });
      test('flexibleDouble/space/point', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.flexibleDouble,
          rankFormat: RankFormat.space,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        final expected = '1 000.1${defaultCurrency.icon}';
        expect(actual, expected);
      });
      test('flexibleDouble/none/comma', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.flexibleDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        final expected = '1000,1${defaultCurrency.icon}';
        expect(actual, expected);
      });
      test('flexibleDouble/space/comma', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.flexibleDouble,
          rankFormat: RankFormat.space,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        final expected = '1 000,1${defaultCurrency.icon}';
        expect(actual, expected);
      });
      test('flexibleDouble precision 0', () {
        final actual = Money.fromDouble(
          100.123456,
          defaultCurrency,
          precision: 0,
        ).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.flexibleDouble,
        );
        final expected = '100${defaultCurrency.icon}';
        expect(actual, expected);
      });
      test('flexibleDouble precision 4', () {
        final actual = Money.fromDouble(
          100.123456,
          defaultCurrency,
          precision: 4,
        ).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.flexibleDouble,
        );
        final expected = '100.1235${defaultCurrency.icon}';
        expect(actual, expected);
      });
      test('flexibleDouble precision 8', () {
        final actual = Money.fromDouble(
          100.123456,
          defaultCurrency,
          precision: 8,
        ).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.flexibleDouble,
        );
        final expected = '100.123456${defaultCurrency.icon}';
        expect(actual, expected);
      });
    });

    group('CP-CF-DSF >', () {
      test('start/icon/point', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.start,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        final expected = '${defaultCurrency.icon}1000.10';
        expect(actual, expected);
      });
      test('start/code/point', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.start,
          currencyFormat: FiatCurrencyFormat.code,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        final expected = '${defaultCurrency.code}1000.10';
        expect(actual, expected);
      });
      test('start/none/point', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.start,
          currencyFormat: FiatCurrencyFormat.none,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        const expected = '1000.10';
        expect(actual, expected);
      });
      test('start/icon/comma', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.start,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        final expected = '${defaultCurrency.icon}1000,10';
        expect(actual, expected);
      });
      test('start/code/comma', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.start,
          currencyFormat: FiatCurrencyFormat.code,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        final expected = '${defaultCurrency.code}1000,10';
        expect(actual, expected);
      });
      test('start/none/comma', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.start,
          currencyFormat: FiatCurrencyFormat.none,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        const expected = '1000,10';
        expect(actual, expected);
      });

      test('startSpaced/icon/point', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.startSpaced,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        final expected = '${defaultCurrency.icon} 1000.10';
        expect(actual, expected);
      });
      test('startSpaced/code/point', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.startSpaced,
          currencyFormat: FiatCurrencyFormat.code,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        final expected = '${defaultCurrency.code} 1000.10';
        expect(actual, expected);
      });
      test('startSpaced/none/point', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.startSpaced,
          currencyFormat: FiatCurrencyFormat.none,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        const expected = '1000.10';
        expect(actual, expected);
      });
      test('startSpaced/icon/comma', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.startSpaced,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        final expected = '${defaultCurrency.icon} 1000,10';
        expect(actual, expected);
      });
      test('startSpaced/code/comma', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.startSpaced,
          currencyFormat: FiatCurrencyFormat.code,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        final expected = '${defaultCurrency.code} 1000,10';
        expect(actual, expected);
      });
      test('startSpaced/none/comma', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.startSpaced,
          currencyFormat: FiatCurrencyFormat.none,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        const expected = '1000,10';
        expect(actual, expected);
      });

      test('end/icon/point', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        final expected = '1000.10${defaultCurrency.icon}';
        expect(actual, expected);
      });
      test('end/code/point', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.code,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        final expected = '1000.10${defaultCurrency.code}';
        expect(actual, expected);
      });
      test('end/none/point', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.none,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        const expected = '1000.10';
        expect(actual, expected);
      });
      test('end/icon/comma', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        final expected = '1000,10${defaultCurrency.icon}';
        expect(actual, expected);
      });
      test('end/code/comma', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.code,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        final expected = '1000,10${defaultCurrency.code}';
        expect(actual, expected);
      });
      test('end/none/comma', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.none,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        const expected = '1000,10';
        expect(actual, expected);
      });

      test('endSpaced/icon/point', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.endSpaced,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        final expected = '1000.10 ${defaultCurrency.icon}';
        expect(actual, expected);
      });
      test('endSpaced/code/point', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.endSpaced,
          currencyFormat: FiatCurrencyFormat.code,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        final expected = '1000.10 ${defaultCurrency.code}';
        expect(actual, expected);
      });
      test('endSpaced/none/point', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.endSpaced,
          currencyFormat: FiatCurrencyFormat.none,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        const expected = '1000.10';
        expect(actual, expected);
      });
      test('endSpaced/icon/comma', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.endSpaced,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        final expected = '1000,10 ${defaultCurrency.icon}';
        expect(actual, expected);
      });
      test('endSpaced/code/comma', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.endSpaced,
          currencyFormat: FiatCurrencyFormat.code,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        final expected = '1000,10 ${defaultCurrency.code}';
        expect(actual, expected);
      });
      test('endSpaced/none/comma', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.endSpaced,
          currencyFormat: FiatCurrencyFormat.none,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        const expected = '1000,10';
        expect(actual, expected);
      });

      test('decimalSeparator/icon/point', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.decimalSeparator,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        final expected = '1000${defaultCurrency.icon}10';
        expect(actual, expected);
      });
      test('decimalSeparator/code/point', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.decimalSeparator,
          currencyFormat: FiatCurrencyFormat.code,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        final expected = '1000${defaultCurrency.code}10';
        expect(actual, expected);
      });
      test('decimalSeparator/none/point', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.decimalSeparator,
          currencyFormat: FiatCurrencyFormat.none,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        const expected = '1000.10';
        expect(actual, expected);
      });
      test('decimalSeparator/icon/comma', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.decimalSeparator,
          currencyFormat: FiatCurrencyFormat.icon,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        final expected = '1000${defaultCurrency.icon}10';
        expect(actual, expected);
      });
      test('decimalSeparator/code/comma', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.decimalSeparator,
          currencyFormat: FiatCurrencyFormat.code,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        final expected = '1000${defaultCurrency.code}10';
        expect(actual, expected);
      });
      test('decimalSeparator/none/comma', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.decimalSeparator,
          currencyFormat: FiatCurrencyFormat.none,
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        const expected = '1000,10';
        expect(actual, expected);
      });
    });
  });
}
