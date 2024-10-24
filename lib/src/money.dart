import 'dart:math' as math;

import 'package:decimal/decimal.dart';
import 'package:meta/meta.dart';

import 'fiat_currency.dart';
import 'exceptions.dart';
import 'formats.dart';

/// Objects that stores amount and currency and provides methods to operate with
/// this amount and currency.
@immutable
class Money implements Comparable<Money> {
  /// Constructs an instance of the [Money] from [BigInt] cents and [FiatCurrency].
  ///
  /// Internal contructor.
  const Money._(this.cents, this.currency, this.precision)
      : assert(precision == null || precision >= 0);

  /// Constructs an instance of the [Money] from cent amount and [FiatCurrency].
  factory Money.fromCents(
    int cents,
    FiatCurrency currency, {
    int? precision,
  }) {
    if (precision != null && precision < 0) {
      throw const NegativePrecisionException();
    }

    return Money._(BigInt.from(cents), currency, precision);
  }

  /// Constructs an instance of the [Money] from decimal amount and [FiatCurrency].
  factory Money.fromDecimal(
    Decimal amount,
    FiatCurrency currency, {
    int? precision,
  }) {
    if (precision != null && precision < 0) {
      throw const NegativePrecisionException();
    }

    final centModifier = _centModifier(precision ?? currency.precision);
    final cents = (amount * Decimal.fromInt(centModifier)).round();
    return Money._(cents.toBigInt(), currency, precision);
  }

  /// Constructs an instance of the [Money] from double amount and [FiatCurrency].
  factory Money.fromDouble(
    double amount,
    FiatCurrency currency, {
    int? precision,
  }) {
    if (precision != null && precision < 0) {
      throw const NegativePrecisionException();
    }

    final centModifier = _centModifier(precision ?? currency.precision);
    final cents = (amount * centModifier).roundToDouble();

    if (cents.isInfinite) {
      throw const InfiniteNumberException();
    }

    return Money._(BigInt.from(cents), currency, precision);
  }

  /// Constructs an instance of the [Money] from string and [FiatCurrency].
  factory Money.fromString(
    String amount, {
    FiatCurrency? currency,
    int? precision,
  }) {
    if (precision != null && precision < 0) {
      throw const NegativePrecisionException();
    }

    final currencyFromAmount =
        FiatCurrency.tryParse(amount.replaceAll(RegExp(r'[0-9.,\- ]'), ''));
    final currencyAdjusted = currencyFromAmount ?? currency;

    if (currencyAdjusted == null) {
      throw const NoCurrencyException();
    }
    if (amount.isEmpty ||
        amount == currencyAdjusted.icon ||
        amount == currencyAdjusted.code) {
      return Money.zeroOf(currencyAdjusted, precision: precision);
    }

    var internalAmount = amount.replaceAll(' ', '').replaceAll(',', '.');

    if (!internalAmount.startsWith(currencyAdjusted.icon) &&
        !internalAmount.endsWith(currencyAdjusted.icon)) {
      internalAmount = internalAmount.replaceAll(currencyAdjusted.icon, '.');
    } else {
      internalAmount = internalAmount.replaceAll(currencyAdjusted.icon, '');
    }
    if (!internalAmount.startsWith(currencyAdjusted.code) &&
        !internalAmount.endsWith(currencyAdjusted.code)) {
      internalAmount = internalAmount.replaceAll(currencyAdjusted.code, '.');
    } else {
      internalAmount = internalAmount.replaceAll(currencyAdjusted.code, '');
    }

    final decimalAmount = Decimal.parse(internalAmount);

    return Money.fromDecimal(
      decimalAmount,
      currencyAdjusted,
      precision: precision,
    );
  }

  /// Zero money amount of [currency].
  factory Money.zeroOf(FiatCurrency currency, {int? precision}) =>
      Money.fromCents(0, currency, precision: precision);

  /// One money amount of [currency].
  factory Money.oneOf(FiatCurrency currency, {int? precision}) =>
      Money.fromDouble(1, currency, precision: precision);

  /// Zero money amount of [FiatCurrency.$default].
  static final zero = Money.fromCents(0, FiatCurrency.$default);

  /// One money amount of [FiatCurrency.$default].
  static final one = Money.fromDouble(1, FiatCurrency.$default);

  static int _centModifier(int precision) => math.pow(10, precision).toInt();
  int get _precision => precision ?? currency.precision;

  /// Current amount in cents.
  final BigInt cents;

  /// Currency of the [cents]/amount.
  final FiatCurrency currency;

  /// Custom precision to use with this amount.
  ///
  /// Defaults to `null`, and therefore for precision will be used
  /// [currency.precision], otherwise - value of this field will be used.
  ///
  /// *Please note* that precision cannot be negative, if so -
  /// [NegativePrecisionException] will be thrown.
  final int? precision;

  /// Returns the sign of this amount.
  ///
  /// Returns 0 for zero, -1 for values less than zero and
  /// +1 for values greater than zero.
  int get sign => cents.sign;

  /// Whether this amount is even.
  bool get isEven => cents.isEven;

  /// Whether this amount is odd.
  bool get isOdd => cents.isOdd;

  /// Whether this amount is negative.
  bool get isNegative => cents.isNegative;

  /// Whether this amount is positive.
  bool get isPositive => !isNegative;

  /// Whether this amount is equals to zero or not.
  bool get isZero => this == Money.zeroOf(currency, precision: precision);

  /// Whether this amount is greater than zero or not.
  bool get isGreaterThanZero =>
      this > Money.zeroOf(currency, precision: precision);

  /// Whether this amount is greater than or equals to zero or not.
  bool get isGreaterThanOrEqualZero =>
      this >= Money.zeroOf(currency, precision: precision);

  /// Whether this amount is less than zero or not.
  bool get isLessThanZero =>
      this < Money.zeroOf(currency, precision: precision);

  /// Whether this amount is less than or equals to zero or not.
  bool get isLessThanOrEqualZero =>
      this <= Money.zeroOf(currency, precision: precision);

  /// Gets integer part of the current amount.
  BigInt get integer => cents ~/ BigInt.from(_centModifier(_precision));

  /// Gets fractional part as cents.
  ///
  /// Where possible values starts with [0] and precision of fraction is
  /// defined in either [precision], if provided, or [currency.precision].
  BigInt get fractional {
    if (_precision == 0) {
      return BigInt.zero;
    }

    if (cents.isNegative) {
      return -(cents.abs() % BigInt.from(_centModifier(_precision)));
    }

    return cents % BigInt.from(_centModifier(_precision));
  }

  /// Gets fractional part as decimal value.
  ///
  /// Where possible values starts with [0.0] and precision of fraction is
  /// defined in either [precision], if provided, or [currency.precision].
  Decimal get fractionalDecimal {
    if (_precision == 0) {
      return Decimal.zero;
    }

    final centModifier = _centModifier(_precision);
    return (Decimal.fromBigInt(fractional) / Decimal.fromInt(centModifier))
        .toDecimal();
  }

  /// Gets fractional part as double value.
  ///
  /// Where possible values starts with [0.0] and precision of fraction is
  /// defined in either [precision], if provided, or [currency.precision].
  double get fractionalDouble => fractionalDecimal.toDouble();

  /// Gets decimal representation of the current amount.
  Decimal toDecimal() {
    final centModifier = _centModifier(_precision);
    return (Decimal.fromBigInt(cents) / Decimal.fromInt(centModifier))
        .toDecimal();
  }

  /// Gets double representation of the current amount.
  double toDouble() => toDecimal().toDouble();

  /// Returns the absolute value of this amount.
  Money abs() {
    if (cents.isNegative) {
      return Money._(cents.abs(), currency, precision);
    }

    return this;
  }

  /// Returns the integer amount closest to the current amount.
  Money round() {
    return Money.fromDouble(
      toDouble().roundToDouble(),
      currency,
      precision: precision,
    );
  }

  /// Returns the least amount that is not smaller than this amount.
  ///
  /// Rounds the amount towards infinity.
  Money ceil() {
    if (fractional == BigInt.zero) {
      return this;
    }

    final addition = isPositive ? BigInt.one : BigInt.zero;

    return Money._(
      (integer + addition) * BigInt.from(_centModifier(_precision)),
      currency,
      precision,
    );
  }

  /// Returns the greatest amount no greater than this amount.
  ///
  /// Rounds the amount towards negative infinity.
  Money floor() {
    if (fractional == BigInt.zero) {
      return this;
    }

    final substraction = isPositive ? BigInt.zero : BigInt.one;

    return Money._(
      (integer - substraction) * BigInt.from(_centModifier(_precision)),
      currency,
      precision,
    );
  }

  Money operator -() => Money._(-cents, currency, precision);

  Money operator +(Money other) {
    if (currency != other.currency) {
      throw const CurrencyMismatchException();
    }

    return Money.fromDecimal(
      toDecimal() + other.toDecimal(),
      currency,
      precision: precision,
    );
  }

  Money operator -(Money other) {
    if (currency != other.currency) {
      throw const CurrencyMismatchException();
    }

    return Money.fromDecimal(
      toDecimal() - other.toDecimal(),
      currency,
      precision: precision,
    );
  }

  // ! Possibly change from double to dynamic to support double and Decimal
  Money operator *(double multiplier) {
    if (multiplier.isInfinite) {
      throw const InfiniteNumberException();
    }

    final amount =
        Decimal.fromBigInt(cents) * Decimal.parse(multiplier.toString());

    return Money._(amount.round().toBigInt(), currency, precision);
  }

  // ! Possibly change from double to dynamic to support double and Decimal
  Money operator /(double divider) {
    if (cents == BigInt.zero && divider == 0) {
      throw const NotANumberException();
    }
    if (divider.isInfinite) {
      throw const InfiniteNumberException();
    }

    final amount =
        Decimal.fromBigInt(cents) / Decimal.parse(divider.toString());

    return Money._(amount.round(), currency, precision);
  }

  bool operator <(Money other) {
    if (currency != other.currency) {
      throw const CurrencyMismatchException();
    }

    return toDecimal() < other.toDecimal();
  }

  bool operator <=(Money other) {
    if (currency != other.currency) {
      throw const CurrencyMismatchException();
    }

    return toDecimal() <= other.toDecimal();
  }

  bool operator >(Money other) {
    if (currency != other.currency) {
      throw const CurrencyMismatchException();
    }

    return toDecimal() > other.toDecimal();
  }

  bool operator >=(Money other) {
    if (currency != other.currency) {
      throw const CurrencyMismatchException();
    }

    return toDecimal() >= other.toDecimal();
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Money &&
            runtimeType == other.runtimeType &&
            cents == other.cents &&
            currency == other.currency &&
            precision == other.precision;
  }

  @override
  int get hashCode => cents.hashCode ^ currency.hashCode ^ precision.hashCode;

  @override
  int compareTo(Money other) {
    if (currency != other.currency) {
      throw const CurrencyMismatchException();
    }

    if (toDecimal() < other.toDecimal()) {
      return -1;
    } else if (toDecimal() > other.toDecimal()) {
      return 1;
    } else {
      return 0;
    }

    // ! Use this out-of-the-box solution when it will be fixed
    // ! Now it provides -110/110/0 results
    // return cents.compareTo(other.cents);
  }

  /// Gets formatted string representation of the current amount, based on the:
  /// - [CurrencyPosition];
  /// - [FiatCurrencyFormat];
  /// - [MoneyFormat];
  /// - [RankFormat];
  /// - [DecimalSeparatorFormat].
  ///
  /// Defaults are [FiatCurrencyFormat.icon] and [MoneyFormat.fixedDouble].
  @override
  String toString({
    CurrencyPosition currencyPosition = CurrencyPosition.end,
    FiatCurrencyFormat currencyFormat = FiatCurrencyFormat.icon,
    MoneyFormat moneyFormat = MoneyFormat.fixedDouble,
    RankFormat rankFormat = RankFormat.space,
    DecimalSeparatorFormat decimalSeparatorFormat =
        DecimalSeparatorFormat.point,
  }) {
    final moneyFmt = decimalSeparatorFormat.format(
      rankFormat.format(
        moneyFormat.format(this),
      ),
    );
    final currencyFmt = currencyFormat.format(currency);

    switch (currencyPosition) {
      case CurrencyPosition.start:
        return '$currencyFmt$moneyFmt';
      case CurrencyPosition.startSpaced:
        return '$currencyFmt $moneyFmt'.trimLeft();
      case CurrencyPosition.end:
        return '$moneyFmt$currencyFmt';
      case CurrencyPosition.endSpaced:
        return '$moneyFmt $currencyFmt'.trimRight();
      case CurrencyPosition.decimalSeparator:
        if (currencyFormat == FiatCurrencyFormat.none) {
          return moneyFmt;
        }

        switch (decimalSeparatorFormat) {
          case DecimalSeparatorFormat.point:
            return moneyFmt.replaceAll('.', currencyFmt);
          case DecimalSeparatorFormat.comma:
            return moneyFmt.replaceAll(',', currencyFmt);
        }
    }
  }
}
