import 'package:collection/collection.dart';
import 'package:decimal/decimal.dart';
import 'package:meta/meta.dart';

import 'currency.dart';
import 'exceptions.dart';
import 'formats.dart';

/// Objects that stores amount and currency and provides methods to operate with
/// this amount and currency.
@immutable
class Money implements Comparable<Money> {
  /// Constructs an instance of the [Money] from [BigInt] cents and [FiatCurrency].
  ///
  /// Internal contructor.
  const Money._(this.cents, this.currency);

  /// Constructs an instance of the [Money] from cent amount and [FiatCurrency].
  factory Money.fromCents(int cents, FiatCurrency currency) {
    return Money._(BigInt.from(cents), currency);
  }

  /// Constructs an instance of the [Money] from decimal amount and [FiatCurrency].
  factory Money.fromDecimal(Decimal amount, FiatCurrency currency) {
    final cents = (amount * Decimal.fromInt(100)).round();
    return Money._(cents.toBigInt(), currency);
  }

  /// Constructs an instance of the [Money] from double amount and [FiatCurrency].
  factory Money.fromDouble(double amount, FiatCurrency currency) {
    final cents = (amount * 100).roundToDouble();

    if (cents.isInfinite) {
      throw const InfiniteNumberException();
    }

    return Money._(BigInt.from(cents), currency);
  }

  /// Constructs an instance of the [Money] from string and [FiatCurrency].
  factory Money.fromString(String amount, [FiatCurrency? currency]) {
    final currencyFromAmount = FiatCurrency.values.firstWhereOrNull(
        (c) => amount.contains(c.icon) || amount.contains(c.code));
    final currencyAdjusted = currencyFromAmount ?? currency;

    if (currencyAdjusted == null) {
      throw const NoCurrencyException();
    }
    if (amount.isEmpty ||
        amount == currencyAdjusted.icon ||
        amount == currencyAdjusted.code) {
      return Money.zeroOf(currencyAdjusted);
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

    return Money.fromDecimal(decimalAmount, currencyAdjusted);
  }

  /// Zero money amount of [currency].
  factory Money.zeroOf(FiatCurrency currency) => Money.fromCents(0, currency);

  /// One money amount (100 cents) of [currency].
  factory Money.oneOf(FiatCurrency currency) => Money.fromCents(100, currency);

  /// Zero money amount of [FiatCurrency.$default].
  static final zero = Money.fromCents(0, FiatCurrency.$default);

  /// One money amount (100 cents) of [FiatCurrency.$default].
  static final one = Money.fromCents(100, FiatCurrency.$default);

  /// Current amount in cents.
  final BigInt cents;

  /// Currency of the [cents]/amount.
  final FiatCurrency currency;

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
  bool get isZero => this == Money.zeroOf(currency);

  /// Whether this amount is greater than zero or not.
  bool get isGreaterThanZero => this > Money.zeroOf(currency);

  /// Whether this amount is greater than or equals to zero or not.
  bool get isGreaterThanOrEqualZero => this >= Money.zeroOf(currency);

  /// Whether this amount is less than zero or not.
  bool get isLessThanZero => this < Money.zeroOf(currency);

  /// Whether this amount is less than or equals to zero or not.
  bool get isLessThanOrEqualZero => this <= Money.zeroOf(currency);

  /// Gets integer part of the current amount.
  BigInt get integer => cents ~/ BigInt.from(100);

  /// Gets fractional part as cents.
  ///
  /// Where possible values are [0..99].
  BigInt get fractional {
    if (cents.isNegative) {
      return -(cents.abs() % BigInt.from(100));
    }

    return cents % BigInt.from(100);
  }

  /// Gets fractional part as decimal value.
  ///
  /// Where possible values are [0..0.99].
  Decimal get fractionalDecimal =>
      (Decimal.fromBigInt(fractional) / Decimal.fromInt(100)).toDecimal();

  /// Gets fractional part as double value.
  ///
  /// Where possible values are [0..0.99].
  double get fractionalDouble => fractionalDecimal.toDouble();

  /// Gets decimal representation of the current amount.
  Decimal toDecimal() =>
      (Decimal.fromBigInt(cents) / Decimal.fromInt(100)).toDecimal();

  /// Gets double representation of the current amount.
  double toDouble() => toDecimal().toDouble();

  /// Returns the absolute value of this amount.
  Money abs() {
    if (cents.isNegative) {
      return Money._(cents.abs(), currency);
    }

    return this;
  }

  /// Returns the integer amount closest to the current amount.
  Money round() => Money.fromDouble(toDouble().roundToDouble(), currency);

  /// Returns the least amount that is not smaller than this amount.
  ///
  /// Rounds the amount towards infinity.
  Money ceil() {
    if (fractional == BigInt.zero) {
      return this;
    }

    final addition = isPositive ? BigInt.one : BigInt.zero;

    return Money._((integer + addition) * BigInt.from(100), currency);
  }

  /// Returns the greatest amount no greater than this amount.
  ///
  /// Rounds the amount towards negative infinity.
  Money floor() {
    if (fractional == BigInt.zero) {
      return this;
    }

    final substraction = isPositive ? BigInt.zero : BigInt.one;

    return Money._((integer - substraction) * BigInt.from(100), currency);
  }

  Money operator -() => Money._(-cents, currency);

  Money operator +(Money other) {
    if (currency != other.currency) {
      throw const CurrencyMismatchException();
    }

    return Money._(cents + other.cents, currency);
  }

  Money operator -(Money other) {
    if (currency != other.currency) {
      throw const CurrencyMismatchException();
    }

    return Money._(cents - other.cents, currency);
  }

  // ! Possibly change from double to dynamic to support double and Decimal
  Money operator *(double multiplier) {
    if (multiplier.isInfinite) {
      throw const InfiniteNumberException();
    }

    final amount =
        Decimal.fromBigInt(cents) * Decimal.parse(multiplier.toString());

    return Money._(amount.round().toBigInt(), currency);
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

    return Money._(amount.round(), currency);
  }

  bool operator <(Money other) {
    if (currency != other.currency) {
      throw const CurrencyMismatchException();
    }

    return cents < other.cents;
  }

  bool operator <=(Money other) {
    if (currency != other.currency) {
      throw const CurrencyMismatchException();
    }

    return cents <= other.cents;
  }

  bool operator >(Money other) {
    if (currency != other.currency) {
      throw const CurrencyMismatchException();
    }

    return cents > other.cents;
  }

  bool operator >=(Money other) {
    if (currency != other.currency) {
      throw const CurrencyMismatchException();
    }

    return cents >= other.cents;
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Money &&
            runtimeType == other.runtimeType &&
            cents == other.cents &&
            currency == other.currency;
  }

  @override
  int get hashCode => cents.hashCode ^ currency.hashCode;

  @override
  int compareTo(Money other) {
    if (currency != other.currency) {
      throw const CurrencyMismatchException();
    }

    if (cents < other.cents) {
      return -1;
    } else if (cents > other.cents) {
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
