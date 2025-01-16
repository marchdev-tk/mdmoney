// Copyright (c) 2025, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:mdmoney/mdmoney.dart';

/// Describes possible [FiatCurrency] formatting options.
enum FiatCurrencyFormat implements AmountFormatterInteface<FiatCurrency> {
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
