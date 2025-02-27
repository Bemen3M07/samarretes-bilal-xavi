import 'package:flutter/material.dart';
import 'samarretes_calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Calculadora de Samarretes')),
        body: SamarretesCalculatorUI(),
      ),
    );
  }
}

class SamarretesCalculatorUI extends StatefulWidget {
  @override
  _SamarretesCalculatorUIState createState() => _SamarretesCalculatorUIState();
}

class _SamarretesCalculatorUIState extends State<SamarretesCalculatorUI> {
  int _numShirts = 0;
  String _selectedSize = 'Small';
  int _selectedDiscount = 0;
  double _finalPrice = 0;

  void _calculatePrice() {
    setState(() {
      _finalPrice = SamarretesCalculator.preuDefinitiu(_numShirts, _selectedSize, _selectedDiscount);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Nombre de samarretes'),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                _numShirts = int.tryParse(value) ?? 0;
                _calculatePrice();
              });
            },
          ),
          Row(
            children: [
              Radio(
                value: 'Small',
                groupValue: _selectedSize,
                onChanged: (value) {
                  setState(() {
                    _selectedSize = value.toString();
                    _calculatePrice();
                  });
                },
              ),
              Text('Small (7.99€)'),
              Radio(
                value: 'Medium',
                groupValue: _selectedSize,
                onChanged: (value) {
                  setState(() {
                    _selectedSize = value.toString();
                    _calculatePrice();
                  });
                },
              ),
              Text('Medium (9.95€)'),
              Radio(
                value: 'Large',
                groupValue: _selectedSize,
                onChanged: (value) {
                  setState(() {
                    _selectedSize = value.toString();
                    _calculatePrice();
                  });
                },
              ),
              Text('Large (13.50€)'),
            ],
          ),
          DropdownButton<int>(
            value: _selectedDiscount,
            items: [
              DropdownMenuItem(child: Text('Cap descompte'), value: 0),
              DropdownMenuItem(child: Text('10% de descompte'), value: 1),
              DropdownMenuItem(child: Text('20€ per comandes majors de 100€'), value: 2),
            ],
            onChanged: (value) {
              setState(() {
                _selectedDiscount = value ?? 0;
                _calculatePrice();
              });
            },
          ),
          SizedBox(height: 20),
          Text(
            'Preu final: ${_finalPrice.toStringAsFixed(2)} €',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}