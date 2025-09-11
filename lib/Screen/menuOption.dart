import 'package:flutter/material.dart';
import 'suma.dart';
import 'calculadora.dart';

class menuOptions extends StatefulWidget {
  const menuOptions({super.key});

  @override
  State<menuOptions> createState() => _menuOptionsState();
}

class _menuOptionsState extends State<menuOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          'Arithemetic si in login',
          style: TextStyle(color: Colors.green[200]),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          SizedBox(height: 12),
          Image.network('htps://picsum.photos/330/200'),
          SizedBox(height: 12),
          Card(
            child: ListTile(
              title: Text('suma'),
              leading: Icon(Icons.add),
              trailing: Icon(Icons.arrow_circle_right_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Suma()),
                );
              },
            ),
          ),
          SizedBox(height: 12),
          Card(
            child: ListTile(
              title: Text('calculadora'),
              leading: Icon(Icons.add),
              trailing: Icon(Icons.arrow_circle_right_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Calculadora()),
                );
              },
            ),
          ),
          SizedBox(height: 12),
          Card(
            child: ListTile(
              title: Text('registro'),
              leading: Icon(Icons.add),
              trailing: Icon(Icons.arrow_circle_right_rounded),
              onTap: () {},
            ),
          ),
          SizedBox(height: 12),
          Card(
            child: ListTile(
              title: Text('login'),
              leading: Icon(Icons.add),
              trailing: Icon(Icons.arrow_circle_right_rounded),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
