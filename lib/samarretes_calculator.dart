class SamarretesCalculator {
  static double calculaPreuSamarretes(int numero, String talla) {
    switch (talla) {
      case 'Small':
        return numero * 7.99;
      case 'Medium':
        return numero * 9.95;
      case 'Large':
        return numero * 13.50;
      default:
        return 0;
    }
  }

  static double calculaDescompte(double preu, int tipusDescompte) {
    switch (tipusDescompte) {
      case 1:
        return preu * 0.1;
      case 2:
        return preu > 100 ? 20 : 0;
      default:
        return 0;
    }
  }

  static double preuDefinitiu(int numero, String talla, int descompte) {
    double preu = calculaPreuSamarretes(numero, talla);
    double descompteAplicat = calculaDescompte(preu, descompte);
    return preu - descompteAplicat;
  }
}