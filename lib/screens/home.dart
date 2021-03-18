import 'package:flutter/material.dart';
import 'package:supplierapp/logic/login_logic.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                logout(context);
              })
        ],
      ),
      body: Center(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: '1'),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: '1'),
        ],
      ),
    );
  }
}
