import 'package:flutter/material.dart';
import 'menuOption.dart';

class Suma extends StatefulWidget {
  const Suma({super.key});

  @override
  State<Suma> createState() => _SumaState();
}

class _SumaState extends State<Suma> {
  //definicion de la logica
  final TextEditingController _number1Controller = TextEditingController();
  final TextEditingController _number2Controller = TextEditingController();
  double _resultado = 0.0;

  //clave para trabajr el for,ulario
  final _formKey = GlobalKey<FormState>();

  void _calculateAdd() {
    if (_formKey.currentState?.validate() ?? false) {
      double numero1 = double.tryParse(_number1Controller.text) ?? 0.0;
      double numero2 = double.tryParse(_number2Controller.text) ?? 0.0;
      setState(() {
        _resultado = numero1 + numero2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        foregroundColor: Colors.white,
        title: Text('sumar'),
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
          key: _formKey, //agregar la vaiable clave del formulario
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'digite los numeros',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'arial narrow',
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[200],
                ),
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _number1Controller,
                decoration: InputDecoration(
                  labelText: 'digite primer numero',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un numero';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Por favor ingrese un numero valido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _number2Controller,
                decoration: InputDecoration(
                  labelText: 'digite segundo numero',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un numero';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Por favor ingrese un numero valido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  _calculateAdd();
                },
                child: Text('calcular:', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[300],
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'resultado: $_resultado',
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
