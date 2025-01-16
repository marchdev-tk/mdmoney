# mdmoney

![Build](https://github.com/marchdev-tk/mdmoney/workflows/build/badge.svg)
[![codecov](https://codecov.io/gh/marchdev-tk/mdmoney/branch/master/graph/badge.svg)](https://codecov.io/gh/marchdev-tk/mdmoney)
[![Pub](https://img.shields.io/pub/v/mdmoney.svg)](https://pub.dartlang.org/packages/mdmoney)
![GitHub](https://img.shields.io/github/license/marchdev-tk/mdmoney)
![GitHub stars](https://img.shields.io/github/stars/marchdev-tk/mdmoney?style=social)

march.dev money library. Provides a new way to work with a money. From highly flexible creation to rich data manipulation and stringification options.

## Getting Started

To begin your work with a money object you need to create it, there are several ways to do it:

  * `Money.fromCents` with following args:
    * `cents`
    * `currency`
    * custom `precision`, if not provided - `currency.precision` will be used instead
  * `Money.fromBigInt` with following args:
    * `BigInt` amount
    * `currency`
    * custom `precision`, if not provided - `currency.precision` will be used instead
  * `Money.fromInt` with following args:
    * `int` amount
    * `currency`
    * custom `precision`, if not provided - `currency.precision` will be used instead
  * `Money.fromDecimal` with following args:
    * `Decimal` amount (from `decimal` package)
    * `currency`
    * custom `precision`, if not provided - `currency.precision` will be used instead
  * `Money.fromDouble` with following args:
    * `double` amount
    * `currency`
    * custom `precision`, if not provided - `currency.precision` will be used instead
  * `Money.fromString` with following args:
    * `String`
    * `currency`, if not specified in a `String`
    * custom `precision`, if not provided - `currency.precision` will be used instead
  * `Money.fromAmount` with following args:
    * `Amount` amount
    * `currency`
    * custom `precision`, if not provided - `amount.precision` will be used instead
    * `preferCurrencyPrecision`, if set to `true` field `precision` is omitted, otherwise either `precision` or `amount.precision` will be used.

Also there are some convenient ways to create an object:

  * `Money.zeroOf` to create the amount with `0` as numerator with following args:
    * `currency`
    * custom `precision`, if not provided - `currency.precision` will be used instead
  * `Money.oneOf` to create the amount with `1` as numerator with following args:
    * `currency`
    * custom `precision`, if not provided - `currency.precision` will be used instead
  * `Money.oneIntOf` to create the amount with `1` as integer with following args:
    * `currency`
    * custom `precision`, if not provided - `currency.precision` will be used instead
  * `Money.zero` to create the amount with `0` as numerator in default currency (`FiatCurrency.$default`)
  * `Money.one` to create the amount with `1` as numerator in default currency (`FiatCurrency.$default`)
  * `Money.oneInt` to create the amount with `1` as integer in default currency (`FiatCurrency.$default`)

First of all, `Money` object is `comparable` and has all required operators:
  * unary `operator -`
  * binary `operator -`
  * `operator +`
  * `operator *`
  * `operator /`
  * `operator <`
  * `operator <=`
  * `operator >`
  * `operator >=`
  * `operator ==`

Regarding what you can do with this object, let's break down following methods/getters/fields:
  
  * `cents` - returns the `BigInt` `cents` representation of the amount 
  * `currency` - returns the `currency` of the amount
  * `precision` - returns the `precision` of the amount (quantity of digits in fractional part)
  * `sign` - returns the `sign` of the amount
  * `isEven` - whether the amount is `even` or not
  * `isOdd` - whether the amount is `odd` or not
  * `isNegative` - whether the amount is `negative` or not
  * `isPositive` - whether the amount is `positive` or not
  * `isZero` - whether the amount is equals to `zero` or not
  * `isGreaterThanZero` - whether the amount is greater than `zero` or not
  * `isGreaterThanOrEqualZero` - whether the amount is greater than or equals to `zero` or not
  * `isLessThanZero` - whether the amount is less than `zero` or not
  * `isLessThanOrEqualZero` - whether the amount is less than or equals to `zero` or not
  * `integer` - returns the `integer` part of the amount
  * `fractional` - returns the `fractional` part of the amount in `BigInt` cents
  * `fractionalDecimal` - returns the `fractional` part of the amount in `Decimal`
  * `fractionalDouble` - returns the `fractional` part of the amount in `double`
  * `abs` - returns the `absolute` (always positive) amount
  * `round` - returns the `rounded` amount
  * `ceil` - returns the `ceiled` amount (rounded to the next integer)
  * `floor` - returns the `floored` amount (truncating fractional part of the amount)
  * `toDecimal` - returns the amount in `Decimal`
  * `toDouble` - returns the amount in `double`
  * `toAmount` - returns the amount in `Amount`
  * `toString` - return the `String` representation of the amount with lots of customisation options, they are:
    * `DecimalSeparatorFormat` - specifies which decimal separator to use:
      * `point`
      * `comma` 
    * `RankFormat` - specifies rank formatting:
      * `none` (`XXXX`)
      * `space` (`X XXX`)
    * `AmountFormat` - specifies amount display formatting:
      * `integer` - only integer part (`XXXX`)
      * `flexibleDouble` - fractional parts will not display trailing zeros (`XXXX`/`XXXX.X`/`XXXX.XX`)
      * `fixedDouble` - fractional parts will display full precision, even zeros (`XXXX.XX`)
    * `FiatCurrencyFormat` - specifies how currency should be displayed:
      * `none`
      * `code` (`USD`/`EUR`/`UAH`/etc.)
      * `icon` (`$`/`€`/`₴`/etc.)
    * `CurrencyPosition` - specifies where currency should be:
      * `start`
      * `startSpaced`
      * `end`
      * `endSpaced`
      * `decimalSeparator`
    * `precision` - if set, this method will behave differently based on `AmountFormat`:
      * `integer` - `precision` is omitted
      * `fixedDouble` - `precision` will be used as an override to `Amount.precision`
      * `flexibleDouble` - `precision` will be used only if length of fractionals will be less than `precision`

## Examples

To see usage example navigate to the [Example](example/README.md) section.

## Feature requests and Bug reports

Feel free to post a feature requests or report a bug [here](https://github.com/marchdev-tk/mdmoney/issues).
