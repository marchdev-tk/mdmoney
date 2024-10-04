import 'package:mdmoney/mdmoney.dart';
import 'package:test/test.dart';

void main() {
  group('DecimalSeparatorFormat >', () {
    group('Exceptions >', () {
      test('empty', () {
        String actual() => RankFormat.none.format('');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
      test('comma separated', () {
        String actual() => RankFormat.none.format('1234,5');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
      test('comma separated with too much fractionals', () {
        String actual() => RankFormat.none.format('1234,567');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
      test('integer with decimal point', () {
        String actual() => RankFormat.none.format('123.');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
      test('decimal point', () {
        String actual() => RankFormat.none.format('.');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
      test('decimal point and fractionals', () {
        String actual() => RankFormat.none.format('.23');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
      test('decimal point and too much fractionals', () {
        String actual() => RankFormat.none.format('.234');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
      test('too much fractionals', () {
        String actual() => RankFormat.none.format('1.234');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
    });

    group('Point >', () {
      test('1234', () {
        final actual = DecimalSeparatorFormat.point.format('1234');
        const expected = '1234';
        expect(actual, expected);
      });
      test('1234.5', () {
        final actual = DecimalSeparatorFormat.point.format('1234.5');
        const expected = '1234.5';
        expect(actual, expected);
      });
      test('1234.56', () {
        final actual = DecimalSeparatorFormat.point.format('1234.56');
        const expected = '1234.56';
        expect(actual, expected);
      });
      test('-1234', () {
        final actual = DecimalSeparatorFormat.point.format('-1234');
        const expected = '-1234';
        expect(actual, expected);
      });
      test('-1234.5', () {
        final actual = DecimalSeparatorFormat.point.format('-1234.5');
        const expected = '-1234.5';
        expect(actual, expected);
      });
      test('-1234.56', () {
        final actual = DecimalSeparatorFormat.point.format('-1234.56');
        const expected = '-1234.56';
        expect(actual, expected);
      });
    });

    group('Comma >', () {
      test('1234', () {
        final actual = DecimalSeparatorFormat.comma.format('1234');
        const expected = '1234';
        expect(actual, expected);
      });
      test('1234,5', () {
        final actual = DecimalSeparatorFormat.comma.format('1234.5');
        const expected = '1234,5';
        expect(actual, expected);
      });
      test('1234.56', () {
        final actual = DecimalSeparatorFormat.comma.format('1234.56');
        const expected = '1234,56';
        expect(actual, expected);
      });
      test('-1234', () {
        final actual = DecimalSeparatorFormat.comma.format('-1234');
        const expected = '-1234';
        expect(actual, expected);
      });
      test('-1234.5', () {
        final actual = DecimalSeparatorFormat.comma.format('-1234.5');
        const expected = '-1234,5';
        expect(actual, expected);
      });
      test('-1234.56', () {
        final actual = DecimalSeparatorFormat.comma.format('-1234.56');
        const expected = '-1234,56';
        expect(actual, expected);
      });
    });
  });

  group('RankFormat >', () {
    group('Exceptions >', () {
      test('empty', () {
        String actual() => RankFormat.none.format('');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
      test('comma separated', () {
        String actual() => RankFormat.none.format('1234,5');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
      test('comma separated with too much fractionals', () {
        String actual() => RankFormat.none.format('1234,567');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
      test('integer with decimal point', () {
        String actual() => RankFormat.none.format('123.');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
      test('decimal point', () {
        String actual() => RankFormat.none.format('.');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
      test('decimal point and fractionals', () {
        String actual() => RankFormat.none.format('.23');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
      test('decimal point and too much fractionals', () {
        String actual() => RankFormat.none.format('.234');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
      test('too much fractionals', () {
        String actual() => RankFormat.none.format('1.234');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
    });

    group('None >', () {
      group('Integer >', () {
        test('1', () {
          final actual = RankFormat.none.format('1');
          const expected = '1';
          expect(actual, expected);
        });
        test('-12', () {
          final actual = RankFormat.none.format('-12');
          const expected = '-12';
          expect(actual, expected);
        });
        test('123', () {
          final actual = RankFormat.none.format('123');
          const expected = '123';
          expect(actual, expected);
        });
        test('1234', () {
          final actual = RankFormat.none.format('1234');
          const expected = '1234';
          expect(actual, expected);
        });
        test('12345', () {
          final actual = RankFormat.none.format('12345');
          const expected = '12345';
          expect(actual, expected);
        });
        test('123456', () {
          final actual = RankFormat.none.format('123456');
          const expected = '123456';
          expect(actual, expected);
        });
        test('1234567', () {
          final actual = RankFormat.none.format('1234567');
          const expected = '1234567';
          expect(actual, expected);
        });
        test('12345678', () {
          final actual = RankFormat.none.format('12345678');
          const expected = '12345678';
          expect(actual, expected);
        });
        test('123456789', () {
          final actual = RankFormat.none.format('123456789');
          const expected = '123456789';
          expect(actual, expected);
        });
      });
      group('Integer with fractionals >', () {
        test('1.1', () {
          final actual = RankFormat.none.format('1.1');
          const expected = '1.1';
          expect(actual, expected);
        });
        test('1234.1', () {
          final actual = RankFormat.none.format('1234.1');
          const expected = '1234.1';
          expect(actual, expected);
        });
        test('12345678.1', () {
          final actual = RankFormat.none.format('12345678.1');
          const expected = '12345678.1';
          expect(actual, expected);
        });
        test('1.85', () {
          final actual = RankFormat.none.format('1.85');
          const expected = '1.85';
          expect(actual, expected);
        });
        test('1234.85', () {
          final actual = RankFormat.none.format('1234.85');
          const expected = '1234.85';
          expect(actual, expected);
        });
        test('12345678.85', () {
          final actual = RankFormat.none.format('12345678.85');
          const expected = '12345678.85';
          expect(actual, expected);
        });
      });
    });

    group('Space >', () {
      group('Integer >', () {
        test('1', () {
          final actual = RankFormat.space.format('1');
          const expected = '1';
          expect(actual, expected);
        });
        test('-12', () {
          final actual = RankFormat.space.format('-12');
          const expected = '-12';
          expect(actual, expected);
        });
        test('123', () {
          final actual = RankFormat.space.format('123');
          const expected = '123';
          expect(actual, expected);
        });
        test('1234', () {
          final actual = RankFormat.space.format('1234');
          const expected = '1 234';
          expect(actual, expected);
        });
        test('12345', () {
          final actual = RankFormat.space.format('12345');
          const expected = '12 345';
          expect(actual, expected);
        });
        test('123456', () {
          final actual = RankFormat.space.format('123456');
          const expected = '123 456';
          expect(actual, expected);
        });
        test('1234567', () {
          final actual = RankFormat.space.format('1234567');
          const expected = '1 234 567';
          expect(actual, expected);
        });
        test('12345678', () {
          final actual = RankFormat.space.format('12345678');
          const expected = '12 345 678';
          expect(actual, expected);
        });
        test('123456789', () {
          final actual = RankFormat.space.format('123456789');
          const expected = '123 456 789';
          expect(actual, expected);
        });
      });
      group('Integer with fractionals >', () {
        test('1.1', () {
          final actual = RankFormat.space.format('1.1');
          const expected = '1.1';
          expect(actual, expected);
        });
        test('1234.1', () {
          final actual = RankFormat.space.format('1234.1');
          const expected = '1 234.1';
          expect(actual, expected);
        });
        test('12345678.1', () {
          final actual = RankFormat.space.format('12345678.1');
          const expected = '12 345 678.1';
          expect(actual, expected);
        });
        test('1.85', () {
          final actual = RankFormat.space.format('1.85');
          const expected = '1.85';
          expect(actual, expected);
        });
        test('1234.85', () {
          final actual = RankFormat.space.format('1234.85');
          const expected = '1 234.85';
          expect(actual, expected);
        });
        test('12345678.85', () {
          final actual = RankFormat.space.format('12345678.85');
          const expected = '12 345 678.85';
          expect(actual, expected);
        });
      });
    });
  });

  group('MoneyFormat >', () {
    group('integer >', () {
      test('1234', () {
        final actual = MoneyFormat.integer
            .format(Money.fromDouble(1234, FiatCurrency.$default));
        const expected = '1234';
        expect(actual, expected);
      });
      test('1234.5', () {
        final actual = MoneyFormat.integer
            .format(Money.fromDouble(1234.5, FiatCurrency.$default));
        const expected = '1234';
        expect(actual, expected);
      });
      test('1234.56', () {
        final actual = MoneyFormat.integer
            .format(Money.fromDouble(1234.56, FiatCurrency.$default));
        const expected = '1234';
        expect(actual, expected);
      });
    });

    group('fixedDouble >', () {
      test('1234', () {
        final actual = MoneyFormat.fixedDouble
            .format(Money.fromDouble(1234, FiatCurrency.$default));
        const expected = '1234.00';
        expect(actual, expected);
      });
      test('1234.5', () {
        final actual = MoneyFormat.fixedDouble
            .format(Money.fromDouble(1234.5, FiatCurrency.$default));
        const expected = '1234.50';
        expect(actual, expected);
      });
      test('1234.56', () {
        final actual = MoneyFormat.fixedDouble
            .format(Money.fromDouble(1234.56, FiatCurrency.$default));
        const expected = '1234.56';
        expect(actual, expected);
      });
    });

    group('flexibleDouble >', () {
      test('1234', () {
        final actual = MoneyFormat.flexibleDouble
            .format(Money.fromDouble(1234, FiatCurrency.$default));
        const expected = '1234';
        expect(actual, expected);
      });
      test('1234.5', () {
        final actual = MoneyFormat.flexibleDouble
            .format(Money.fromDouble(1234.5, FiatCurrency.$default));
        const expected = '1234.5';
        expect(actual, expected);
      });
      test('1234.56', () {
        final actual = MoneyFormat.flexibleDouble
            .format(Money.fromDouble(1234.56, FiatCurrency.$default));
        const expected = '1234.56';
        expect(actual, expected);
      });
    });
  });

  group('CurrencyFormat >', () {
    test('none', () {
      final actual = FiatCurrencyFormat.none.format(FiatCurrency.$default);
      const expected = '';
      expect(actual, expected);
    });
    test('code', () {
      final actual = FiatCurrencyFormat.code.format(FiatCurrency.$default);
      final expected = FiatCurrency.$default.code;
      expect(actual, expected);
    });
    test('icon', () {
      final actual = FiatCurrencyFormat.icon.format(FiatCurrency.$default);
      final expected = FiatCurrency.$default.icon;
      expect(actual, expected);
    });
  });

  group('CurrencyPosition >', () {
    group('isStart >', () {
      test('start', () {
        final actual = CurrencyPosition.start.isStart;
        const expected = true;
        expect(actual, expected);
      });
      test('startSpaced', () {
        final actual = CurrencyPosition.startSpaced.isStart;
        const expected = true;
        expect(actual, expected);
      });
      test('end', () {
        final actual = CurrencyPosition.end.isStart;
        const expected = false;
        expect(actual, expected);
      });
      test('endSpaced', () {
        final actual = CurrencyPosition.endSpaced.isStart;
        const expected = false;
        expect(actual, expected);
      });
      test('decimalSeparator', () {
        final actual = CurrencyPosition.decimalSeparator.isStart;
        const expected = false;
        expect(actual, expected);
      });
    });

    group('isEnd >', () {
      test('start', () {
        final actual = CurrencyPosition.start.isEnd;
        const expected = false;
        expect(actual, expected);
      });
      test('startSpaced', () {
        final actual = CurrencyPosition.startSpaced.isEnd;
        const expected = false;
        expect(actual, expected);
      });
      test('end', () {
        final actual = CurrencyPosition.end.isEnd;
        const expected = true;
        expect(actual, expected);
      });
      test('endSpaced', () {
        final actual = CurrencyPosition.endSpaced.isEnd;
        const expected = true;
        expect(actual, expected);
      });
      test('decimalSeparator', () {
        final actual = CurrencyPosition.decimalSeparator.isEnd;
        const expected = false;
        expect(actual, expected);
      });
    });

    group('isSpaced >', () {
      test('start', () {
        final actual = CurrencyPosition.start.isSpaced;
        const expected = false;
        expect(actual, expected);
      });
      test('startSpaced', () {
        final actual = CurrencyPosition.startSpaced.isSpaced;
        const expected = true;
        expect(actual, expected);
      });
      test('end', () {
        final actual = CurrencyPosition.end.isSpaced;
        const expected = false;
        expect(actual, expected);
      });
      test('endSpaced', () {
        final actual = CurrencyPosition.endSpaced.isSpaced;
        const expected = true;
        expect(actual, expected);
      });
      test('decimalSeparator', () {
        final actual = CurrencyPosition.decimalSeparator.isSpaced;
        const expected = false;
        expect(actual, expected);
      });
    });
  });
}
