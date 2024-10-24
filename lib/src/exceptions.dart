import 'package:meta/meta.dart';

@sealed
abstract class MoneyException implements Exception {}

class NoCurrencyException implements MoneyException {
  const NoCurrencyException();

  String get message => 'No currency was provided or it is unknown!';
}

class CurrencyMismatchException implements MoneyException {
  const CurrencyMismatchException();

  String get message => 'Currencies of both operands must be equal!';
}

class NotANumberException implements MoneyException {
  const NotANumberException();

  String get message => 'Zero money amount can not be divided by zero!';
}

class InfiniteNumberException implements MoneyException {
  const InfiniteNumberException();

  String get message => 'Money amount must be finite!';
}

class NegativePrecisionException implements MoneyException {
  const NegativePrecisionException();

  String get message => 'Precision must be greater than or equals to zero!';
}
