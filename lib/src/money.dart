// Copyright (c) 2024, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:math' as math;

import 'package:mdamount/mdamount.dart';
import 'package:meta/meta.dart';

import 'fiat_currency.dart';
import 'exceptions.dart';
import 'formats.dart';

/// Object that stores amount and currency and provides methods to operate with
/// this amount and currency.
@immutable
class Money extends Amount {
  /// Constructs an instance of the [Money] from [BigInt] cents, [FiatCurrency]
  /// and [precision].
  ///
  /// If [precision] was not explicitly set or set to a negative
  /// value - [currency.precision] will be used instead.
  ///
  /// Internal contructor.
  Money._(super.value, this.currency, {int? precision})
      : super(
            precision: precision == null || precision < 0
                ? currency.precision
                : precision);

  /// Constructs an instance of the [Money] from [int] [cents], [FiatCurrency]
  /// and [precision].
  ///
  /// If [precision] was not explicitly set - [currency.precision] will be
  /// used instead.
  factory Money.fromCents(
    int cents,
    FiatCurrency currency, {
    int? precision,
  }) {
    if (precision != null && precision < 0) {
      throw const NegativePrecisionException();
    }

    final adjustedPrecision = precision ?? currency.precision;
    return Money._(BigInt.from(cents), currency, precision: adjustedPrecision);
  }

  /// Constructs an instance of the [Money] from [BigInt] [amount],
  /// [FiatCurrency] and [precision].
  ///
  /// If [precision] was not explicitly set - [currency.precision] will be
  /// used instead.
  factory Money.fromBigInt(
    BigInt amount,
    FiatCurrency currency, {
    int? precision,
  }) {
    if (precision != null && precision < 0) {
      throw const NegativePrecisionException();
    }

    final adjustedPrecision = precision ?? currency.precision;
    final precisionModifier = _precisionModifier(adjustedPrecision);
    final value = amount * BigInt.from(precisionModifier);
    return Money._(value, currency, precision: adjustedPrecision);
  }

  /// Constructs an instance of the [Money] from [int] [amount], [FiatCurrency]
  /// and [precision].
  ///
  /// If [precision] was not explicitly set - [currency.precision] will be
  /// used instead.
  factory Money.fromInt(
    int amount,
    FiatCurrency currency, {
    int? precision,
  }) {
    if (precision != null && precision < 0) {
      throw const NegativePrecisionException();
    }

    final adjustedPrecision = precision ?? currency.precision;
    final precisionModifier = _precisionModifier(adjustedPrecision);
    final value = BigInt.from(amount) * BigInt.from(precisionModifier);
    return Money._(value, currency, precision: adjustedPrecision);
  }

  /// Constructs an instance of the [Money] from [Decimal] [amount],
  /// [FiatCurrency] and [precision].
  ///
  /// If [precision] was not explicitly set - [currency.precision] will be
  /// used instead.
  factory Money.fromDecimal(
    Decimal amount,
    FiatCurrency currency, {
    int? precision,
  }) {
    if (precision != null && precision < 0) {
      throw const NegativePrecisionException();
    }

    final adjustedPrecision = precision ?? currency.precision;
    final centModifier = _precisionModifier(adjustedPrecision);
    final cents = (amount * Decimal.fromInt(centModifier)).round();
    return Money._(cents.toBigInt(), currency, precision: adjustedPrecision);
  }

  /// Constructs an instance of the [Money] from [double] [amount],
  /// [FiatCurrency] and [precision].
  ///
  /// If [precision] was not explicitly set - [currency.precision] will be
  /// used instead.
  factory Money.fromDouble(
    double amount,
    FiatCurrency currency, {
    int? precision,
  }) {
    if (precision != null && precision < 0) {
      throw const NegativePrecisionException();
    }

    final adjustedPrecision = precision ?? currency.precision;
    final centModifier = _precisionModifier(adjustedPrecision);
    final cents = (amount * centModifier).roundToDouble();

    if (cents.isInfinite) {
      throw const InfiniteNumberException();
    }

    return Money._(BigInt.from(cents), currency, precision: adjustedPrecision);
  }

  /// Constructs an instance of the [Money] from [String] [amount], optional
  /// [FiatCurrency] and [precision].
  ///
  /// If there is no currency in [amount] then [currency] is required, otherwise
  /// explicit specification of [currency] is redundant.
  ///
  /// If [precision] was not explicitly set - [currency.precision] will be
  /// used instead.
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

    final adjustedPrecision = precision ?? currencyAdjusted.precision;

    if (amount.isEmpty ||
        amount == currencyAdjusted.icon ||
        amount == currencyAdjusted.code) {
      return Money.zeroOf(currencyAdjusted, precision: adjustedPrecision);
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
      precision: adjustedPrecision,
    );
  }

  /// Constructs an instance of the [Money] from [Amount] [amount],
  /// [FiatCurrency] and [precision].
  ///
  /// If [precision] was not explicitly set - [amount.precision] will be
  /// used instead.
  ///
  /// *Note* that if [preferCurrencyPrecision] is set to `true` field
  /// [precision] is omitted, otherwise either [precision] or [amount.precision]
  /// will be used.
  factory Money.fromAmount(
    Amount amount,
    FiatCurrency currency, {
    int? precision,
    bool preferCurrencyPrecision = false,
  }) {
    if (precision != null && precision < 0) {
      throw const NegativePrecisionException();
    }

    if (preferCurrencyPrecision) {
      return Money.fromDecimal(
        amount.toDecimal(),
        currency,
        precision: currency.precision,
      );
    }

    final adjustedPrecision = precision ?? amount.precision;
    return Money.fromDecimal(
      amount.toDecimal(),
      currency,
      precision: adjustedPrecision,
    );
  }

  /// Amount with `0` as numerator with secific [currency] and optionally
  /// [precision].
  factory Money.zeroOf(FiatCurrency currency, {int? precision}) =>
      Money.fromCents(0, currency, precision: precision);

  /// Amount with `1` as numerator with secific [currency] and optionally
  /// [precision].
  factory Money.oneOf(FiatCurrency currency, {int? precision}) =>
      Money.fromCents(1, currency, precision: precision);

  /// Amount with `1` as integer with secific [currency] and optionally
  /// [precision].
  factory Money.oneIntOf(FiatCurrency currency, {int? precision}) =>
      Money.fromInt(1, currency, precision: precision);

  /// Amount with `0` as numerator with [FiatCurrency.$default] and default
  /// precision from currency.
  static final zero = Money.fromCents(0, FiatCurrency.$default);

  /// Amount with `1` as numerator with [FiatCurrency.$default] and default
  /// precision from currency.
  static final one = Money.fromCents(1, FiatCurrency.$default);

  /// Amount with `1` as integer with [FiatCurrency.$default] and default
  /// precision from currency.
  static final oneInt = Money.fromInt(1, FiatCurrency.$default);

  static int _precisionModifier(int precision) =>
      math.pow(10, precision).toInt();

  /// Current amount in cents.
  ///
  /// It is equals to [value].
  BigInt get cents => value;

  /// Currency of the [cents]/amount.
  final FiatCurrency currency;

  /// Precision to use with this amount.
  ///
  /// If not specified explicitly, defaults to [currency.precision].
  ///
  /// *Please note* that precision cannot be negative, if so -
  /// [NegativePrecisionException] will be thrown.
  @override
  int get precision => super.precision;

  /// Whether this money is equals to zero or not.
  @override
  bool get isZero => this == Money.zeroOf(currency, precision: precision);

  /// Whether this money is greater than zero or not.
  @override
  bool get isGreaterThanZero =>
      this > Money.zeroOf(currency, precision: precision);

  /// Whether this money is greater than or equals to zero or not.
  @override
  bool get isGreaterThanOrEqualZero =>
      this >= Money.zeroOf(currency, precision: precision);

  /// Whether this money is less than zero or not.
  @override
  bool get isLessThanZero =>
      this < Money.zeroOf(currency, precision: precision);

  /// Whether this money is less than or equals to zero or not.
  @override
  bool get isLessThanOrEqualZero =>
      this <= Money.zeroOf(currency, precision: precision);

  @override
  Money abs() {
    if (cents.isNegative) {
      return Money._(cents.abs(), currency, precision: precision);
    }

    return this;
  }

  @override
  Money round() {
    return Money.fromDouble(
      toDouble().roundToDouble(),
      currency,
      precision: precision,
    );
  }

  @override
  Money ceil() {
    if (fractional == BigInt.zero) {
      return this;
    }

    final addition = isPositive ? BigInt.one : BigInt.zero;

    return Money._(
      (integer + addition) * BigInt.from(_precisionModifier(precision)),
      currency,
      precision: precision,
    );
  }

  @override
  Money floor() {
    if (fractional == BigInt.zero) {
      return this;
    }

    final substraction = isPositive ? BigInt.zero : BigInt.one;

    return Money._(
      (integer - substraction) * BigInt.from(_precisionModifier(precision)),
      currency,
      precision: precision,
    );
  }

  @override
  Money operator -() => Money._(-cents, currency, precision: precision);

  @override
  Money operator +(covariant Money other) {
    if (currency != other.currency) {
      throw const CurrencyMismatchException();
    }

    return Money.fromDecimal(
      toDecimal() + other.toDecimal(),
      currency,
      precision: precision,
    );
  }

  @override
  Money operator -(covariant Money other) {
    if (currency != other.currency) {
      throw const CurrencyMismatchException();
    }

    return Money.fromDecimal(
      toDecimal() - other.toDecimal(),
      currency,
      precision: precision,
    );
  }

  @override
  Money operator *(Amount multiplier) {
    final amount = toAmount() * multiplier;

    return Money._(amount.value, currency, precision: precision);
  }

  @override
  Money operator /(Amount divider) {
    final amount = toAmount() / divider;

    return Money._(amount.value, currency, precision: precision);
  }

  @override
  bool operator <(covariant Money other) {
    if (currency != other.currency) {
      throw const CurrencyMismatchException();
    }

    return toDecimal() < other.toDecimal();
  }

  @override
  bool operator <=(covariant Money other) {
    if (currency != other.currency) {
      throw const CurrencyMismatchException();
    }

    return toDecimal() <= other.toDecimal();
  }

  @override
  bool operator >(covariant Money other) {
    if (currency != other.currency) {
      throw const CurrencyMismatchException();
    }

    return toDecimal() > other.toDecimal();
  }

  @override
  bool operator >=(covariant Money other) {
    if (currency != other.currency) {
      throw const CurrencyMismatchException();
    }

    return toDecimal() >= other.toDecimal();
  }

  @override
  bool operator ==(covariant Money other) {
    if (identical(this, other)) {
      return true;
    }

    return runtimeType == other.runtimeType &&
        cents == other.cents &&
        currency == other.currency &&
        precision == other.precision;
  }

  @override
  int get hashCode => super.hashCode ^ currency.hashCode;

  @override
  int compareTo(covariant Money other) {
    if (currency != other.currency) {
      throw const CurrencyMismatchException();
    }

    return super.compareTo(other);
  }

  /// Gets [Amount] representation of the current amount, truncating any
  /// currency-related part.
  Amount toAmount() => Amount(value, precision: precision);

  /// Gets formatted string representation of the current amount, based on the:
  /// - [CurrencyPosition];
  /// - [FiatCurrencyFormat];
  /// - [MoneyFormat];
  /// - [RankFormat];
  /// - [DecimalSeparatorFormat].
  ///
  /// Defaults are [FiatCurrencyFormat.icon] and [AmountFormat.fixedDouble].
  @override
  String toString({
    CurrencyPosition currencyPosition = CurrencyPosition.end,
    FiatCurrencyFormat currencyFormat = FiatCurrencyFormat.icon,
    AmountFormat amountFormat = AmountFormat.fixedDouble,
    RankFormat rankFormat = RankFormat.space,
    DecimalSeparatorFormat decimalSeparatorFormat =
        DecimalSeparatorFormat.point,
  }) {
    final moneyFmt = super.toString(
      amountFormat: amountFormat,
      rankFormat: rankFormat,
      decimalSeparatorFormat: decimalSeparatorFormat,
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
