import 'package:flutter/material.dart';
import 'menuOption.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  double _resultado = 0.0;
  String _operacion = '';

  void _calcular(String operacion) {
    if (_formKey.currentState?.validate() ?? false) {
      double num1 = double.tryParse(_num1Controller.text) ?? 0.0;
      double num2 = double.tryParse(_num2Controller.text) ?? 0.0;

      setState(() {
        switch (operacion) {
          case '+':
            _resultado = num1 + num2;
            break;
          case '-':
            _resultado = num1 - num2;
            break;
          case '×':
            _resultado = num1 * num2;
            break;
          case '÷':
            _resultado = num2 != 0 ? num1 / num2 : double.nan;
            break;
        }
        _operacion = operacion;
      });
    }
  }

  void _limpiar() {
    setState(() {
      _num1Controller.clear();
      _num2Controller.clear();
      _resultado = 0.0;
      _operacion = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        foregroundColor: Colors.white,
        title: Text('Calculadora'),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => menuOptions()),
            );
          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Digite los números',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Arial Narrow',
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[200],
                ),
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _num1Controller,
                decoration: InputDecoration(
                  labelText: 'Digite primer número',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un número';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Por favor ingrese un número válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _num2Controller,
                decoration: InputDecoration(
                  labelText: 'Digite segundo número',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un número';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Por favor ingrese un número válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => _calcular(''),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[300],
                      foregroundColor: Colors.white,
                    ),
                    child: Text('+', style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: () => _calcular('-'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[300],
                      foregroundColor: Colors.white,
                    ),
                    child: Text('-', style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: () => _calcular('+'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[300],
                      foregroundColor: Colors.white,
                    ),
                    child: Text('×', style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: () => _calcular('÷'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[300],
                      foregroundColor: Colors.white,
                    ),
                    child: Text('÷', style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: _limpiar,
                    child: Container(child: Text('C')),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Resultado $_operacion: $_resultado',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
