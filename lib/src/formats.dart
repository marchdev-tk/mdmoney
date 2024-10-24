import 'package:mdmoney/mdmoney.dart';

final _doubleRegex = RegExp(r'^(-?)(0|([1-9][0-9]*))(\.[0-9]{1,})?$');
final _doubleRankedRegex = RegExp(r'^(-?)(0|([1-9][0-9 ]*))(\.[0-9]{1,})?$');

abstract interface class MoneyFormatterInteface<T> {
  String format(T value);
}

/// Describes possible decimal separator formats.
enum DecimalSeparatorFormat implements MoneyFormatterInteface<String> {
  /// Decimal point.
  point,

  /// Decimal comma.
  comma;

  /// Formats given [amount] per current decimal separator format.
  ///
  /// **Please note**: [amount] string should be normalized, which means that
  /// this string must:
  ///
  /// * contain only numbers and rank symbol
  /// * decimal separator must be `.`
  @override
  String format(String amount) {
    if (!_doubleRankedRegex.hasMatch(amount)) {
      throw ArgumentError.value(
        amount,
        'amount',
        'Must contain only money amount style string, '
            'for instanse: "123.45"/"321.4"/"456"',
      );
    }

    switch (this) {
      case point:
        return amount;
      case comma:
        return amount.replaceAll('.', ',');
    }
  }
}

/// Describes possible rank formatting options.
enum RankFormat implements MoneyFormatterInteface<String> {
  /// Amount will not be formatted.
  none,

  /// Amount will be divided into chunks, within each chunk will be 3 digits
  /// max. Each chunk will be separated by space char.
  space;

  /// Formats given [amount] per current ranking format.
  ///
  /// **Please note**: [amount] string should be normalized, which means that
  /// this string must:
  ///
  /// * contain only numbers
  /// * decimal separator must be `.`
  @override
  String format(String amount) {
    if (!_doubleRegex.hasMatch(amount)) {
      throw ArgumentError.value(
        amount,
        'amount',
        'Must contain only money amount style string, '
            'for instanse: "123.45"/"321.4"/"456"',
      );
    }

    switch (this) {
      case none:
        return amount;
      case space:
        final indexOfPoint = amount.indexOf('.');
        final hasMinusSign = amount.startsWith('-');
        final integer = amount
            .substring(
              hasMinusSign ? 1 : 0,
              indexOfPoint == -1 ? null : indexOfPoint,
            )
            .runes
            .toList();

        if (integer.length <= 3) {
          return amount;
        }

        final integerLength = integer.length;
        for (var i = 3, counter = 0; i < integerLength; i++) {
          if (i % 3 == 0) {
            integer.insert(
              integer.length - i - counter,
              ' '.codeUnits.single,
            );
            counter++;
          }
        }
        var fractional = '';
        if (amount.contains('.')) {
          fractional = amount.substring(indexOfPoint);
        }
        var sign = '';
        if (hasMinusSign) {
          sign = '-';
        }

        return '$sign${String.fromCharCodes(integer)}$fractional';
    }
  }
}

/// Describes possible [Money] formatting options.
enum MoneyFormat implements MoneyFormatterInteface<Money> {
  /// [Money] value will be formatted as an integer truncating any fractional
  /// parts.
  ///
  /// For instance: `XXXX`.
  integer,

  /// [Money] value will be formatted depending on the presence of the
  /// fractional part. If fractional part contains only one digit, it will be
  /// formatted as a single fractional digit.
  ///
  /// For instance: `XXXX`/`XXXX.X`/`XXXX.XX`.
  flexibleDouble,

  /// [Money] value will be formatted as a double value with fixed 2 digits
  /// after the decimal point, no matter whether this value has a fractional
  /// part or not.
  ///
  /// For instance: `XXXX.XX`.
  fixedDouble;

  /// Formats [Money].
  @override
  String format(Money value, [int? precision]) {
    switch (this) {
      case integer:
        return value.integer.toString();
      case flexibleDouble:
        if (value.fractional == BigInt.zero) {
          return value.integer.toString();
        } else {
          return value.toDecimal().toString();
        }
      case fixedDouble:
        final adjustedPrecision = precision ?? value.precision;

        if (adjustedPrecision < 0) {
          throw const NegativePrecisionException();
        }

        return value.toDecimal().toStringAsFixed(adjustedPrecision);
    }
  }
}

/// Describes possible [FiatCurrency] formatting options.
enum FiatCurrencyFormat implements MoneyFormatterInteface<FiatCurrency> {
  /// [FiatCurrency] value will not be used at all.
  none,

  /// [FiatCurrency] value will be formatted as a currency code.
  ///
  /// For instance: `UAH`.
  code,

  /// [FiatCurrency] value will be formatted as a currency icon.
  ///
  /// For instance: `$`.
  icon;

  /// Formats [FiatCurrency].
  @override
  String format(FiatCurrency value) {
    switch (this) {
      case code:
        return value.code;
      case icon:
        return value.icon;
      case none:
        return '';
    }
  }
}

/// Describes possible [FiatCurrency] position options.
enum CurrencyPosition {
  /// [FiatCurrency] value should be before amount.
  ///
  /// For instance: `$100.20`.
  start,

  /// [FiatCurrency] value should be before amount with space between currency and
  /// amount.
  ///
  /// For instance: `$ 100.20`.
  startSpaced,

  /// [FiatCurrency] value should be after amount.
  ///
  /// For instance: `100.20$`.
  end,

  /// [FiatCurrency] value should be after amount with space between currency and
  /// amount.
  ///
  /// For instance: `100.20 $`.
  endSpaced,

  /// [FiatCurrency] value should be used as decimal seprator.
  ///
  /// For instance: `100$20`/`100$`/`0$20`.
  decimalSeparator;

  /// Whether currency position is [CurrencyPosition.start] or
  /// [CurrencyPosition.startSpaced].
  bool get isStart =>
      this == CurrencyPosition.start || this == CurrencyPosition.startSpaced;

  /// Whether currency position is [CurrencyPosition.end] or
  /// [CurrencyPosition.endSpaced].
  bool get isEnd =>
      this == CurrencyPosition.end || this == CurrencyPosition.endSpaced;

  /// Whether currency position is [CurrencyPosition.startSpaced] or
  /// [CurrencyPosition.endSpaced].
  bool get isSpaced =>
      this == CurrencyPosition.startSpaced ||
      this == CurrencyPosition.endSpaced;
}
