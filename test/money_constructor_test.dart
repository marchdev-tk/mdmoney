// ignore_for_file: avoid_redundant_argument_values

import 'package:mdmoney/mdmoney.dart';
import 'package:test/test.dart';

import 'constants.dart';

void main() {
  group('fromCents >', () {
    test('1${defaultCurrency.icon}', () {
      final actual = Money.fromCents(100, defaultCurrency).cents;
      final expected = BigInt.from(100);
      expect(actual, expected);
    });
    test('1 cent', () {
      final actual = Money.fromCents(1, defaultCurrency).cents;
      final expected = BigInt.one;
      expect(actual, expected);
    });
    test('0 cents', () {
      final actual = Money.fromCents(0, defaultCurrency).cents;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('-1 cent', () {
      final actual = Money.fromCents(-1, defaultCurrency).cents;
      final expected = -BigInt.one;
      expect(actual, expected);
    });
    test('-1${defaultCurrency.icon}', () {
      final actual = Money.fromCents(-100, defaultCurrency).cents;
      final expected = -BigInt.from(100);
      expect(actual, expected);
    });
    test('precision -1', () {
      Money actual() => Money.fromCents(0, defaultCurrency, precision: -1);
      final expected = throwsA(const TypeMatcher<NegativePrecisionException>());
      expect(actual, expected);
    });
    test('precision 0', () {
      final actual = Money.fromCents(
        123456789,
        defaultCurrency,
        precision: 0,
      ).fractional.toInt();
      const expected = 0;
      expect(actual, expected);
    });
    test('precision 4', () {
      final actual = Money.fromCents(
        123456789,
        defaultCurrency,
        precision: 4,
      ).fractional.toInt();
      const expected = 6789;
      expect(actual, expected);
    });
    test('precision 12', () {
      final actual = Money.fromCents(
        123456789,
        defaultCurrency,
        precision: 12,
      ).fractional.toInt();
      const expected = 123456789;
      expect(actual, expected);
    });
  });

  group('fromDecimal >', () {
    test('1${defaultCurrency.icon}', () {
      final actual = Money.fromDecimal(Decimal.one, defaultCurrency).cents;
      final expected = BigInt.from(100);
      expect(actual, expected);
    });
    test('1 cent', () {
      final actual =
          Money.fromDecimal(Decimal.parse('0.01'), defaultCurrency).cents;
      final expected = BigInt.one;
      expect(actual, expected);
    });
    test('65.4 cents flooring', () {
      final actual =
          Money.fromDecimal(Decimal.parse('0.654'), defaultCurrency).cents;
      final expected = BigInt.from(65);
      expect(actual, expected);
    });
    test('34.5 cents ceiling', () {
      final actual =
          Money.fromDecimal(Decimal.parse('0.345'), defaultCurrency).cents;
      final expected = BigInt.from(35);
      expect(actual, expected);
    });
    test('0 cents', () {
      final actual = Money.fromDecimal(Decimal.zero, defaultCurrency).cents;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('-1 cent', () {
      final actual =
          Money.fromDecimal(Decimal.parse('-0.01'), defaultCurrency).cents;
      final expected = -BigInt.one;
      expect(actual, expected);
    });
    test('-34.5 cents ceiling', () {
      final actual =
          Money.fromDecimal(Decimal.parse('-0.345'), defaultCurrency).cents;
      final expected = -BigInt.from(35);
      expect(actual, expected);
    });
    test('-65.4 cents flooring', () {
      final actual =
          Money.fromDecimal(Decimal.parse('-0.654'), defaultCurrency).cents;
      final expected = -BigInt.from(65);
      expect(actual, expected);
    });
    test('-1${defaultCurrency.icon}', () {
      final actual = Money.fromDecimal(-Decimal.one, defaultCurrency).cents;
      final expected = -BigInt.from(100);
      expect(actual, expected);
    });
    test('Max finite', () {
      final amount = Decimal.parse('$maxFinite');
      final actual = Money.fromDecimal(amount, defaultCurrency).cents;
      final expected = (amount * Decimal.fromInt(100)).round().toBigInt();
      expect(actual, expected);
    });
    test('precision -1', () {
      Money actual() =>
          Money.fromDecimal(Decimal.zero, defaultCurrency, precision: -1);
      final expected = throwsA(const TypeMatcher<NegativePrecisionException>());
      expect(actual, expected);
    });
    test('precision 0', () {
      final actual = Money.fromDecimal(
        Decimal.parse('0.123456789'),
        defaultCurrency,
        precision: 0,
      ).cents.toInt();
      const expected = 0;
      expect(actual, expected);
    });
    test('precision 4', () {
      final actual = Money.fromDecimal(
        Decimal.parse('0.123456789'),
        defaultCurrency,
        precision: 4,
      ).cents.toInt();
      const expected = 1235;
      expect(actual, expected);
    });
    test('precision 12', () {
      final actual = Money.fromDecimal(
        Decimal.parse('0.123456789'),
        defaultCurrency,
        precision: 12,
      ).cents.toInt();
      const expected = 123456789000;
      expect(actual, expected);
    });
  });

  group('fromDouble >', () {
    test('1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(1, defaultCurrency).cents;
      final expected = BigInt.from(100);
      expect(actual, expected);
    });
    test('1 cent', () {
      final actual = Money.fromDouble(0.01, defaultCurrency).cents;
      final expected = BigInt.one;
      expect(actual, expected);
    });
    test('65.4 cents flooring', () {
      final actual = Money.fromDouble(0.654, defaultCurrency).cents;
      final expected = BigInt.from(65);
      expect(actual, expected);
    });
    test('34.5 cents ceiling', () {
      final actual = Money.fromDouble(0.345, defaultCurrency).cents;
      final expected = BigInt.from(35);
      expect(actual, expected);
    });
    test('0 cents', () {
      final actual = Money.fromDouble(0, defaultCurrency).cents;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('-1 cent', () {
      final actual = Money.fromDouble(-0.01, defaultCurrency).cents;
      final expected = -BigInt.one;
      expect(actual, expected);
    });
    test('-34.5 cents ceiling', () {
      final actual = Money.fromDouble(-0.345, defaultCurrency).cents;
      final expected = -BigInt.from(35);
      expect(actual, expected);
    });
    test('-65.4 cents flooring', () {
      final actual = Money.fromDouble(-0.654, defaultCurrency).cents;
      final expected = -BigInt.from(65);
      expect(actual, expected);
    });
    test('-1${defaultCurrency.icon}', () {
      final actual = Money.fromDouble(-1, defaultCurrency).cents;
      final expected = -BigInt.from(100);
      expect(actual, expected);
    });
    test('Max finite', () {
      final actual = Money.fromDouble(maxFinite, defaultCurrency).cents;
      final expected = BigInt.from(maxFiniteCents);
      expect(actual, expected);
    });
    test('Infinite', () {
      Money actual() => Money.fromDouble(maxFinite * 10, defaultCurrency);
      final expected = throwsA(const TypeMatcher<InfiniteNumberException>());
      expect(actual, expected);
    });
    test('precision -1', () {
      Money actual() => Money.fromDouble(1, defaultCurrency, precision: -1);
      final expected = throwsA(const TypeMatcher<NegativePrecisionException>());
      expect(actual, expected);
    });
    test('precision 0', () {
      final actual = Money.fromDouble(
        0.123456789,
        defaultCurrency,
        precision: 0,
      ).cents.toInt();
      const expected = 0;
      expect(actual, expected);
    });
    test('precision 4', () {
      final actual = Money.fromDouble(
        0.123456789,
        defaultCurrency,
        precision: 4,
      ).cents.toInt();
      const expected = 1235;
      expect(actual, expected);
    });
    test('precision 12', () {
      final actual = Money.fromDouble(
        0.123456789,
        defaultCurrency,
        precision: 12,
      ).cents.toInt();
      const expected = 123456789000;
      expect(actual, expected);
    });
  });

  group('fromString >', () {
    group('Currency General >', () {
      group('In args >', () {
        test('1${defaultCurrency.icon}', () {
          final actual = Money.fromString('1', currency: defaultCurrency).cents;
          final expected = BigInt.from(100);
          expect(actual, expected);
        });
        test('1 cent', () {
          final actual =
              Money.fromString('0.01', currency: defaultCurrency).cents;
          final expected = BigInt.one;
          expect(actual, expected);
        });
        test('65.4 cents flooring', () {
          final actual =
              Money.fromString('0.654', currency: defaultCurrency).cents;
          final expected = BigInt.from(65);
          expect(actual, expected);
        });
        test('34.5 cents ceiling', () {
          final actual =
              Money.fromString('0.345', currency: defaultCurrency).cents;
          final expected = BigInt.from(35);
          expect(actual, expected);
        });
        test('0 cents', () {
          final actual = Money.fromString('0', currency: defaultCurrency).cents;
          final expected = BigInt.zero;
          expect(actual, expected);
        });
        test('-1 cent', () {
          final actual =
              Money.fromString('-0.01', currency: defaultCurrency).cents;
          final expected = -BigInt.one;
          expect(actual, expected);
        });
        test('-34.5 cents ceiling', () {
          final actual =
              Money.fromString('-0.345', currency: defaultCurrency).cents;
          final expected = -BigInt.from(35);
          expect(actual, expected);
        });
        test('-65.4 cents flooring', () {
          final actual =
              Money.fromString('-0.654', currency: defaultCurrency).cents;
          final expected = -BigInt.from(65);
          expect(actual, expected);
        });
        test('-1${defaultCurrency.icon}', () {
          final actual =
              Money.fromString('-1', currency: defaultCurrency).cents;
          final expected = -BigInt.from(100);
          expect(actual, expected);
        });
      });

      group('In args (comma) >', () {
        test('1 cent', () {
          final actual =
              Money.fromString('0,01', currency: defaultCurrency).cents;
          final expected = BigInt.one;
          expect(actual, expected);
        });
        test('65.4 cents flooring', () {
          final actual =
              Money.fromString('0,654', currency: defaultCurrency).cents;
          final expected = BigInt.from(65);
          expect(actual, expected);
        });
        test('34.5 cents ceiling', () {
          final actual =
              Money.fromString('0,345', currency: defaultCurrency).cents;
          final expected = BigInt.from(35);
          expect(actual, expected);
        });
        test('-1 cent', () {
          final actual =
              Money.fromString('-0,01', currency: defaultCurrency).cents;
          final expected = -BigInt.one;
          expect(actual, expected);
        });
        test('-34.5 cents ceiling', () {
          final actual =
              Money.fromString('-0,345', currency: defaultCurrency).cents;
          final expected = -BigInt.from(35);
          expect(actual, expected);
        });
        test('-65.4 cents flooring', () {
          final actual =
              Money.fromString('-0,654', currency: defaultCurrency).cents;
          final expected = -BigInt.from(65);
          expect(actual, expected);
        });
      });

      group('Cases with spaces >', () {
        group('In args (comma) >', () {
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

        group('In args (dot) >', () {
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

    group('Currency Icon >', () {
      group('In string (end) >', () {
        test('1${defaultCurrency.icon}', () {
          final actual = Money.fromString('1${defaultCurrency.icon}').cents;
          final expected = BigInt.from(100);
          expect(actual, expected);
        });
        test('1 cent', () {
          final actual = Money.fromString('0.01${defaultCurrency.icon}').cents;
          final expected = BigInt.one;
          expect(actual, expected);
        });
        test('65.4 cents flooring', () {
          final actual = Money.fromString('0.654${defaultCurrency.icon}').cents;
          final expected = BigInt.from(65);
          expect(actual, expected);
        });
        test('34.5 cents ceiling', () {
          final actual = Money.fromString('0.345${defaultCurrency.icon}').cents;
          final expected = BigInt.from(35);
          expect(actual, expected);
        });
        test('0 cents', () {
          final actual = Money.fromString('0${defaultCurrency.icon}').cents;
          final expected = BigInt.zero;
          expect(actual, expected);
        });
        test('-1 cent', () {
          final actual = Money.fromString('-0.01${defaultCurrency.icon}').cents;
          final expected = -BigInt.one;
          expect(actual, expected);
        });
        test('-34.5 cents ceiling', () {
          final actual =
              Money.fromString('-0.345${defaultCurrency.icon}').cents;
          final expected = -BigInt.from(35);
          expect(actual, expected);
        });
        test('-65.4 cents flooring', () {
          final actual =
              Money.fromString('-0.654${defaultCurrency.icon}').cents;
          final expected = -BigInt.from(65);
          expect(actual, expected);
        });
        test('-1${defaultCurrency.icon}', () {
          final actual = Money.fromString('-1${defaultCurrency.icon}').cents;
          final expected = -BigInt.from(100);
          expect(actual, expected);
        });
      });

      group('In string (start) >', () {
        test('1${defaultCurrency.icon}', () {
          final actual = Money.fromString('${defaultCurrency.icon}1').cents;
          final expected = BigInt.from(100);
          expect(actual, expected);
        });
        test('1 cent', () {
          final actual = Money.fromString('${defaultCurrency.icon}0.01').cents;
          final expected = BigInt.one;
          expect(actual, expected);
        });
        test('65.4 cents flooring', () {
          final actual = Money.fromString('${defaultCurrency.icon}0.654').cents;
          final expected = BigInt.from(65);
          expect(actual, expected);
        });
        test('34.5 cents ceiling', () {
          final actual = Money.fromString('${defaultCurrency.icon}0.345').cents;
          final expected = BigInt.from(35);
          expect(actual, expected);
        });
        test('0 cents', () {
          final actual = Money.fromString('${defaultCurrency.icon}0').cents;
          final expected = BigInt.zero;
          expect(actual, expected);
        });
        test('-1 cent', () {
          final actual = Money.fromString('${defaultCurrency.icon}-0.01').cents;
          final expected = -BigInt.one;
          expect(actual, expected);
        });
        test('-34.5 cents ceiling', () {
          final actual =
              Money.fromString('${defaultCurrency.icon}-0.345').cents;
          final expected = -BigInt.from(35);
          expect(actual, expected);
        });
        test('-65.4 cents flooring', () {
          final actual =
              Money.fromString('${defaultCurrency.icon}-0.654').cents;
          final expected = -BigInt.from(65);
          expect(actual, expected);
        });
        test('-1${defaultCurrency.icon}', () {
          final actual = Money.fromString('${defaultCurrency.icon}-1').cents;
          final expected = -BigInt.from(100);
          expect(actual, expected);
        });
      });

      group('In string (decimal separator) >', () {
        test('1 cent', () {
          final actual = Money.fromString('0${defaultCurrency.icon}01').cents;
          final expected = BigInt.one;
          expect(actual, expected);
        });
        test('65.4 cents flooring', () {
          final actual = Money.fromString('0${defaultCurrency.icon}654').cents;
          final expected = BigInt.from(65);
          expect(actual, expected);
        });
        test('34.5 cents ceiling', () {
          final actual = Money.fromString('0${defaultCurrency.icon}345').cents;
          final expected = BigInt.from(35);
          expect(actual, expected);
        });
        test('-1 cent', () {
          final actual = Money.fromString('-0${defaultCurrency.icon}01').cents;
          final expected = -BigInt.one;
          expect(actual, expected);
        });
        test('-34.5 cents ceiling', () {
          final actual = Money.fromString('-0${defaultCurrency.icon}345').cents;
          final expected = -BigInt.from(35);
          expect(actual, expected);
        });
        test('-65.4 cents flooring', () {
          final actual = Money.fromString('-0${defaultCurrency.icon}654').cents;
          final expected = -BigInt.from(65);
          expect(actual, expected);
        });
      });

      group('Cases with spaces >', () {
        group('In string (end) >', () {
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

        group('In string (start) >', () {
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

        group('In string (end/without ranks) >', () {
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

        group('In string (start/without ranks) >', () {
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

        group('In string (end/without currency spacing) >', () {
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

        group('In string (start/without currency spacing) >', () {
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

        group('In string (decimal separator) >', () {
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

    group('Currency Code >', () {
      group('In string (end) >', () {
        test('1${defaultCurrency.code}', () {
          final actual = Money.fromString('1${defaultCurrency.code}').cents;
          final expected = BigInt.from(100);
          expect(actual, expected);
        });
        test('1 cent', () {
          final actual = Money.fromString('0.01${defaultCurrency.code}').cents;
          final expected = BigInt.one;
          expect(actual, expected);
        });
        test('65.4 cents flooring', () {
          final actual = Money.fromString('0.654${defaultCurrency.code}').cents;
          final expected = BigInt.from(65);
          expect(actual, expected);
        });
        test('34.5 cents ceiling', () {
          final actual = Money.fromString('0.345${defaultCurrency.code}').cents;
          final expected = BigInt.from(35);
          expect(actual, expected);
        });
        test('0 cents', () {
          final actual = Money.fromString('0${defaultCurrency.code}').cents;
          final expected = BigInt.zero;
          expect(actual, expected);
        });
        test('-1 cent', () {
          final actual = Money.fromString('-0.01${defaultCurrency.code}').cents;
          final expected = -BigInt.one;
          expect(actual, expected);
        });
        test('-34.5 cents ceiling', () {
          final actual =
              Money.fromString('-0.345${defaultCurrency.code}').cents;
          final expected = -BigInt.from(35);
          expect(actual, expected);
        });
        test('-65.4 cents flooring', () {
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

      group('In string (start) >', () {
        test('1${defaultCurrency.code}', () {
          final actual = Money.fromString('${defaultCurrency.code}1').cents;
          final expected = BigInt.from(100);
          expect(actual, expected);
        });
        test('1 cent', () {
          final actual = Money.fromString('${defaultCurrency.code}0.01').cents;
          final expected = BigInt.one;
          expect(actual, expected);
        });
        test('65.4 cents flooring', () {
          final actual = Money.fromString('${defaultCurrency.code}0.654').cents;
          final expected = BigInt.from(65);
          expect(actual, expected);
        });
        test('34.5 cents ceiling', () {
          final actual = Money.fromString('${defaultCurrency.code}0.345').cents;
          final expected = BigInt.from(35);
          expect(actual, expected);
        });
        test('0 cents', () {
          final actual = Money.fromString('${defaultCurrency.code}0').cents;
          final expected = BigInt.zero;
          expect(actual, expected);
        });
        test('-1 cent', () {
          final actual = Money.fromString('${defaultCurrency.code}-0.01').cents;
          final expected = -BigInt.one;
          expect(actual, expected);
        });
        test('-34.5 cents ceiling', () {
          final actual =
              Money.fromString('${defaultCurrency.code}-0.345').cents;
          final expected = -BigInt.from(35);
          expect(actual, expected);
        });
        test('-65.4 cents flooring', () {
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

      group('In string (decimal separator) >', () {
        test('1 cent', () {
          final actual = Money.fromString('0${defaultCurrency.code}01').cents;
          final expected = BigInt.one;
          expect(actual, expected);
        });
        test('65.4 cents flooring', () {
          final actual = Money.fromString('0${defaultCurrency.code}654').cents;
          final expected = BigInt.from(65);
          expect(actual, expected);
        });
        test('34.5 cents ceiling', () {
          final actual = Money.fromString('0${defaultCurrency.code}345').cents;
          final expected = BigInt.from(35);
          expect(actual, expected);
        });
        test('-1 cent', () {
          final actual = Money.fromString('-0${defaultCurrency.code}01').cents;
          final expected = -BigInt.one;
          expect(actual, expected);
        });
        test('-34.5 cents ceiling', () {
          final actual = Money.fromString('-0${defaultCurrency.code}345').cents;
          final expected = -BigInt.from(35);
          expect(actual, expected);
        });
        test('-65.4 cents flooring', () {
          final actual = Money.fromString('-0${defaultCurrency.code}654').cents;
          final expected = -BigInt.from(65);
          expect(actual, expected);
        });
      });

      group('Cases with spaces >', () {
        group('In string (end) >', () {
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

        group('In string (start) >', () {
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

        group('In string (end/without ranks) >', () {
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

        group('In string (start/without ranks) >', () {
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

        group('In string (end/without currency spacing) >', () {
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

        group('In string (start/without currency spacing) >', () {
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

        group('In string (decimal separator) >', () {
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

    group('Misc >', () {
      test('Empty string with currency in args', () {
        final actual = Money.fromString('', currency: defaultCurrency);
        final expected = Money.zeroOf(defaultCurrency);
        expect(actual, expected);
      });
      test('Empty string with currency in string', () {
        final actual = Money.fromString(defaultCurrency.icon);
        final expected = Money.zeroOf(defaultCurrency);
        expect(actual, expected);
      });
      test('Empty string without currency', () {
        Money actual() => Money.fromString('');
        final expected = throwsA(const TypeMatcher<NoCurrencyException>());
        expect(actual, expected);
      });
      test('No currency', () {
        Money actual() => Money.fromString('1');
        final expected = throwsA(const TypeMatcher<NoCurrencyException>());
        expect(actual, expected);
      });
      test('String without fractions but with decimal separator', () {
        final actual = Money.fromString('123.', currency: defaultCurrency);
        final expected = Money.fromString('123', currency: defaultCurrency);
        expect(actual, expected);
      });
      test('Max finite', () {
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
}
