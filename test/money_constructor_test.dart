// Copyright (c) 2024, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:mdmoney/mdmoney.dart';
import 'package:test/test.dart';

import 'constants.dart';

void main() {
  group('fromCents >', () {
    test('100', () {
      final actual = Money.fromCents(100, FiatCurrency.$default).value;
      final expected = BigInt.from(100);
      expect(actual, expected);
    });
    test('1', () {
      final actual = Money.fromCents(1, FiatCurrency.$default).value;
      final expected = BigInt.one;
      expect(actual, expected);
    });
    test('0', () {
      final actual = Money.fromCents(0, FiatCurrency.$default).value;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Money.fromCents(-1, FiatCurrency.$default).value;
      final expected = -BigInt.one;
      expect(actual, expected);
    });
    test('-100', () {
      final actual = Money.fromCents(-100, FiatCurrency.$default).value;
      final expected = -BigInt.from(100);
      expect(actual, expected);
    });
    test('max finite', () {
      final actual = Money.fromCents(maxFiniteInt, FiatCurrency.$default).value;
      final expected = BigInt.from(maxFiniteInt);
      expect(actual, expected);
    });
    test('precision -1', () {
      Money actual() =>
          Money.fromCents(0, FiatCurrency.$default, precision: -1);
      final expected = throwsA(const TypeMatcher<NegativePrecisionException>());
      expect(actual, expected);
    });
    test('precision 0', () {
      final actual =
          Money.fromCents(123456789, FiatCurrency.$default, precision: 0)
              .fractional;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('precision 4', () {
      final actual =
          Money.fromCents(123456789, FiatCurrency.$default, precision: 4)
              .fractional;
      final expected = BigInt.from(6789);
      expect(actual, expected);
    });
    test('precision 12', () {
      final actual =
          Money.fromCents(123456789, FiatCurrency.$default, precision: 12)
              .fractional;
      final expected = BigInt.from(123456789);
      expect(actual, expected);
    });
  });

  group('fromBigInt >', () {
    test('1', () {
      final actual = Money.fromBigInt(BigInt.one, FiatCurrency.$default).value;
      final expected = BigInt.from(100);
      expect(actual, expected);
    });
    test('0', () {
      final actual = Money.fromBigInt(BigInt.zero, FiatCurrency.$default).value;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Money.fromBigInt(-BigInt.one, FiatCurrency.$default).value;
      final expected = -BigInt.from(100);
      expect(actual, expected);
    });
    test('precision -1', () {
      Money actual() =>
          Money.fromBigInt(BigInt.one, FiatCurrency.$default, precision: -1);
      final expected = throwsA(const TypeMatcher<NegativePrecisionException>());
      expect(actual, expected);
    });
    test('precision 0', () {
      final actual =
          Money.fromBigInt(BigInt.one, FiatCurrency.$default, precision: 0)
              .value;
      final expected = BigInt.one;
      expect(actual, expected);
    });
    test('precision 4', () {
      final actual =
          Money.fromBigInt(BigInt.one, FiatCurrency.$default, precision: 4)
              .value;
      final expected = BigInt.from(10000);
      expect(actual, expected);
    });
    test('precision 12', () {
      final actual =
          Money.fromBigInt(BigInt.one, FiatCurrency.$default, precision: 12)
              .value;
      final expected = BigInt.from(1000000000000);
      expect(actual, expected);
    });
  });

  group('fromInt >', () {
    test('1', () {
      final actual = Money.fromInt(1, FiatCurrency.$default).value;
      final expected = BigInt.from(100);
      expect(actual, expected);
    });
    test('0', () {
      final actual = Money.fromInt(0, FiatCurrency.$default).value;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Money.fromInt(-1, FiatCurrency.$default).value;
      final expected = -BigInt.from(100);
      expect(actual, expected);
    });
    test('max finite', () {
      final actual = Money.fromInt(maxFiniteInt, FiatCurrency.$default).value;
      final expected = BigInt.from(maxFiniteInt) * precisionModifier;
      expect(actual, expected);
    });
    test('precision -1', () {
      Money actual() => Money.fromInt(1, FiatCurrency.$default, precision: -1);
      final expected = throwsA(const TypeMatcher<NegativePrecisionException>());
      expect(actual, expected);
    });
    test('precision 0', () {
      final actual =
          Money.fromInt(1, FiatCurrency.$default, precision: 0).value;
      final expected = BigInt.one;
      expect(actual, expected);
    });
    test('precision 4', () {
      final actual =
          Money.fromInt(1, FiatCurrency.$default, precision: 4).value;
      final expected = BigInt.from(10000);
      expect(actual, expected);
    });
    test('precision 12', () {
      final actual =
          Money.fromInt(1, FiatCurrency.$default, precision: 12).value;
      final expected = BigInt.from(1000000000000);
      expect(actual, expected);
    });
  });

  group('fromDecimal >', () {
    test('1', () {
      final actual =
          Money.fromDecimal(Decimal.one, FiatCurrency.$default).value;
      final expected = BigInt.from(100);
      expect(actual, expected);
    });
    test('1', () {
      final actual =
          Money.fromDecimal(Decimal.parse('0.01'), FiatCurrency.$default).value;
      final expected = BigInt.one;
      expect(actual, expected);
    });
    test('65.4 flooring', () {
      final actual =
          Money.fromDecimal(Decimal.parse('0.654'), FiatCurrency.$default)
              .value;
      final expected = BigInt.from(65);
      expect(actual, expected);
    });
    test('34.5 ceiling', () {
      final actual =
          Money.fromDecimal(Decimal.parse('0.345'), FiatCurrency.$default)
              .value;
      final expected = BigInt.from(35);
      expect(actual, expected);
    });
    test('0 value', () {
      final actual =
          Money.fromDecimal(Decimal.zero, FiatCurrency.$default).value;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('-1', () {
      final actual =
          Money.fromDecimal(Decimal.parse('-0.01'), FiatCurrency.$default)
              .value;
      final expected = -BigInt.one;
      expect(actual, expected);
    });
    test('-34.5 ceiling', () {
      final actual =
          Money.fromDecimal(Decimal.parse('-0.345'), FiatCurrency.$default)
              .value;
      final expected = -BigInt.from(35);
      expect(actual, expected);
    });
    test('-65.4 flooring', () {
      final actual =
          Money.fromDecimal(Decimal.parse('-0.654'), FiatCurrency.$default)
              .value;
      final expected = -BigInt.from(65);
      expect(actual, expected);
    });
    test('-1', () {
      final actual =
          Money.fromDecimal(-Decimal.one, FiatCurrency.$default).value;
      final expected = -BigInt.from(100);
      expect(actual, expected);
    });
    test('max finite', () {
      final amount = Decimal.parse('$maxFinite');
      final actual = Money.fromDecimal(amount, FiatCurrency.$default).value;
      final expected =
          (amount * Decimal.fromBigInt(precisionModifier)).round().toBigInt();
      expect(actual, expected);
    });
    test('precision -1', () {
      Money actual() =>
          Money.fromDecimal(Decimal.zero, FiatCurrency.$default, precision: -1);
      final expected = throwsA(const TypeMatcher<NegativePrecisionException>());
      expect(actual, expected);
    });
    test('precision 0', () {
      final actual = Money.fromDecimal(
        Decimal.parse('0.123456789'),
        FiatCurrency.$default,
        precision: 0,
      ).value;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('precision 4', () {
      final actual = Money.fromDecimal(
        Decimal.parse('0.123456789'),
        FiatCurrency.$default,
        precision: 4,
      ).value;
      final expected = BigInt.from(1235);
      expect(actual, expected);
    });
    test('precision 12', () {
      final actual = Money.fromDecimal(
        Decimal.parse('0.123456789'),
        FiatCurrency.$default,
        precision: 12,
      ).value;
      final expected = BigInt.from(123456789000);
      expect(actual, expected);
    });
  });

  group('fromDouble >', () {
    test('1', () {
      final actual = Money.fromDouble(1, FiatCurrency.$default).value;
      final expected = BigInt.from(100);
      expect(actual, expected);
    });
    test('1', () {
      final actual = Money.fromDouble(0.01, FiatCurrency.$default).value;
      final expected = BigInt.one;
      expect(actual, expected);
    });
    test('65.4 flooring', () {
      final actual = Money.fromDouble(0.654, FiatCurrency.$default).value;
      final expected = BigInt.from(65);
      expect(actual, expected);
    });
    test('34.5 ceiling', () {
      final actual = Money.fromDouble(0.345, FiatCurrency.$default).value;
      final expected = BigInt.from(35);
      expect(actual, expected);
    });
    test('0 value', () {
      final actual = Money.fromDouble(0, FiatCurrency.$default).value;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Money.fromDouble(-0.01, FiatCurrency.$default).value;
      final expected = -BigInt.one;
      expect(actual, expected);
    });
    test('-34.5 ceiling', () {
      final actual = Money.fromDouble(-0.345, FiatCurrency.$default).value;
      final expected = -BigInt.from(35);
      expect(actual, expected);
    });
    test('-65.4 flooring', () {
      final actual = Money.fromDouble(-0.654, FiatCurrency.$default).value;
      final expected = -BigInt.from(65);
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Money.fromDouble(-1, FiatCurrency.$default).value;
      final expected = -BigInt.from(100);
      expect(actual, expected);
    });
    test('max finite', () {
      final actual = Money.fromDouble(maxFinite, FiatCurrency.$default).value;
      final expected = maxFiniteNumerator;
      expect(actual, expected);
    });
    test('infinite', () {
      Money actual() =>
          Money.fromDouble(double.infinity, FiatCurrency.$default);
      final expected = throwsA(const TypeMatcher<InfiniteNumberException>());
      expect(actual, expected);
    });
    test('precision -1', () {
      Money actual() =>
          Money.fromDouble(1, FiatCurrency.$default, precision: -1);
      final expected = throwsA(const TypeMatcher<NegativePrecisionException>());
      expect(actual, expected);
    });
    test('precision 0', () {
      final actual =
          Money.fromDouble(0.123456789, FiatCurrency.$default, precision: 0)
              .value;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('precision 4', () {
      final actual =
          Money.fromDouble(0.123456789, FiatCurrency.$default, precision: 4)
              .value;
      final expected = BigInt.from(1235);
      expect(actual, expected);
    });
    test('precision 12', () {
      final actual =
          Money.fromDouble(0.123456789, FiatCurrency.$default, precision: 12)
              .value;
      final expected = BigInt.from(123456789000);
      expect(actual, expected);
    });
  });

  group('fromString >', () {
    group('currency general >', () {
      group('in args (dot) >', () {
        test('100', () {
          final actual = Money.fromString('1', currency: defaultCurrency).cents;
          final expected = BigInt.from(100);
          expect(actual, expected);
        });
        test('1', () {
          final actual =
              Money.fromString('0.01', currency: defaultCurrency).cents;
          final expected = BigInt.one;
          expect(actual, expected);
        });
        test('65.4 flooring', () {
          final actual =
              Money.fromString('0.654', currency: defaultCurrency).cents;
          final expected = BigInt.from(65);
          expect(actual, expected);
        });
        test('34.5 ceiling', () {
          final actual =
              Money.fromString('0.345', currency: defaultCurrency).cents;
          final expected = BigInt.from(35);
          expect(actual, expected);
        });
        test('0', () {
          final actual = Money.fromString('0', currency: defaultCurrency).cents;
          final expected = BigInt.zero;
          expect(actual, expected);
        });
        test('-1', () {
          final actual =
              Money.fromString('-0.01', currency: defaultCurrency).cents;
          final expected = -BigInt.one;
          expect(actual, expected);
        });
        test('-34.5 ceiling', () {
          final actual =
              Money.fromString('-0.345', currency: defaultCurrency).cents;
          final expected = -BigInt.from(35);
          expect(actual, expected);
        });
        test('-65.4 flooring', () {
          final actual =
              Money.fromString('-0.654', currency: defaultCurrency).cents;
          final expected = -BigInt.from(65);
          expect(actual, expected);
        });
        test('-100', () {
          final actual =
              Money.fromString('-1', currency: defaultCurrency).cents;
          final expected = -BigInt.from(100);
          expect(actual, expected);
        });
      });

      group('in args (comma) >', () {
        test('1', () {
          final actual =
              Money.fromString('0,01', currency: defaultCurrency).cents;
          final expected = BigInt.one;
          expect(actual, expected);
        });
        test('65.4 flooring', () {
          final actual =
              Money.fromString('0,654', currency: defaultCurrency).cents;
          final expected = BigInt.from(65);
          expect(actual, expected);
        });
        test('34.5 ceiling', () {
          final actual =
              Money.fromString('0,345', currency: defaultCurrency).cents;
          final expected = BigInt.from(35);
          expect(actual, expected);
        });
        test('-1', () {
          final actual =
              Money.fromString('-0,01', currency: defaultCurrency).cents;
          final expected = -BigInt.one;
          expect(actual, expected);
        });
        test('-34.5 ceiling', () {
          final actual =
              Money.fromString('-0,345', currency: defaultCurrency).cents;
          final expected = -BigInt.from(35);
          expect(actual, expected);
        });
        test('-65.4 flooring', () {
          final actual =
              Money.fromString('-0,654', currency: defaultCurrency).cents;
          final expected = -BigInt.from(65);
          expect(actual, expected);
        });
      });

      group('cases with spaces >', () {
        group('in args (comma) >', () {
          test('positive amount', () {
            final actual =
                Money.fromString('1 000,01', currency: defaultCurrency).cents;
            final expected = BigInt.from(100001);
            expect(actual, expected);
          });
          test('negative amount', () {
            final actual =
                Money.fromString('-1 000,01', currency: defaultCurrency).cents;
            final expected = -BigInt.from(100001);
            expect(actual, expected);
          });
        });

        group('in args (dot) >', () {
          test('positive amount', () {
            final actual =
                Money.fromString('1 000.01', currency: defaultCurrency).cents;
            final expected = BigInt.from(100001);
            expect(actual, expected);
          });
          test('negative amount', () {
            final actual =
                Money.fromString('-1 000.01', currency: defaultCurrency).cents;
            final expected = -BigInt.from(100001);
            expect(actual, expected);
          });
        });
      });
    });

    group('currency icon >', () {
      group('in string (end) >', () {
        test('100', () {
          final actual = Money.fromString('1${defaultCurrency.icon}').cents;
          final expected = BigInt.from(100);
          expect(actual, expected);
        });
        test('1', () {
          final actual = Money.fromString('0.01${defaultCurrency.icon}').cents;
          final expected = BigInt.one;
          expect(actual, expected);
        });
        test('65.4 flooring', () {
          final actual = Money.fromString('0.654${defaultCurrency.icon}').cents;
          final expected = BigInt.from(65);
          expect(actual, expected);
        });
        test('34.5 ceiling', () {
          final actual = Money.fromString('0.345${defaultCurrency.icon}').cents;
          final expected = BigInt.from(35);
          expect(actual, expected);
        });
        test('0', () {
          final actual = Money.fromString('0${defaultCurrency.icon}').cents;
          final expected = BigInt.zero;
          expect(actual, expected);
        });
        test('-1', () {
          final actual = Money.fromString('-0.01${defaultCurrency.icon}').cents;
          final expected = -BigInt.one;
          expect(actual, expected);
        });
        test('-34.5 ceiling', () {
          final actual =
              Money.fromString('-0.345${defaultCurrency.icon}').cents;
          final expected = -BigInt.from(35);
          expect(actual, expected);
        });
        test('-65.4 flooring', () {
          final actual =
              Money.fromString('-0.654${defaultCurrency.icon}').cents;
          final expected = -BigInt.from(65);
          expect(actual, expected);
        });
        test('-100', () {
          final actual = Money.fromString('-1${defaultCurrency.icon}').cents;
          final expected = -BigInt.from(100);
          expect(actual, expected);
        });
      });

      group('in string (start) >', () {
        test('100', () {
          final actual = Money.fromString('${defaultCurrency.icon}1').cents;
          final expected = BigInt.from(100);
          expect(actual, expected);
        });
        test('1', () {
          final actual = Money.fromString('${defaultCurrency.icon}0.01').cents;
          final expected = BigInt.one;
          expect(actual, expected);
        });
        test('65.4 flooring', () {
          final actual = Money.fromString('${defaultCurrency.icon}0.654').cents;
          final expected = BigInt.from(65);
          expect(actual, expected);
        });
        test('34.5 ceiling', () {
          final actual = Money.fromString('${defaultCurrency.icon}0.345').cents;
          final expected = BigInt.from(35);
          expect(actual, expected);
        });
        test('0', () {
          final actual = Money.fromString('${defaultCurrency.icon}0').cents;
          final expected = BigInt.zero;
          expect(actual, expected);
        });
        test('-1', () {
          final actual = Money.fromString('${defaultCurrency.icon}-0.01').cents;
          final expected = -BigInt.one;
          expect(actual, expected);
        });
        test('-34.5 ceiling', () {
          final actual =
              Money.fromString('${defaultCurrency.icon}-0.345').cents;
          final expected = -BigInt.from(35);
          expect(actual, expected);
        });
        test('-65.4 flooring', () {
          final actual =
              Money.fromString('${defaultCurrency.icon}-0.654').cents;
          final expected = -BigInt.from(65);
          expect(actual, expected);
        });
        test('-100', () {
          final actual = Money.fromString('${defaultCurrency.icon}-1').cents;
          final expected = -BigInt.from(100);
          expect(actual, expected);
        });
      });

      group('in string (decimal separator) >', () {
        test('1', () {
          final actual = Money.fromString('0${defaultCurrency.icon}01').cents;
          final expected = BigInt.one;
          expect(actual, expected);
        });
        test('65.4 flooring', () {
          final actual = Money.fromString('0${defaultCurrency.icon}654').cents;
          final expected = BigInt.from(65);
          expect(actual, expected);
        });
        test('34.5 ceiling', () {
          final actual = Money.fromString('0${defaultCurrency.icon}345').cents;
          final expected = BigInt.from(35);
          expect(actual, expected);
        });
        test('-1', () {
          final actual = Money.fromString('-0${defaultCurrency.icon}01').cents;
          final expected = -BigInt.one;
          expect(actual, expected);
        });
        test('-34.5 ceiling', () {
          final actual = Money.fromString('-0${defaultCurrency.icon}345').cents;
          final expected = -BigInt.from(35);
          expect(actual, expected);
        });
        test('-65.4 flooring', () {
          final actual = Money.fromString('-0${defaultCurrency.icon}654').cents;
          final expected = -BigInt.from(65);
          expect(actual, expected);
        });
      });

      group('cases with spaces >', () {
        group('in string (end) >', () {
          test('positive amount', () {
            final actual =
                Money.fromString('1 000.01 ${defaultCurrency.icon}').cents;
            final expected = BigInt.from(100001);
            expect(actual, expected);
          });
          test('negative amount', () {
            final actual =
                Money.fromString('-1 000.01 ${defaultCurrency.icon}').cents;
            final expected = -BigInt.from(100001);
            expect(actual, expected);
          });
        });

        group('in string (start) >', () {
          test('positive amount', () {
            final actual =
                Money.fromString('${defaultCurrency.icon} 1 000.01').cents;
            final expected = BigInt.from(100001);
            expect(actual, expected);
          });
          test('negative amount', () {
            final actual =
                Money.fromString('${defaultCurrency.icon} -1 000.01').cents;
            final expected = -BigInt.from(100001);
            expect(actual, expected);
          });
        });

        group('in string (end/without ranks) >', () {
          test('positive amount', () {
            final actual =
                Money.fromString('1000.01 ${defaultCurrency.icon}').cents;
            final expected = BigInt.from(100001);
            expect(actual, expected);
          });
          test('negative amount', () {
            final actual =
                Money.fromString('-1000.01 ${defaultCurrency.icon}').cents;
            final expected = -BigInt.from(100001);
            expect(actual, expected);
          });
        });

        group('in string (start/without ranks) >', () {
          test('positive amount', () {
            final actual =
                Money.fromString('${defaultCurrency.icon} 1000.01').cents;
            final expected = BigInt.from(100001);
            expect(actual, expected);
          });
          test('negative amount', () {
            final actual =
                Money.fromString('${defaultCurrency.icon} -1000.01').cents;
            final expected = -BigInt.from(100001);
            expect(actual, expected);
          });
        });

        group('in string (end/without currency spacing) >', () {
          test('positive amount', () {
            final actual =
                Money.fromString('1 000.01${defaultCurrency.icon}').cents;
            final expected = BigInt.from(100001);
            expect(actual, expected);
          });
          test('negative amount', () {
            final actual =
                Money.fromString('-1 000.01${defaultCurrency.icon}').cents;
            final expected = -BigInt.from(100001);
            expect(actual, expected);
          });
        });

        group('in string (start/without currency spacing) >', () {
          test('positive amount', () {
            final actual =
                Money.fromString('${defaultCurrency.icon}1 000.01').cents;
            final expected = BigInt.from(100001);
            expect(actual, expected);
          });
          test('negative amount', () {
            final actual =
                Money.fromString('${defaultCurrency.icon}-1 000.01').cents;
            final expected = -BigInt.from(100001);
            expect(actual, expected);
          });
        });

        group('in string (decimal separator) >', () {
          test('positive amount', () {
            final actual =
                Money.fromString('1 000${defaultCurrency.icon}01').cents;
            final expected = BigInt.from(100001);
            expect(actual, expected);
          });
          test('negative amount', () {
            final actual =
                Money.fromString('-1 000${defaultCurrency.icon}01').cents;
            final expected = -BigInt.from(100001);
            expect(actual, expected);
          });
        });
      });
    });

    group('currency code >', () {
      group('in string (end) >', () {
        test('1${defaultCurrency.code}', () {
          final actual = Money.fromString('1${defaultCurrency.code}').cents;
          final expected = BigInt.from(100);
          expect(actual, expected);
        });
        test('1', () {
          final actual = Money.fromString('0.01${defaultCurrency.code}').cents;
          final expected = BigInt.one;
          expect(actual, expected);
        });
        test('65.4 flooring', () {
          final actual = Money.fromString('0.654${defaultCurrency.code}').cents;
          final expected = BigInt.from(65);
          expect(actual, expected);
        });
        test('34.5 ceiling', () {
          final actual = Money.fromString('0.345${defaultCurrency.code}').cents;
          final expected = BigInt.from(35);
          expect(actual, expected);
        });
        test('0', () {
          final actual = Money.fromString('0${defaultCurrency.code}').cents;
          final expected = BigInt.zero;
          expect(actual, expected);
        });
        test('-1', () {
          final actual = Money.fromString('-0.01${defaultCurrency.code}').cents;
          final expected = -BigInt.one;
          expect(actual, expected);
        });
        test('-34.5 ceiling', () {
          final actual =
              Money.fromString('-0.345${defaultCurrency.code}').cents;
          final expected = -BigInt.from(35);
          expect(actual, expected);
        });
        test('-65.4 flooring', () {
          final actual =
              Money.fromString('-0.654${defaultCurrency.code}').cents;
          final expected = -BigInt.from(65);
          expect(actual, expected);
        });
        test('-1${defaultCurrency.code}', () {
          final actual = Money.fromString('-1${defaultCurrency.code}').cents;
          final expected = -BigInt.from(100);
          expect(actual, expected);
        });
      });

      group('in string (start) >', () {
        test('1${defaultCurrency.code}', () {
          final actual = Money.fromString('${defaultCurrency.code}1').cents;
          final expected = BigInt.from(100);
          expect(actual, expected);
        });
        test('1', () {
          final actual = Money.fromString('${defaultCurrency.code}0.01').cents;
          final expected = BigInt.one;
          expect(actual, expected);
        });
        test('65.4 flooring', () {
          final actual = Money.fromString('${defaultCurrency.code}0.654').cents;
          final expected = BigInt.from(65);
          expect(actual, expected);
        });
        test('34.5 ceiling', () {
          final actual = Money.fromString('${defaultCurrency.code}0.345').cents;
          final expected = BigInt.from(35);
          expect(actual, expected);
        });
        test('0', () {
          final actual = Money.fromString('${defaultCurrency.code}0').cents;
          final expected = BigInt.zero;
          expect(actual, expected);
        });
        test('-1', () {
          final actual = Money.fromString('${defaultCurrency.code}-0.01').cents;
          final expected = -BigInt.one;
          expect(actual, expected);
        });
        test('-34.5 ceiling', () {
          final actual =
              Money.fromString('${defaultCurrency.code}-0.345').cents;
          final expected = -BigInt.from(35);
          expect(actual, expected);
        });
        test('-65.4 flooring', () {
          final actual =
              Money.fromString('${defaultCurrency.code}-0.654').cents;
          final expected = -BigInt.from(65);
          expect(actual, expected);
        });
        test('-1${defaultCurrency.code}', () {
          final actual = Money.fromString('${defaultCurrency.code}-1').cents;
          final expected = -BigInt.from(100);
          expect(actual, expected);
        });
      });

      group('in string (decimal separator) >', () {
        test('1', () {
          final actual = Money.fromString('0${defaultCurrency.code}01').cents;
          final expected = BigInt.one;
          expect(actual, expected);
        });
        test('65.4 flooring', () {
          final actual = Money.fromString('0${defaultCurrency.code}654').cents;
          final expected = BigInt.from(65);
          expect(actual, expected);
        });
        test('34.5 ceiling', () {
          final actual = Money.fromString('0${defaultCurrency.code}345').cents;
          final expected = BigInt.from(35);
          expect(actual, expected);
        });
        test('-1', () {
          final actual = Money.fromString('-0${defaultCurrency.code}01').cents;
          final expected = -BigInt.one;
          expect(actual, expected);
        });
        test('-34.5 ceiling', () {
          final actual = Money.fromString('-0${defaultCurrency.code}345').cents;
          final expected = -BigInt.from(35);
          expect(actual, expected);
        });
        test('-65.4 flooring', () {
          final actual = Money.fromString('-0${defaultCurrency.code}654').cents;
          final expected = -BigInt.from(65);
          expect(actual, expected);
        });
      });

      group('cases with spaces >', () {
        group('in string (end) >', () {
          test('positive amount', () {
            final actual =
                Money.fromString('1 000.01 ${defaultCurrency.code}').cents;
            final expected = BigInt.from(100001);
            expect(actual, expected);
          });
          test('negative amount', () {
            final actual =
                Money.fromString('-1 000.01 ${defaultCurrency.code}').cents;
            final expected = -BigInt.from(100001);
            expect(actual, expected);
          });
        });

        group('in string (start) >', () {
          test('positive amount', () {
            final actual =
                Money.fromString('${defaultCurrency.code} 1 000.01').cents;
            final expected = BigInt.from(100001);
            expect(actual, expected);
          });
          test('negative amount', () {
            final actual =
                Money.fromString('${defaultCurrency.code} -1 000.01').cents;
            final expected = -BigInt.from(100001);
            expect(actual, expected);
          });
        });

        group('in string (end/without ranks) >', () {
          test('positive amount', () {
            final actual =
                Money.fromString('1000.01 ${defaultCurrency.code}').cents;
            final expected = BigInt.from(100001);
            expect(actual, expected);
          });
          test('negative amount', () {
            final actual =
                Money.fromString('-1000.01 ${defaultCurrency.code}').cents;
            final expected = -BigInt.from(100001);
            expect(actual, expected);
          });
        });

        group('in string (start/without ranks) >', () {
          test('positive amount', () {
            final actual =
                Money.fromString('${defaultCurrency.code} 1000.01').cents;
            final expected = BigInt.from(100001);
            expect(actual, expected);
          });
          test('negative amount', () {
            final actual =
                Money.fromString('${defaultCurrency.code} -1000.01').cents;
            final expected = -BigInt.from(100001);
            expect(actual, expected);
          });
        });

        group('in string (end/without currency spacing) >', () {
          test('positive amount', () {
            final actual =
                Money.fromString('1 000.01${defaultCurrency.code}').cents;
            final expected = BigInt.from(100001);
            expect(actual, expected);
          });
          test('negative amount', () {
            final actual =
                Money.fromString('-1 000.01${defaultCurrency.code}').cents;
            final expected = -BigInt.from(100001);
            expect(actual, expected);
          });
        });

        group('in string (start/without currency spacing) >', () {
          test('positive amount', () {
            final actual =
                Money.fromString('${defaultCurrency.code}1 000.01').cents;
            final expected = BigInt.from(100001);
            expect(actual, expected);
          });
          test('negative amount', () {
            final actual =
                Money.fromString('${defaultCurrency.code}-1 000.01').cents;
            final expected = -BigInt.from(100001);
            expect(actual, expected);
          });
        });

        group('in string (decimal separator) >', () {
          test('positive amount', () {
            final actual =
                Money.fromString('1 000${defaultCurrency.code}01').cents;
            final expected = BigInt.from(100001);
            expect(actual, expected);
          });
          test('negative amount', () {
            final actual =
                Money.fromString('-1 000${defaultCurrency.code}01').cents;
            final expected = -BigInt.from(100001);
            expect(actual, expected);
          });
        });
      });
    });

    group('misc >', () {
      test('empty string with currency in args', () {
        final actual = Money.fromString('', currency: defaultCurrency);
        final expected = Money.zeroOf(defaultCurrency);
        expect(actual, expected);
      });
      test('empty string with currency in string', () {
        final actual = Money.fromString(defaultCurrency.icon);
        final expected = Money.zeroOf(defaultCurrency);
        expect(actual, expected);
      });
      test('empty string without currency', () {
        Money actual() => Money.fromString('');
        final expected = throwsA(const TypeMatcher<NoCurrencyException>());
        expect(actual, expected);
      });
      test('no currency', () {
        Money actual() => Money.fromString('1');
        final expected = throwsA(const TypeMatcher<NoCurrencyException>());
        expect(actual, expected);
      });
      test('string without fractions but with decimal separator', () {
        final actual = Money.fromString('123.', currency: defaultCurrency);
        final expected = Money.fromString('123', currency: defaultCurrency);
        expect(actual, expected);
      });
      test('max finite', () {
        final actual =
            Money.fromString('$maxFinite', currency: defaultCurrency).cents;
        final expected = (Decimal.parse('$maxFinite') * Decimal.fromInt(100))
            .round()
            .toBigInt();
        expect(actual, expected);
      });
      test('precision -1', () {
        Money actual() =>
            Money.fromString('1', currency: defaultCurrency, precision: -1);
        final expected =
            throwsA(const TypeMatcher<NegativePrecisionException>());
        expect(actual, expected);
      });
      test('precision 0', () {
        final actual = Money.fromString(
          '0.123456789',
          currency: defaultCurrency,
          precision: 0,
        ).cents.toInt();
        const expected = 0;
        expect(actual, expected);
      });
      test('precision 4', () {
        final actual = Money.fromString(
          '0.123456789',
          currency: defaultCurrency,
          precision: 4,
        ).cents.toInt();
        const expected = 1235;
        expect(actual, expected);
      });
      test('precision 12', () {
        final actual = Money.fromString(
          '0.123456789',
          currency: defaultCurrency,
          precision: 12,
        ).cents.toInt();
        const expected = 123456789000;
        expect(actual, expected);
      });
    });
  });

  group('fromAmount >', () {
    test('1', () {
      final actual =
          Money.fromAmount(Amount.oneInt, FiatCurrency.$default).value;
      final expected = BigInt.from(100);
      expect(actual, expected);
    });
    test('1', () {
      final actual = Money.fromAmount(Amount.one, FiatCurrency.$default).value;
      final expected = BigInt.one;
      expect(actual, expected);
    });
    test('65.4 flooring', () {
      final actual =
          Money.fromAmount(Amount.fromDouble(0.654), FiatCurrency.$default)
              .value;
      final expected = BigInt.from(65);
      expect(actual, expected);
    });
    test('34.5 ceiling', () {
      final actual =
          Money.fromAmount(Amount.fromDouble(0.345), FiatCurrency.$default)
              .value;
      final expected = BigInt.from(35);
      expect(actual, expected);
    });
    test('0 value', () {
      final actual = Money.fromAmount(Amount.zero, FiatCurrency.$default).value;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Money.fromAmount(-Amount.one, FiatCurrency.$default).value;
      final expected = -BigInt.one;
      expect(actual, expected);
    });
    test('-34.5 ceiling', () {
      final actual =
          Money.fromAmount(Amount.fromDouble(-0.345), FiatCurrency.$default)
              .value;
      final expected = -BigInt.from(35);
      expect(actual, expected);
    });
    test('-65.4 flooring', () {
      final actual =
          Money.fromAmount(Amount.fromDouble(-0.654), FiatCurrency.$default)
              .value;
      final expected = -BigInt.from(65);
      expect(actual, expected);
    });
    test('-1', () {
      final actual =
          Money.fromAmount(-Amount.oneInt, FiatCurrency.$default).value;
      final expected = -BigInt.from(100);
      expect(actual, expected);
    });
    test('max finite', () {
      final actual =
          Money.fromAmount(Amount.fromDouble(maxFinite), FiatCurrency.$default)
              .value;
      final expected = maxFiniteNumerator;
      expect(actual, expected);
    });
    test('precision -1', () {
      Money actual() =>
          Money.fromAmount(Amount.oneInt, FiatCurrency.$default, precision: -1);
      final expected = throwsA(const TypeMatcher<NegativePrecisionException>());
      expect(actual, expected);
    });
    test('precision 0 from amount', () {
      final actual = Money.fromAmount(
        Amount.fromDouble(0.123456789, precision: 0),
        FiatCurrency.$default,
      ).value;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('precision 4 from amount', () {
      final actual = Money.fromAmount(
        Amount.fromDouble(0.123456789, precision: 4),
        FiatCurrency.$default,
      ).value;
      final expected = BigInt.from(1235);
      expect(actual, expected);
    });
    test('precision 12 from amount', () {
      final actual = Money.fromAmount(
        Amount.fromDouble(0.123456789, precision: 12),
        FiatCurrency.$default,
      ).value;
      final expected = BigInt.from(123456789000);
      expect(actual, expected);
    });
    test('precision 6 (0 from amount)', () {
      final actual = Money.fromAmount(
        Amount.fromDouble(0.123456789, precision: 0),
        FiatCurrency.$default,
        precision: 6,
      ).value;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('precision 6 (4 from amount)', () {
      final actual = Money.fromAmount(
        Amount.fromDouble(0.123456789, precision: 4),
        FiatCurrency.$default,
        precision: 6,
      ).value;
      final expected = BigInt.from(123500);
      expect(actual, expected);
    });
    test('precision 6 (12 from amount)', () {
      final actual = Money.fromAmount(
        Amount.fromDouble(0.123456789, precision: 12),
        FiatCurrency.$default,
        precision: 6,
      ).value;
      final expected = BigInt.from(123457);
      expect(actual, expected);
    });
    test('precision from currency (0 from amount)', () {
      final actual = Money.fromAmount(
        Amount.fromDouble(0.123456789, precision: 0),
        FiatCurrency.$default,
        preferCurrencyPrecision: true,
      ).value;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('precision from currency (4 from amount)', () {
      final actual = Money.fromAmount(
        Amount.fromDouble(0.123456789, precision: 4),
        FiatCurrency.$default,
        preferCurrencyPrecision: true,
      ).value;
      final expected = BigInt.from(12);
      expect(actual, expected);
    });
    test('precision from currency (12 from amount)', () {
      final actual = Money.fromAmount(
        Amount.fromDouble(0.123456789, precision: 12),
        FiatCurrency.$default,
        preferCurrencyPrecision: true,
      ).value;
      final expected = BigInt.from(12);
      expect(actual, expected);
    });
  });

  group('static >', () {
    test('zero', () {
      final actual = Money.zero;
      final expected = Money.fromInt(0, FiatCurrency.$default);
      expect(actual, expected);
    });
    test('zeroOf', () {
      final actual = Money.zeroOf(FiatCurrency.$default, precision: 4);
      final expected = Money.fromInt(0, FiatCurrency.$default, precision: 4);
      expect(actual, expected);
    });
    test('one', () {
      final actual = Money.one;
      final expected = Money.fromDouble(0.01, FiatCurrency.$default);
      expect(actual, expected);
    });
    test('oneOf', () {
      final actual = Money.oneOf(FiatCurrency.$default, precision: 4);
      final expected =
          Money.fromDouble(0.0001, FiatCurrency.$default, precision: 4);
      expect(actual, expected);
    });
    test('oneInt', () {
      final actual = Money.oneInt;
      final expected = Money.fromInt(1, FiatCurrency.$default);
      expect(actual, expected);
    });
    test('oneIntOf', () {
      final actual = Money.oneIntOf(FiatCurrency.$default, precision: 4);
      final expected = Money.fromInt(1, FiatCurrency.$default, precision: 4);
      expect(actual, expected);
    });
  });
}
