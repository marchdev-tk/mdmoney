# Changelog

## 1.1.7

* Updated `mdamount` dependency.

## 1.1.6

* Updated `mdamount` dependency.

## 1.1.5

* Updated `mdamount` dependency.

## 1.1.4

* Updated `mdamount` dependency.
* Updated tests.

## 1.1.3

* Added to `Money.toString` precision.
* Updated tests.

## 1.1.2

* Fixed several getters:
  * `isZero`
  * `isGreaterThanZero`
  * `isGreaterThanOrEqualZero`
  * `isLessThanZero`
  * `isLessThanOrEqualZero`

## 1.1.1

* Updated tests.

## 1.1.0

* Extended `Money` from `Amount` (`mdamount` package).
* Added new construction options:
  * `Money.fromBigInt`
  * `Money.fromInt`
  * `Money.fromAmount`
  * `Money.oneIntOf`
  * `Money.oneInt`
* Added `Money.toAmount` conversion method.
* Updated tests.

## 1.0.1

* Changed `FiatCurrency.$default` from field to getter, to avoid unwanted behaviour. 

## 1.0.0

* Added fully functional and totally tested `Money`.
