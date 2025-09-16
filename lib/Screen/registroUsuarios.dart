import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class registroUsuario extends StatefulWidget {
  const registroUsuario({super.key});

  @override
  State<registroUsuario> createState() => _registroUsuarioState();
}

// ignore: camel_case_types
class _registroUsuarioState extends State<registroUsuario> {
  TextEditingController _correoController = TextEditingController();
  TextEditingController _paswordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  // metodo chared refence

  Future<void> saveUser(String correo, String password) async {
    final preferens = await SharedPreferences.getInstance();
    await preferens.setString('userCorreo', correo);
    await preferens.setString('userPasword', password);

    //mensaje

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('datos guardados dentro de shared prefences')),
    );
  }

  // metodo para registar usuario

  // metodo se ejecuta al precionar boton registrar

  void _pressedRegisterUser() {
    if (_formkey.currentState!.validate()) {
      saveUser(_correoController.text.trim(), _paswordController.text.trim());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('la validacion fallo. revisar los campos ')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro usuario'),
        backgroundColor: Colors.deepOrange[400],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Form(
              key: _formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network('https://picsum.photos/200/100'),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nombres',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Debes ingresar tu nombre';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _correoController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Debes ingresar tu email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _paswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Debes ingresar tu contraseña';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _pressedRegisterUser,
                    child: Text('Registrar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
