import 'package:flutter/material.dart';
import 'package:supplierapp/ui/specialUI.dart';
import 'package:supplierapp/screens/login.dart';

class RegisterInstructions extends StatefulWidget {
  @override
  _RegisterInstructionsState createState() => _RegisterInstructionsState();
}

class _RegisterInstructionsState extends State<RegisterInstructions> {
  final _loginRoute = new MaterialPageRoute(builder: (context) => Login());
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: specialBackground(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: specialAppBar([
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 50, 0),
              child: specialInkWell('Cerrar', 14, context, _loginRoute),
            )
          ]),
          body: Center(
            child: Text('Instrucciones'),
          ),
        ));
  }
}
