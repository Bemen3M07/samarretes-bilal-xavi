import 'package:flutter_test/flutter_test.dart';
import '../lib/samarretes_calculator.dart';

void main() {
  group('SamarretesCalculator', () {
    test('calculaPreuSamarretes - preu sense descompte', () {
      expect(SamarretesCalculator.calculaPreuSamarretes(10, 'small'), 79.0);
      expect(SamarretesCalculator.calculaPreuSamarretes(10, 'medium'), 83.0);
      expect(SamarretesCalculator.calculaPreuSamarretes(10, 'large'), 127.0);
    });

    test('calculaDescompte - sense descompte', () {
      expect(SamarretesCalculator.calculaDescompte(100.0, 'sense'), 0.0);
    });

    test('calculaDescompte - descompte 10%', () {
      expect(SamarretesCalculator.calculaDescompte(100.0, '10%'), 10.0);
    });

    test('calculaDescompte - descompte 20€ (aplicable)', () {
      expect(SamarretesCalculator.calculaDescompte(120.0, '20€'), 20.0);
    });

    test('calculaDescompte - descompte 20€ (no aplicable)', () {
      expect(SamarretesCalculator.calculaDescompte(80.0, '20€'), 0.0);
    });

    test('preuDefinitiu - combina preu i descompte', () {
      // Sense descompte
      expect(SamarretesCalculator.preuDefinitiu(10, 'small', 'sense'), 79.0);

      // Amb 10% de descompte
      expect(SamarretesCalculator.preuDefinitiu(10, 'small', '10%'), 71.1);

      // Amb descompte de 20€
      expect(SamarretesCalculator.preuDefinitiu(10, 'large', '20€'), 107.0);

      // Sense descompte perquè no supera 100€
      expect(SamarretesCalculator.preuDefinitiu(5, 'small', '20€'), 39.5);
    });
  });
}
