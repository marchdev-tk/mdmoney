// ignore_for_file: avoid_redundant_argument_values

import 'package:mdmoney/mdmoney.dart';
import 'package:test/test.dart';

import 'constants.dart';

void main() {
  group('integer >', () {
    test('1.5${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1.5, defaultCurrency).integer;
      final expected = BigInt.one;
      expect(actual, expected);
    });
    test('1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1, defaultCurrency).integer;
      final expected = BigInt.one;
      expect(actual, expected);
    });
    test('99 cents', () {
      final actual = Money.fromDouble(0.99, defaultCurrency).integer;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('1 cent', () {
      final actual = Money.fromDouble(0.01, defaultCurrency).integer;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('0 cents', () {
      final actual = Money.fromDouble(0, defaultCurrency).integer;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('-1 cent', () {
      final actual = Money.fromDouble(-0.01, defaultCurrency).integer;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('-99 cents', () {
      final actual = Money.fromDouble(-0.99, defaultCurrency).integer;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('-1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1, defaultCurrency).integer;
      final expected = -BigInt.one;
      expect(actual, expected);
    });
    test('-1.5${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1.5, defaultCurrency).integer;
      final expected = -BigInt.one;
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual =
          Money.fromDouble(123.456789, defaultCurrency, precision: 0).integer;
      final expected = BigInt.from(123);
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual =
          Money.fromDouble(123.456789, defaultCurrency, precision: 4).integer;
      final expected = BigInt.from(123);
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual =
          Money.fromDouble(-123.456789, defaultCurrency, precision: 0).integer;
      final expected = -BigInt.from(123);
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual =
          Money.fromDouble(-123.456789, defaultCurrency, precision: 4).integer;
      final expected = -BigInt.from(123);
      expect(actual, expected);
    });
  });

  group('fractional >', () {
    test('1.5${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1.5, defaultCurrency).fractional;
      final expected = BigInt.from(50);
      expect(actual, expected);
    });
    test('1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1, defaultCurrency).fractional;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('99 cents', () {
      final actual = Money.fromDouble(0.99, defaultCurrency).fractional;
      final expected = BigInt.from(99);
      expect(actual, expected);
    });
    test('1 cent', () {
      final actual = Money.fromDouble(0.01, defaultCurrency).fractional;
      final expected = BigInt.one;
      expect(actual, expected);
    });
    test('0 cents', () {
      final actual = Money.fromDouble(0, defaultCurrency).fractional;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('-1 cent', () {
      final actual = Money.fromDouble(-0.01, defaultCurrency).fractional;
      final expected = -BigInt.one;
      expect(actual, expected);
    });
    test('-99 cents', () {
      final actual = Money.fromDouble(-0.99, defaultCurrency).fractional;
      final expected = -BigInt.from(99);
      expect(actual, expected);
    });
    test('-1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1, defaultCurrency).fractional;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('-1.5${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1.5, defaultCurrency).fractional;
      final expected = -BigInt.from(50);
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual = Money.fromDouble(123.456789, defaultCurrency, precision: 0)
          .fractional;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual = Money.fromDouble(123.456789, defaultCurrency, precision: 4)
          .fractional;
      final expected = BigInt.from(4568);
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual =
          Money.fromDouble(-123.456789, defaultCurrency, precision: 0)
              .fractional;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual =
          Money.fromDouble(-123.456789, defaultCurrency, precision: 4)
              .fractional;
      final expected = -BigInt.from(4568);
      expect(actual, expected);
    });
  });

  group('fractionalDecimal >', () {
    test('1.5${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1.5, defaultCurrency).fractionalDecimal;
      final expected = Decimal.parse('0.5');
      expect(actual, expected);
    });
    test('1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1, defaultCurrency).fractionalDecimal;
      final expected = Decimal.zero;
      expect(actual, expected);
    });
    test('99 cents', () {
      final actual = Money.fromDouble(0.99, defaultCurrency).fractionalDecimal;
      final expected = Decimal.parse('0.99');
      expect(actual, expected);
    });
    test('1 cent', () {
      final actual = Money.fromDouble(0.01, defaultCurrency).fractionalDecimal;
      final expected = Decimal.parse('0.01');
      expect(actual, expected);
    });
    test('0 cents', () {
      final actual = Money.fromDouble(0, defaultCurrency).fractionalDecimal;
      final expected = Decimal.zero;
      expect(actual, expected);
    });
    test('-1 cent', () {
      final actual = Money.fromDouble(-0.01, defaultCurrency).fractionalDecimal;
      final expected = Decimal.parse('-0.01');
      expect(actual, expected);
    });
    test('-99 cents', () {
      final actual = Money.fromDouble(-0.99, defaultCurrency).fractionalDecimal;
      final expected = Decimal.parse('-0.99');
      expect(actual, expected);
    });
    test('-1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1, defaultCurrency).fractionalDecimal;
      final expected = Decimal.zero;
      expect(actual, expected);
    });
    test('-1.5${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1.5, defaultCurrency).fractionalDecimal;
      final expected = Decimal.parse('-0.5');
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual = Money.fromDouble(123.456789, defaultCurrency, precision: 0)
          .fractionalDecimal;
      final expected = Decimal.zero;
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual = Money.fromDouble(123.456789, defaultCurrency, precision: 4)
          .fractionalDecimal;
      final expected = Decimal.parse('0.4568');
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual =
          Money.fromDouble(-123.456789, defaultCurrency, precision: 0)
              .fractionalDecimal;
      final expected = Decimal.zero;
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual =
          Money.fromDouble(-123.456789, defaultCurrency, precision: 4)
              .fractionalDecimal;
      final expected = -Decimal.parse('0.4568');
      expect(actual, expected);
    });
  });

  group('fractionalDouble >', () {
    test('1.5${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1.5, defaultCurrency).fractionalDouble;
      const expected = 0.5;
      expect(actual, expected);
    });
    test('1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1, defaultCurrency).fractionalDouble;
      const expected = 0.0;
      expect(actual, expected);
    });
    test('99 cents', () {
      final actual = Money.fromDouble(0.99, defaultCurrency).fractionalDouble;
      const expected = 0.99;
      expect(actual, expected);
    });
    test('1 cent', () {
      final actual = Money.fromDouble(0.01, defaultCurrency).fractionalDouble;
      const expected = 0.01;
      expect(actual, expected);
    });
    test('0 cents', () {
      final actual = Money.fromDouble(0, defaultCurrency).fractionalDouble;
      const expected = 0;
      expect(actual, expected);
    });
    test('-1 cent', () {
      final actual = Money.fromDouble(-0.01, defaultCurrency).fractionalDouble;
      const expected = -0.01;
      expect(actual, expected);
    });
    test('-99 cents', () {
      final actual = Money.fromDouble(-0.99, defaultCurrency).fractionalDouble;
      const expected = -0.99;
      expect(actual, expected);
    });
    test('-1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1, defaultCurrency).fractionalDouble;
      const expected = 0.0;
      expect(actual, expected);
    });
    test('-1.5${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1.5, defaultCurrency).fractionalDouble;
      const expected = -0.5;
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual = Money.fromDouble(123.456789, defaultCurrency, precision: 0)
          .fractionalDouble;
      const expected = 0.0;
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual = Money.fromDouble(123.456789, defaultCurrency, precision: 4)
          .fractionalDouble;
      const expected = 0.4568;
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual =
          Money.fromDouble(-123.456789, defaultCurrency, precision: 0)
              .fractionalDouble;
      const expected = 0.0;
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual =
          Money.fromDouble(-123.456789, defaultCurrency, precision: 4)
              .fractionalDouble;
      const expected = -0.4568;
      expect(actual, expected);
    });
  });

  group('sign >', () {
    test('1.5${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1.5, defaultCurrency).sign;
      const expected = 1;
      expect(actual, expected);
    });
    test('1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1, defaultCurrency).sign;
      const expected = 1;
      expect(actual, expected);
    });
    test('99 cents', () {
      final actual = Money.fromDouble(0.99, defaultCurrency).sign;
      const expected = 1;
      expect(actual, expected);
    });
    test('1 cent', () {
      final actual = Money.fromDouble(0.01, defaultCurrency).sign;
      const expected = 1;
      expect(actual, expected);
    });
    test('0 cents', () {
      final actual = Money.fromDouble(0, defaultCurrency).sign;
      const expected = 0;
      expect(actual, expected);
    });
    test('-1 cent', () {
      final actual = Money.fromDouble(-0.01, defaultCurrency).sign;
      const expected = -1;
      expect(actual, expected);
    });
    test('-99 cents', () {
      final actual = Money.fromDouble(-0.99, defaultCurrency).sign;
      const expected = -1;
      expect(actual, expected);
    });
    test('-1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1, defaultCurrency).sign;
      const expected = -1;
      expect(actual, expected);
    });
    test('-1.5${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1.5, defaultCurrency).sign;
      const expected = -1;
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual =
          Money.fromDouble(123.456789, defaultCurrency, precision: 0).sign;
      const expected = 1;
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual =
          Money.fromDouble(123.456789, defaultCurrency, precision: 4).sign;
      const expected = 1;
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual =
          Money.fromDouble(-123.456789, defaultCurrency, precision: 0).sign;
      const expected = -1;
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual =
          Money.fromDouble(-123.456789, defaultCurrency, precision: 4).sign;
      const expected = -1;
      expect(actual, expected);
    });
  });

  group('isEven >', () {
    test('1.51${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1.51, defaultCurrency).isEven;
      const expected = false;
      expect(actual, expected);
    });
    test('1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1, defaultCurrency).isEven;
      const expected = true;
      expect(actual, expected);
    });
    test('51 cents', () {
      final actual = Money.fromDouble(0.51, defaultCurrency).isEven;
      const expected = false;
      expect(actual, expected);
    });
    test('2 cents', () {
      final actual = Money.fromDouble(0.02, defaultCurrency).isEven;
      const expected = true;
      expect(actual, expected);
    });
    test('0 cents', () {
      final actual = Money.fromDouble(0, defaultCurrency).isEven;
      const expected = true;
      expect(actual, expected);
    });
    test('-2 cents', () {
      final actual = Money.fromDouble(-0.02, defaultCurrency).isEven;
      const expected = true;
      expect(actual, expected);
    });
    test('-51 cents', () {
      final actual = Money.fromDouble(-0.51, defaultCurrency).isEven;
      const expected = false;
      expect(actual, expected);
    });
    test('-1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1, defaultCurrency).isEven;
      const expected = true;
      expect(actual, expected);
    });
    test('-1.51${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1.51, defaultCurrency).isEven;
      const expected = false;
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual =
          Money.fromDouble(123.456789, defaultCurrency, precision: 0).isEven;
      const expected = false;
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual =
          Money.fromDouble(123.456789, defaultCurrency, precision: 4).isEven;
      const expected = true;
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual =
          Money.fromDouble(-123.456789, defaultCurrency, precision: 0).isEven;
      const expected = false;
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual =
          Money.fromDouble(-123.456789, defaultCurrency, precision: 4).isEven;
      const expected = true;
      expect(actual, expected);
    });
  });

  group('isOdd >', () {
    test('1.51${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1.51, defaultCurrency).isOdd;
      const expected = true;
      expect(actual, expected);
    });
    test('1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1, defaultCurrency).isOdd;
      const expected = false;
      expect(actual, expected);
    });
    test('51 cents', () {
      final actual = Money.fromDouble(0.51, defaultCurrency).isOdd;
      const expected = true;
      expect(actual, expected);
    });
    test('2 cents', () {
      final actual = Money.fromDouble(0.02, defaultCurrency).isOdd;
      const expected = false;
      expect(actual, expected);
    });
    test('0 cents', () {
      final actual = Money.fromDouble(0, defaultCurrency).isOdd;
      const expected = false;
      expect(actual, expected);
    });
    test('-2 cents', () {
      final actual = Money.fromDouble(-0.02, defaultCurrency).isOdd;
      const expected = false;
      expect(actual, expected);
    });
    test('-51 cents', () {
      final actual = Money.fromDouble(-0.51, defaultCurrency).isOdd;
      const expected = true;
      expect(actual, expected);
    });
    test('-1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1, defaultCurrency).isOdd;
      const expected = false;
      expect(actual, expected);
    });
    test('-1.51${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1.51, defaultCurrency).isOdd;
      const expected = true;
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual =
          Money.fromDouble(123.456789, defaultCurrency, precision: 0).isOdd;
      const expected = true;
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual =
          Money.fromDouble(123.456789, defaultCurrency, precision: 4).isOdd;
      const expected = false;
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual =
          Money.fromDouble(-123.456789, defaultCurrency, precision: 0).isOdd;
      const expected = true;
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual =
          Money.fromDouble(-123.456789, defaultCurrency, precision: 4).isOdd;
      const expected = false;
      expect(actual, expected);
    });
  });

  group('isNegative >', () {
    test('1.5${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1.5, defaultCurrency).isNegative;
      const expected = false;
      expect(actual, expected);
    });
    test('1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1, defaultCurrency).isNegative;
      const expected = false;
      expect(actual, expected);
    });
    test('1 cent', () {
      final actual = Money.fromDouble(0.01, defaultCurrency).isNegative;
      const expected = false;
      expect(actual, expected);
    });
    test('0 cents', () {
      final actual = Money.fromDouble(0, defaultCurrency).isNegative;
      const expected = false;
      expect(actual, expected);
    });
    test('-1 cent', () {
      final actual = Money.fromDouble(-0.01, defaultCurrency).isNegative;
      const expected = true;
      expect(actual, expected);
    });
    test('-1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1, defaultCurrency).isNegative;
      const expected = true;
      expect(actual, expected);
    });
    test('-1.5${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1.5, defaultCurrency).isNegative;
      const expected = true;
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual = Money.fromDouble(123.456789, defaultCurrency, precision: 0)
          .isNegative;
      const expected = false;
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual = Money.fromDouble(123.456789, defaultCurrency, precision: 4)
          .isNegative;
      const expected = false;
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual =
          Money.fromDouble(-123.456789, defaultCurrency, precision: 0)
              .isNegative;
      const expected = true;
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual =
          Money.fromDouble(-123.456789, defaultCurrency, precision: 4)
              .isNegative;
      const expected = true;
      expect(actual, expected);
    });
  });

  group('isPositive >', () {
    test('1.5${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1.5, defaultCurrency).isPositive;
      const expected = true;
      expect(actual, expected);
    });
    test('1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1, defaultCurrency).isPositive;
      const expected = true;
      expect(actual, expected);
    });
    test('1 cent', () {
      final actual = Money.fromDouble(0.01, defaultCurrency).isPositive;
      const expected = true;
      expect(actual, expected);
    });
    test('0 cents', () {
      final actual = Money.fromDouble(0, defaultCurrency).isPositive;
      const expected = true;
      expect(actual, expected);
    });
    test('-1 cent', () {
      final actual = Money.fromDouble(-0.01, defaultCurrency).isPositive;
      const expected = false;
      expect(actual, expected);
    });
    test('-1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1, defaultCurrency).isPositive;
      const expected = false;
      expect(actual, expected);
    });
    test('-1.5${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1.5, defaultCurrency).isPositive;
      const expected = false;
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual = Money.fromDouble(123.456789, defaultCurrency, precision: 0)
          .isPositive;
      const expected = true;
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual = Money.fromDouble(123.456789, defaultCurrency, precision: 4)
          .isPositive;
      const expected = true;
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual =
          Money.fromDouble(-123.456789, defaultCurrency, precision: 0)
              .isPositive;
      const expected = false;
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual =
          Money.fromDouble(-123.456789, defaultCurrency, precision: 4)
              .isPositive;
      const expected = false;
      expect(actual, expected);
    });
  });

  group('abs >', () {
    test('1.5${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1.5, defaultCurrency).abs();
      final expected = Money.fromDouble(1.5, defaultCurrency);
      expect(actual, expected);
    });
    test('1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1, defaultCurrency).abs();
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('99 cents', () {
      final actual = Money.fromDouble(0.99, defaultCurrency).abs();
      final expected = Money.fromDouble(0.99, defaultCurrency);
      expect(actual, expected);
    });
    test('1 cent', () {
      final actual = Money.fromDouble(0.01, defaultCurrency).abs();
      final expected = Money.fromDouble(0.01, defaultCurrency);
      expect(actual, expected);
    });
    test('0 cents', () {
      final actual = Money.fromDouble(0, defaultCurrency).abs();
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('-1 cent', () {
      final actual = Money.fromDouble(-0.01, defaultCurrency).abs();
      final expected = Money.fromDouble(0.01, defaultCurrency);
      expect(actual, expected);
    });
    test('-99 cents', () {
      final actual = Money.fromDouble(-0.99, defaultCurrency).abs();
      final expected = Money.fromDouble(0.99, defaultCurrency);
      expect(actual, expected);
    });
    test('-1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1, defaultCurrency).abs();
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('-1.5${defaultCurrency.icon}', () {
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
    test('1.5${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1.5, defaultCurrency).round();
      final expected = Money.fromDouble(2, defaultCurrency);
      expect(actual, expected);
    });
    test('1.49${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1.49, defaultCurrency).round();
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1, defaultCurrency).round();
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('50 cents', () {
      final actual = Money.fromDouble(0.50, defaultCurrency).round();
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('49 cent', () {
      final actual = Money.fromDouble(0.49, defaultCurrency).round();
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('0 cents', () {
      final actual = Money.fromDouble(0, defaultCurrency).round();
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('-49 cent', () {
      final actual = Money.fromDouble(-0.49, defaultCurrency).round();
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('-50 cents', () {
      final actual = Money.fromDouble(-0.5, defaultCurrency).round();
      final expected = Money.fromDouble(-1, defaultCurrency);
      expect(actual, expected);
    });
    test('-1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1, defaultCurrency).round();
      final expected = Money.fromDouble(-1, defaultCurrency);
      expect(actual, expected);
    });
    test('-1.49${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1.49, defaultCurrency).round();
      final expected = Money.fromDouble(-1, defaultCurrency);
      expect(actual, expected);
    });
    test('-1.5${defaultCurrency.icon}', () {
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
    test('1.5${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1.5, defaultCurrency).ceil();
      final expected = Money.fromDouble(2, defaultCurrency);
      expect(actual, expected);
    });
    test('1.49${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1.49, defaultCurrency).ceil();
      final expected = Money.fromDouble(2, defaultCurrency);
      expect(actual, expected);
    });
    test('1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1, defaultCurrency).ceil();
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('50 cents', () {
      final actual = Money.fromDouble(0.50, defaultCurrency).ceil();
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('49 cent', () {
      final actual = Money.fromDouble(0.49, defaultCurrency).ceil();
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('0 cents', () {
      final actual = Money.fromDouble(0, defaultCurrency).ceil();
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('-49 cent', () {
      final actual = Money.fromDouble(-0.49, defaultCurrency).ceil();
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('-50 cents', () {
      final actual = Money.fromDouble(-0.5, defaultCurrency).ceil();
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('-1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1, defaultCurrency).ceil();
      final expected = Money.fromDouble(-1, defaultCurrency);
      expect(actual, expected);
    });
    test('-1.49${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1.49, defaultCurrency).ceil();
      final expected = Money.fromDouble(-1, defaultCurrency);
      expect(actual, expected);
    });
    test('-1.5${defaultCurrency.icon}', () {
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
    test('1.5${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1.5, defaultCurrency).floor();
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('1.49${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1.49, defaultCurrency).floor();
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1, defaultCurrency).floor();
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('50 cents', () {
      final actual = Money.fromDouble(0.50, defaultCurrency).floor();
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('49 cent', () {
      final actual = Money.fromDouble(0.49, defaultCurrency).floor();
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('0 cents', () {
      final actual = Money.fromDouble(0, defaultCurrency).floor();
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('-49 cent', () {
      final actual = Money.fromDouble(-0.49, defaultCurrency).floor();
      final expected = Money.fromDouble(-1, defaultCurrency);
      expect(actual, expected);
    });
    test('-50 cents', () {
      final actual = Money.fromDouble(-0.5, defaultCurrency).floor();
      final expected = Money.fromDouble(-1, defaultCurrency);
      expect(actual, expected);
    });
    test('-1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1, defaultCurrency).floor();
      final expected = Money.fromDouble(-1, defaultCurrency);
      expect(actual, expected);
    });
    test('-1.49${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1.49, defaultCurrency).floor();
      final expected = Money.fromDouble(-2, defaultCurrency);
      expect(actual, expected);
    });
    test('-1.5${defaultCurrency.icon}', () {
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
    test('1.5${defaultCurrency.icon}', () {
      final actual = -Money.fromDouble(1.5, defaultCurrency);
      final expected = Money.fromDouble(-1.5, defaultCurrency);
      expect(actual, expected);
    });
    test('1${defaultCurrency.icon}', () {
      final actual = -Money.fromDouble(1, defaultCurrency);
      final expected = Money.fromDouble(-1, defaultCurrency);
      expect(actual, expected);
    });
    test('99 cents', () {
      final actual = -Money.fromDouble(0.99, defaultCurrency);
      final expected = Money.fromDouble(-0.99, defaultCurrency);
      expect(actual, expected);
    });
    test('1 cent', () {
      final actual = -Money.fromDouble(0.01, defaultCurrency);
      final expected = Money.fromDouble(-0.01, defaultCurrency);
      expect(actual, expected);
    });
    test('0 cents', () {
      final actual = -Money.fromDouble(0, defaultCurrency);
      final expected = Money.fromDouble(0, defaultCurrency);
      expect(actual, expected);
    });
    test('-1 cent', () {
      final actual = -Money.fromDouble(-0.01, defaultCurrency);
      final expected = Money.fromDouble(0.01, defaultCurrency);
      expect(actual, expected);
    });
    test('-99 cents', () {
      final actual = -Money.fromDouble(-0.99, defaultCurrency);
      final expected = Money.fromDouble(0.99, defaultCurrency);
      expect(actual, expected);
    });
    test('-1${defaultCurrency.icon}', () {
      final actual = -Money.fromDouble(-1, defaultCurrency);
      final expected = Money.fromDouble(1, defaultCurrency);
      expect(actual, expected);
    });
    test('-1.5${defaultCurrency.icon}', () {
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

  group('toDecimal >', () {
    test('1.5${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1.5, defaultCurrency).toDecimal();
      final expected = Decimal.parse('1.5');
      expect(actual, expected);
    });
    test('1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1, defaultCurrency).toDecimal();
      final expected = Decimal.parse('1');
      expect(actual, expected);
    });
    test('99 cents', () {
      final actual = Money.fromDouble(0.99, defaultCurrency).toDecimal();
      final expected = Decimal.parse('0.99');
      expect(actual, expected);
    });
    test('1 cent', () {
      final actual = Money.fromDouble(0.01, defaultCurrency).toDecimal();
      final expected = Decimal.parse('0.01');
      expect(actual, expected);
    });
    test('0 cents', () {
      final actual = Money.fromDouble(0, defaultCurrency).toDecimal();
      final expected = Decimal.parse('0.0');
      expect(actual, expected);
    });
    test('-1 cent', () {
      final actual = Money.fromDouble(-0.01, defaultCurrency).toDecimal();
      final expected = Decimal.parse('-0.01');
      expect(actual, expected);
    });
    test('-99 cents', () {
      final actual = Money.fromDouble(-0.99, defaultCurrency).toDecimal();
      final expected = Decimal.parse('-0.99');
      expect(actual, expected);
    });
    test('-1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1, defaultCurrency).toDecimal();
      final expected = Decimal.parse('-1');
      expect(actual, expected);
    });
    test('-1.5${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1.5, defaultCurrency).toDecimal();
      final expected = Decimal.parse('-1.5');
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual = Money.fromDouble(123.56789, defaultCurrency, precision: 0)
          .toDecimal();
      final expected = Decimal.fromInt(124);
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual = Money.fromDouble(123.56789, defaultCurrency, precision: 4)
          .toDecimal();
      final expected = Decimal.parse('123.5679');
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual = Money.fromDouble(-123.56789, defaultCurrency, precision: 0)
          .toDecimal();
      final expected = Decimal.fromInt(-124);
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual = Money.fromDouble(-123.56789, defaultCurrency, precision: 4)
          .toDecimal();
      final expected = Decimal.parse('-123.5679');
      expect(actual, expected);
    });
  });

  group('toDouble >', () {
    test('1.5${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1.5, defaultCurrency).toDouble();
      const expected = 1.5;
      expect(actual, expected);
    });
    test('1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1, defaultCurrency).toDouble();
      const expected = 1;
      expect(actual, expected);
    });
    test('99 cents', () {
      final actual = Money.fromDouble(0.99, defaultCurrency).toDouble();
      const expected = 0.99;
      expect(actual, expected);
    });
    test('1 cent', () {
      final actual = Money.fromDouble(0.01, defaultCurrency).toDouble();
      const expected = 0.01;
      expect(actual, expected);
    });
    test('0 cents', () {
      final actual = Money.fromDouble(0, defaultCurrency).toDouble();
      const expected = 0.0;
      expect(actual, expected);
    });
    test('-1 cent', () {
      final actual = Money.fromDouble(-0.01, defaultCurrency).toDouble();
      const expected = -0.01;
      expect(actual, expected);
    });
    test('-99 cents', () {
      final actual = Money.fromDouble(-0.99, defaultCurrency).toDouble();
      const expected = -0.99;
      expect(actual, expected);
    });
    test('-1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1, defaultCurrency).toDouble();
      const expected = -1;
      expect(actual, expected);
    });
    test('-1.5${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1.5, defaultCurrency).toDouble();
      const expected = -1.5;
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual =
          Money.fromDouble(123.56789, defaultCurrency, precision: 0).toDouble();
      const expected = 124.0;
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual =
          Money.fromDouble(123.56789, defaultCurrency, precision: 4).toDouble();
      const expected = 123.5679;
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual = Money.fromDouble(-123.56789, defaultCurrency, precision: 0)
          .toDouble();
      const expected = -124.0;
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual = Money.fromDouble(-123.56789, defaultCurrency, precision: 4)
          .toDouble();
      const expected = -123.5679;
      expect(actual, expected);
    });
  });

  group('toString >', () {
    group('MF-RF-DSF >', () {
      test('fixedDouble/none/point', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.icon,
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
        );
        final expected = '100.12345600${defaultCurrency.icon}';
        expect(actual, expected);
      });

      test('integer/none/point', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.icon,
          moneyFormat: MoneyFormat.integer,
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
          moneyFormat: MoneyFormat.integer,
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
          moneyFormat: MoneyFormat.integer,
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
          moneyFormat: MoneyFormat.integer,
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
          moneyFormat: MoneyFormat.integer,
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
          moneyFormat: MoneyFormat.integer,
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
          moneyFormat: MoneyFormat.integer,
        );
        final expected = '100${defaultCurrency.icon}';
        expect(actual, expected);
      });

      test('flexibleDouble/none/point', () {
        final actual = Money.fromDouble(1000.1, defaultCurrency).toString(
          currencyPosition: CurrencyPosition.end,
          currencyFormat: FiatCurrencyFormat.icon,
          moneyFormat: MoneyFormat.flexibleDouble,
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
          moneyFormat: MoneyFormat.flexibleDouble,
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
          moneyFormat: MoneyFormat.flexibleDouble,
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
          moneyFormat: MoneyFormat.flexibleDouble,
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
          moneyFormat: MoneyFormat.flexibleDouble,
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
          moneyFormat: MoneyFormat.flexibleDouble,
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
          moneyFormat: MoneyFormat.flexibleDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
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
          moneyFormat: MoneyFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        const expected = '1000,10';
        expect(actual, expected);
      });
    });
  });
}
