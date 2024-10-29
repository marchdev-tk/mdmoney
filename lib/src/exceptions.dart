// Copyright (c) 2024, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:mdamount/mdamount.dart';

sealed class MoneyException implements AmountException {}

class NoCurrencyException implements MoneyException {
  const NoCurrencyException();

  String get message => 'No currency was provided or it is unknown!';
}

class CurrencyMismatchException implements MoneyException {
  const CurrencyMismatchException();

  String get message => 'Currencies of both operands must be equal!';
}
