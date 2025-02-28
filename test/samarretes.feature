Feature: Calculadora de Samarretes
    Com a usuari,
    vull calcular el preu final de la meva comanda de samarretes en funció del nombre, la talla i el tipus de descompte,
    perquè pugui saber quant he de pagar.

    Scenario: Calcular preu sense descompte
        Given he introduït "5" en el camp "Nombre de samarretes"
        And he seleccionat la talla "Small"
        And he seleccionat "Cap descompte" com a opció de descompte
        When es realitza el càlcul
        Then hauria de mostrar-se el preu final com "39.95 €"

    Scenario: Calcular preu amb descompte del 10%
        Given he introduït "5" en el camp "Nombre de samarretes"
        And he seleccionat la talla "Small"
        And he seleccionat "10% de descompte" com a opció de descompte
        When es realitza el càlcul
        Then hauria de mostrar-se el preu final com "35.96 €"

    Scenario: Calcular preu amb descompte de 20€ per comandes majors de 100€
        Given he introduït "10" en el camp "Nombre de samarretes"
        And he seleccionat la talla "Large"
        And he seleccionat "20€ per comandes majors de 100€" com a opció de descompte
        When es realitza el càlcul
        Then hauria de mostrar-se el preu final com "115.00 €"

    Scenario: Calcular preu amb descompte de 20€ no aplicable
        Given he introduït "3" en el camp "Nombre de samarretes"
        And he seleccionat la talla "Medium"
        And he seleccionat "20€ per comandes majors de 100€" com a opció de descompte
        When es realitza el càlcul
        Then hauria de mostrar-se el preu final com "29.85 €"

    Scenario: Gestió d'entrada no numèrica
        Given he introduït "abc" en el camp "Nombre de samarretes"
        And he seleccionat la talla "Medium"
        And he seleccionat "Cap descompte" com a opció de descompte
        When es realitza el càlcul
        Then hauria de mostrar-se el preu final com "0.00 €"
