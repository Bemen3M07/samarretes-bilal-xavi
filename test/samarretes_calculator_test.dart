import 'package:flutter_test/flutter_test.dart';
import '../lib/samarretes_calculator.dart'; // Ajusta la ruta según la ubicación real del archivo

void main() {
  group('Calcula preu samarretes', () {
    test('Calcula preu sense descompte', () {
      expect(SamarretesCalculator.calculaPreuSamarretes(5, 'Small'), equals(5 * 7.99));
      expect(SamarretesCalculator.calculaPreuSamarretes(3, 'Medium'), equals(3 * 9.95));
      expect(SamarretesCalculator.calculaPreuSamarretes(2, 'Large'), equals(2 * 13.50));
    });
  });

  group('Calcula descompte', () {
    test('Descompte del 10%', () {
      expect(SamarretesCalculator.calculaDescompte(100, 1), equals(10));
    });

    test('Descompte de 20€ per comandes majors de 100€', () {
      expect(SamarretesCalculator.calculaDescompte(120, 2), equals(20));
      expect(SamarretesCalculator.calculaDescompte(90, 2), equals(0));
    });

    test('Sense descompte', () {
      expect(SamarretesCalculator.calculaDescompte(100, 0), equals(0));
    });
  });

  group('Calcula preu definitiu', () {
    test('Preu definitiu sense descompte', () {
      expect(SamarretesCalculator.preuDefinitiu(5, 'Small', 0), equals(5 * 7.99));
    });

    test('Preu definitiu amb descompte del 10%', () {
      expect(SamarretesCalculator.preuDefinitiu(5, 'Small', 1), equals(5 * 7.99 * 0.9));
    });

    test('Preu definitiu amb descompte de 20€', () {
      expect(SamarretesCalculator.preuDefinitiu(10, 'Large', 2), equals(10 * 13.50 - 20));
    });
  });
}
