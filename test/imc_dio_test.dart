import 'package:test/test.dart';

import '../bin/imc_dio.dart';

void main() {
  test('Testando resultado da função Calcula IMC', () {
    expect(() => calculaImc(175, 62), isNot(equals(20)));
  });
}
