// ignore_for_file: avoid_redundant_argument_values

import 'package:mdmoney/mdmoney.dart';
import 'package:test/test.dart';

void main() {
  final defaultCurrency = FiatCurrency.$default;
  final otherCurrency =
      FiatCurrency.values.firstWhere((c) => c != defaultCurrency);
  const maxFinite =
      // ignore: lines_longer_than_80_chars
      1797693134862315708145274237317043567980705675258449965989174768031572607800285387605895586327668781715404589535143824642343213268894641827684675467035375169860499105765512820762454900903893289440758685084551339423045832369032229481658085593321233482747978262041447231687381771809192998812504040261841248583.68;
  const maxFiniteCents =
      // ignore: lines_longer_than_80_chars
      179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.0;

  group('Money constructor tests >', () {
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
      test('Precision -1', () {
        Money actual() => Money.fromCents(0, defaultCurrency, precision: -1);
        final expected =
            throwsA(const TypeMatcher<NegativePrecisionException>());
        expect(actual, expected);
      });
      test('Precision 0', () {
        final actual = Money.fromCents(
          123456789,
          defaultCurrency,
          precision: 0,
        ).fractional.toInt();
        final expected = 0;
        expect(actual, expected);
      });
      test('Precision 4', () {
        final actual = Money.fromCents(
          123456789,
          defaultCurrency,
          precision: 4,
        ).fractional.toInt();
        final expected = 6789;
        expect(actual, expected);
      });
      test('Precision 12', () {
        final actual = Money.fromCents(
          123456789,
          defaultCurrency,
          precision: 12,
        ).fractional.toInt();
        final expected = 123456789;
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
      test('Precision -1', () {
        Money actual() =>
            Money.fromDecimal(Decimal.zero, defaultCurrency, precision: -1);
        final expected =
            throwsA(const TypeMatcher<NegativePrecisionException>());
        expect(actual, expected);
      });
      test('Precision 0', () {
        final actual = Money.fromDecimal(
          Decimal.parse('0.123456789'),
          defaultCurrency,
          precision: 0,
        ).cents.toInt();
        final expected = 0;
        expect(actual, expected);
      });
      test('Precision 4', () {
        final actual = Money.fromDecimal(
          Decimal.parse('0.123456789'),
          defaultCurrency,
          precision: 4,
        ).cents.toInt();
        final expected = 1235;
        expect(actual, expected);
      });
      test('Precision 12', () {
        final actual = Money.fromDecimal(
          Decimal.parse('0.123456789'),
          defaultCurrency,
          precision: 12,
        ).cents.toInt();
        final expected = 123456789000;
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
      test('Precision -1', () {
        Money actual() => Money.fromDouble(1, defaultCurrency, precision: -1);
        final expected =
            throwsA(const TypeMatcher<NegativePrecisionException>());
        expect(actual, expected);
      });
      test('Precision 0', () {
        final actual = Money.fromDouble(
          0.123456789,
          defaultCurrency,
          precision: 0,
        ).cents.toInt();
        final expected = 0;
        expect(actual, expected);
      });
      test('Precision 4', () {
        final actual = Money.fromDouble(
          0.123456789,
          defaultCurrency,
          precision: 4,
        ).cents.toInt();
        final expected = 1235;
        expect(actual, expected);
      });
      test('Precision 12', () {
        final actual = Money.fromDouble(
          0.123456789,
          defaultCurrency,
          precision: 12,
        ).cents.toInt();
        final expected = 123456789000;
        expect(actual, expected);
      });
    });

    group('fromString >', () {
      group('Currency General >', () {
        group('In args >', () {
          test('1${defaultCurrency.icon}', () {
            final actual =
                Money.fromString('1', currency: defaultCurrency).cents;
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
            final actual =
                Money.fromString('0', currency: defaultCurrency).cents;
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
                  Money.fromString('-1 000,01', currency: defaultCurrency)
                      .cents;
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
                  Money.fromString('-1 000.01', currency: defaultCurrency)
                      .cents;
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
            final actual =
                Money.fromString('0.01${defaultCurrency.icon}').cents;
            final expected = BigInt.one;
            expect(actual, expected);
          });
          test('65.4 cents flooring', () {
            final actual =
                Money.fromString('0.654${defaultCurrency.icon}').cents;
            final expected = BigInt.from(65);
            expect(actual, expected);
          });
          test('34.5 cents ceiling', () {
            final actual =
                Money.fromString('0.345${defaultCurrency.icon}').cents;
            final expected = BigInt.from(35);
            expect(actual, expected);
          });
          test('0 cents', () {
            final actual = Money.fromString('0${defaultCurrency.icon}').cents;
            final expected = BigInt.zero;
            expect(actual, expected);
          });
          test('-1 cent', () {
            final actual =
                Money.fromString('-0.01${defaultCurrency.icon}').cents;
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
            final actual =
                Money.fromString('${defaultCurrency.icon}0.01').cents;
            final expected = BigInt.one;
            expect(actual, expected);
          });
          test('65.4 cents flooring', () {
            final actual =
                Money.fromString('${defaultCurrency.icon}0.654').cents;
            final expected = BigInt.from(65);
            expect(actual, expected);
          });
          test('34.5 cents ceiling', () {
            final actual =
                Money.fromString('${defaultCurrency.icon}0.345').cents;
            final expected = BigInt.from(35);
            expect(actual, expected);
          });
          test('0 cents', () {
            final actual = Money.fromString('${defaultCurrency.icon}0').cents;
            final expected = BigInt.zero;
            expect(actual, expected);
          });
          test('-1 cent', () {
            final actual =
                Money.fromString('${defaultCurrency.icon}-0.01').cents;
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
            final actual =
                Money.fromString('0${defaultCurrency.icon}654').cents;
            final expected = BigInt.from(65);
            expect(actual, expected);
          });
          test('34.5 cents ceiling', () {
            final actual =
                Money.fromString('0${defaultCurrency.icon}345').cents;
            final expected = BigInt.from(35);
            expect(actual, expected);
          });
          test('-1 cent', () {
            final actual =
                Money.fromString('-0${defaultCurrency.icon}01').cents;
            final expected = -BigInt.one;
            expect(actual, expected);
          });
          test('-34.5 cents ceiling', () {
            final actual =
                Money.fromString('-0${defaultCurrency.icon}345').cents;
            final expected = -BigInt.from(35);
            expect(actual, expected);
          });
          test('-65.4 cents flooring', () {
            final actual =
                Money.fromString('-0${defaultCurrency.icon}654').cents;
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
            final actual =
                Money.fromString('0.01${defaultCurrency.code}').cents;
            final expected = BigInt.one;
            expect(actual, expected);
          });
          test('65.4 cents flooring', () {
            final actual =
                Money.fromString('0.654${defaultCurrency.code}').cents;
            final expected = BigInt.from(65);
            expect(actual, expected);
          });
          test('34.5 cents ceiling', () {
            final actual =
                Money.fromString('0.345${defaultCurrency.code}').cents;
            final expected = BigInt.from(35);
            expect(actual, expected);
          });
          test('0 cents', () {
            final actual = Money.fromString('0${defaultCurrency.code}').cents;
            final expected = BigInt.zero;
            expect(actual, expected);
          });
          test('-1 cent', () {
            final actual =
                Money.fromString('-0.01${defaultCurrency.code}').cents;
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
            final actual =
                Money.fromString('${defaultCurrency.code}0.01').cents;
            final expected = BigInt.one;
            expect(actual, expected);
          });
          test('65.4 cents flooring', () {
            final actual =
                Money.fromString('${defaultCurrency.code}0.654').cents;
            final expected = BigInt.from(65);
            expect(actual, expected);
          });
          test('34.5 cents ceiling', () {
            final actual =
                Money.fromString('${defaultCurrency.code}0.345').cents;
            final expected = BigInt.from(35);
            expect(actual, expected);
          });
          test('0 cents', () {
            final actual = Money.fromString('${defaultCurrency.code}0').cents;
            final expected = BigInt.zero;
            expect(actual, expected);
          });
          test('-1 cent', () {
            final actual =
                Money.fromString('${defaultCurrency.code}-0.01').cents;
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
            final actual =
                Money.fromString('0${defaultCurrency.code}654').cents;
            final expected = BigInt.from(65);
            expect(actual, expected);
          });
          test('34.5 cents ceiling', () {
            final actual =
                Money.fromString('0${defaultCurrency.code}345').cents;
            final expected = BigInt.from(35);
            expect(actual, expected);
          });
          test('-1 cent', () {
            final actual =
                Money.fromString('-0${defaultCurrency.code}01').cents;
            final expected = -BigInt.one;
            expect(actual, expected);
          });
          test('-34.5 cents ceiling', () {
            final actual =
                Money.fromString('-0${defaultCurrency.code}345').cents;
            final expected = -BigInt.from(35);
            expect(actual, expected);
          });
          test('-65.4 cents flooring', () {
            final actual =
                Money.fromString('-0${defaultCurrency.code}654').cents;
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
        test('Precision -1', () {
          Money actual() =>
              Money.fromString('1', currency: defaultCurrency, precision: -1);
          final expected =
              throwsA(const TypeMatcher<NegativePrecisionException>());
          expect(actual, expected);
        });
        test('Precision 0', () {
          final actual = Money.fromString(
            '0.123456789',
            currency: defaultCurrency,
            precision: 0,
          ).cents.toInt();
          final expected = 0;
          expect(actual, expected);
        });
        test('Precision 4', () {
          final actual = Money.fromString(
            '0.123456789',
            currency: defaultCurrency,
            precision: 4,
          ).cents.toInt();
          final expected = 1235;
          expect(actual, expected);
        });
        test('Precision 12', () {
          final actual = Money.fromString(
            '0.123456789',
            currency: defaultCurrency,
            precision: 12,
          ).cents.toInt();
          final expected = 123456789000;
          expect(actual, expected);
        });
      });
    });
  });

  group('Money unary operations tests >', () {
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
        final actual =
            Money.fromDouble(0.99, defaultCurrency).fractionalDecimal;
        final expected = Decimal.parse('0.99');
        expect(actual, expected);
      });
      test('1 cent', () {
        final actual =
            Money.fromDouble(0.01, defaultCurrency).fractionalDecimal;
        final expected = Decimal.parse('0.01');
        expect(actual, expected);
      });
      test('0 cents', () {
        final actual = Money.fromDouble(0, defaultCurrency).fractionalDecimal;
        final expected = Decimal.zero;
        expect(actual, expected);
      });
      test('-1 cent', () {
        final actual =
            Money.fromDouble(-0.01, defaultCurrency).fractionalDecimal;
        final expected = Decimal.parse('-0.01');
        expect(actual, expected);
      });
      test('-99 cents', () {
        final actual =
            Money.fromDouble(-0.99, defaultCurrency).fractionalDecimal;
        final expected = Decimal.parse('-0.99');
        expect(actual, expected);
      });
      test('-1${defaultCurrency.icon}', () {
        final actual = Money.fromDouble(-1, defaultCurrency).fractionalDecimal;
        final expected = Decimal.zero;
        expect(actual, expected);
      });
      test('-1.5${defaultCurrency.icon}', () {
        final actual =
            Money.fromDouble(-1.5, defaultCurrency).fractionalDecimal;
        final expected = Decimal.parse('-0.5');
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
        final actual =
            Money.fromDouble(-0.01, defaultCurrency).fractionalDouble;
        const expected = -0.01;
        expect(actual, expected);
      });
      test('-99 cents', () {
        final actual =
            Money.fromDouble(-0.99, defaultCurrency).fractionalDouble;
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
  });

  group('Money binary operations tests >', () {
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
      test('Currency mismatch', () {
        final amount1 = Money.fromDouble(0, defaultCurrency);
        final amount2 = Money.fromDouble(0, otherCurrency);
        Money actual() => amount1 + amount2;
        final expected =
            throwsA(const TypeMatcher<CurrencyMismatchException>());
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
      test('Currency mismatch', () {
        final amount1 = Money.fromDouble(0, defaultCurrency);
        final amount2 = Money.fromDouble(0, otherCurrency);
        Money actual() => amount1 - amount2;
        final expected =
            throwsA(const TypeMatcher<CurrencyMismatchException>());
        expect(actual, expected);
      });
    });

    group('multiplication >', () {
      test('0 * 0', () {
        final amount = Money.fromDouble(0, defaultCurrency);
        const coef = 0.0;
        final actual = amount * coef;
        final expected = Money.fromDouble(0, defaultCurrency);
        expect(actual, expected);
      });
      test('0 * 0.1', () {
        final amount = Money.fromDouble(0, defaultCurrency);
        const coef = 0.1;
        final actual = amount * coef;
        final expected = Money.fromDouble(0, defaultCurrency);
        expect(actual, expected);
      });
      test('0 * 1', () {
        final amount = Money.fromDouble(0, defaultCurrency);
        const coef = 1.0;
        final actual = amount * coef;
        final expected = Money.fromDouble(0, defaultCurrency);
        expect(actual, expected);
      });
      test('0 * 1.1', () {
        final amount = Money.fromDouble(0, defaultCurrency);
        const coef = 1.1;
        final actual = amount * coef;
        final expected = Money.fromDouble(0, defaultCurrency);
        expect(actual, expected);
      });
      test('1 * 0.1', () {
        final amount = Money.fromDouble(1, defaultCurrency);
        const coef = 0.1;
        final actual = amount * coef;
        final expected = Money.fromDouble(0.1, defaultCurrency);
        expect(actual, expected);
      });
      test('1 * 1.1', () {
        final amount = Money.fromDouble(1, defaultCurrency);
        const coef = 1.1;
        final actual = amount * coef;
        final expected = Money.fromDouble(1.1, defaultCurrency);
        expect(actual, expected);
      });
      test('1.1 * 0.1', () {
        final amount = Money.fromDouble(1.1, defaultCurrency);
        const coef = 0.1;
        final actual = amount * coef;
        final expected = Money.fromDouble(0.11, defaultCurrency);
        expect(actual, expected);
      });
      test('1.1 * 1.1', () {
        final amount = Money.fromDouble(1.1, defaultCurrency);
        const coef = 1.1;
        final actual = amount * coef;
        final expected = Money.fromDouble(1.21, defaultCurrency);
        expect(actual, expected);
      });
      test('0 * -0.1', () {
        final amount = Money.fromDouble(0, defaultCurrency);
        const coef = -0.1;
        final actual = amount * coef;
        final expected = Money.fromDouble(0, defaultCurrency);
        expect(actual, expected);
      });
      test('0 * -1', () {
        final amount = Money.fromDouble(0, defaultCurrency);
        const coef = -1.0;
        final actual = amount * coef;
        final expected = Money.fromDouble(0, defaultCurrency);
        expect(actual, expected);
      });
      test('0 * -1.1', () {
        final amount = Money.fromDouble(0, defaultCurrency);
        const coef = -1.1;
        final actual = amount * coef;
        final expected = Money.fromDouble(0, defaultCurrency);
        expect(actual, expected);
      });
      test('1 * -0.1', () {
        final amount = Money.fromDouble(1, defaultCurrency);
        const coef = -0.1;
        final actual = amount * coef;
        final expected = Money.fromDouble(-0.1, defaultCurrency);
        expect(actual, expected);
      });
      test('1 * -1.1', () {
        final amount = Money.fromDouble(1, defaultCurrency);
        const coef = -1.1;
        final actual = amount * coef;
        final expected = Money.fromDouble(-1.1, defaultCurrency);
        expect(actual, expected);
      });
      test('1.1 * -0.1', () {
        final amount = Money.fromDouble(1.1, defaultCurrency);
        const coef = -0.1;
        final actual = amount * coef;
        final expected = Money.fromDouble(-0.11, defaultCurrency);
        expect(actual, expected);
      });
      test('1.1 * -1.1', () {
        final amount = Money.fromDouble(1.1, defaultCurrency);
        const coef = -1.1;
        final actual = amount * coef;
        final expected = Money.fromDouble(-1.21, defaultCurrency);
        expect(actual, expected);
      });
      test('ceil rounding', () {
        final amount = Money.fromDouble(123.45, defaultCurrency);
        const coef = 1.24;
        final actual = amount * coef;
        final expected = Money.fromDouble(153.078, defaultCurrency);
        expect(expected.toDouble(), 153.08);
        expect(actual, expected);
      });
      test('floor rounding', () {
        final amount = Money.fromDouble(123.45, defaultCurrency);
        const coef = 0.23;
        final actual = amount * coef;
        final expected = Money.fromDouble(28.3935, defaultCurrency);
        expect(expected.toDouble(), 28.39);
        expect(actual, expected);
      });
      test('Infinite', () {
        final amount = Money.fromDouble(maxFinite, defaultCurrency);
        const coef = double.infinity;
        Money actual() => amount * coef;
        final expected = throwsA(const TypeMatcher<InfiniteNumberException>());
        expect(actual, expected);
      });
    });

    group('division >', () {
      test('0 / 0 (NaN)', () {
        final amount = Money.fromDouble(0, defaultCurrency);
        const coef = 0.0;
        Money actual() => amount / coef;
        final expected = throwsA(const TypeMatcher<NotANumberException>());
        expect(actual, expected);
      });
      test('0 / 0.1', () {
        final amount = Money.fromDouble(0, defaultCurrency);
        const coef = 0.1;
        final actual = amount / coef;
        final expected = Money.fromDouble(0, defaultCurrency);
        expect(actual, expected);
      });
      test('0 / 2', () {
        final amount = Money.fromDouble(0, defaultCurrency);
        const coef = 2.0;
        final actual = amount / coef;
        final expected = Money.fromDouble(0, defaultCurrency);
        expect(actual, expected);
      });
      test('0 / 1.25', () {
        final amount = Money.fromDouble(0, defaultCurrency);
        const coef = 1.25;
        final actual = amount / coef;
        final expected = Money.fromDouble(0, defaultCurrency);
        expect(actual, expected);
      });
      test('0.1 / 0.1', () {
        final amount = Money.fromDouble(0.1, defaultCurrency);
        const coef = 0.1;
        final actual = amount / coef;
        final expected = Money.fromDouble(1, defaultCurrency);
        expect(actual, expected);
      });
      test('0.1 / 2', () {
        final amount = Money.fromDouble(0.1, defaultCurrency);
        const coef = 2.0;
        final actual = amount / coef;
        final expected = Money.fromDouble(0.05, defaultCurrency);
        expect(actual, expected);
      });
      test('0.1 / 1.25', () {
        final amount = Money.fromDouble(0.1, defaultCurrency);
        const coef = 1.25;
        final actual = amount / coef;
        final expected = Money.fromDouble(0.08, defaultCurrency);
        expect(actual, expected);
      });
      test('1 / 0.1', () {
        final amount = Money.fromDouble(1, defaultCurrency);
        const coef = 0.1;
        final actual = amount / coef;
        final expected = Money.fromDouble(10, defaultCurrency);
        expect(actual, expected);
      });
      test('1 / 2', () {
        final amount = Money.fromDouble(1, defaultCurrency);
        const coef = 2.0;
        final actual = amount / coef;
        final expected = Money.fromDouble(0.5, defaultCurrency);
        expect(actual, expected);
      });
      test('1 / 1.25', () {
        final amount = Money.fromDouble(1, defaultCurrency);
        const coef = 1.25;
        final actual = amount / coef;
        final expected = Money.fromDouble(0.8, defaultCurrency);
        expect(actual, expected);
      });
      test('1.25 / 0.1', () {
        final amount = Money.fromDouble(1.25, defaultCurrency);
        const coef = 0.1;
        final actual = amount / coef;
        final expected = Money.fromDouble(12.5, defaultCurrency);
        expect(actual, expected);
      });
      test('1.1 / 2', () {
        final amount = Money.fromDouble(1.1, defaultCurrency);
        const coef = 2.0;
        final actual = amount / coef;
        final expected = Money.fromDouble(0.55, defaultCurrency);
        expect(actual, expected);
      });
      test('4.5 / 1.5', () {
        final amount = Money.fromDouble(4.5, defaultCurrency);
        const coef = 1.5;
        final actual = amount / coef;
        final expected = Money.fromDouble(3, defaultCurrency);
        expect(actual, expected);
      });
      test('0 / -0.1', () {
        final amount = Money.fromDouble(0, defaultCurrency);
        const coef = -0.1;
        final actual = amount / coef;
        final expected = Money.fromDouble(0, defaultCurrency);
        expect(actual, expected);
      });
      test('0 / -2', () {
        final amount = Money.fromDouble(0, defaultCurrency);
        const coef = -2.0;
        final actual = amount / coef;
        final expected = Money.fromDouble(0, defaultCurrency);
        expect(actual, expected);
      });
      test('0 / -1.25', () {
        final amount = Money.fromDouble(0, defaultCurrency);
        const coef = -1.25;
        final actual = amount / coef;
        final expected = Money.fromDouble(0, defaultCurrency);
        expect(actual, expected);
      });
      test('0.1 / -0.1', () {
        final amount = Money.fromDouble(0.1, defaultCurrency);
        const coef = -0.1;
        final actual = amount / coef;
        final expected = Money.fromDouble(-1, defaultCurrency);
        expect(actual, expected);
      });
      test('0.1 / -2', () {
        final amount = Money.fromDouble(0.1, defaultCurrency);
        const coef = -2.0;
        final actual = amount / coef;
        final expected = Money.fromDouble(-0.05, defaultCurrency);
        expect(actual, expected);
      });
      test('0.1 / -1.25', () {
        final amount = Money.fromDouble(0.1, defaultCurrency);
        const coef = -1.25;
        final actual = amount / coef;
        final expected = Money.fromDouble(-0.08, defaultCurrency);
        expect(actual, expected);
      });
      test('1 / -0.1', () {
        final amount = Money.fromDouble(1, defaultCurrency);
        const coef = -0.1;
        final actual = amount / coef;
        final expected = Money.fromDouble(-10, defaultCurrency);
        expect(actual, expected);
      });
      test('1 / -2', () {
        final amount = Money.fromDouble(1, defaultCurrency);
        const coef = -2.0;
        final actual = amount / coef;
        final expected = Money.fromDouble(-0.5, defaultCurrency);
        expect(actual, expected);
      });
      test('1 / -1.25', () {
        final amount = Money.fromDouble(1, defaultCurrency);
        const coef = -1.25;
        final actual = amount / coef;
        final expected = Money.fromDouble(-0.8, defaultCurrency);
        expect(actual, expected);
      });
      test('1.25 / -0.1', () {
        final amount = Money.fromDouble(1.25, defaultCurrency);
        const coef = -0.1;
        final actual = amount / coef;
        final expected = Money.fromDouble(-12.5, defaultCurrency);
        expect(actual, expected);
      });
      test('1.1 / -2', () {
        final amount = Money.fromDouble(1.1, defaultCurrency);
        const coef = -2.0;
        final actual = amount / coef;
        final expected = Money.fromDouble(-0.55, defaultCurrency);
        expect(actual, expected);
      });
      test('4.5 / -1.5', () {
        final amount = Money.fromDouble(4.5, defaultCurrency);
        const coef = -1.5;
        final actual = amount / coef;
        final expected = Money.fromDouble(-3, defaultCurrency);
        expect(actual, expected);
      });
      test('ceil rounding', () {
        final amount = Money.fromDouble(4.55, defaultCurrency);
        const coef = 2.0;
        final actual = amount / coef;
        final expected = Money.fromDouble(2.275, defaultCurrency);
        expect(expected.toDouble(), 2.28);
        expect(actual, expected);
      });
      test('floor rounding', () {
        final amount = Money.fromDouble(1.45, defaultCurrency);
        const coef = 3.0;
        final actual = amount / coef;
        final expected = Money.fromDouble(0.48333333333, defaultCurrency);
        expect(expected.toDouble(), 0.48);
        expect(actual, expected);
      });
      test('Infinite', () {
        final amount = Money.fromDouble(maxFinite, defaultCurrency);
        const coef = double.infinity;
        Money actual() => amount / coef;
        final expected = throwsA(const TypeMatcher<InfiniteNumberException>());
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
        final expected =
            throwsA(const TypeMatcher<CurrencyMismatchException>());
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
        final expected =
            throwsA(const TypeMatcher<CurrencyMismatchException>());
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
        final expected =
            throwsA(const TypeMatcher<CurrencyMismatchException>());
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
        final expected =
            throwsA(const TypeMatcher<CurrencyMismatchException>());
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
        final expected =
            throwsA(const TypeMatcher<CurrencyMismatchException>());
        expect(actual, expected);
      });
    });
  });
}
