import 'package:mdmoney/mdmoney.dart';
import 'package:test/test.dart';

void main() {
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
