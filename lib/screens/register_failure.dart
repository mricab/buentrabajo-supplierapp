import 'package:flutter/material.dart';
import 'package:supplierapp/ui/specialUI.dart';
import 'package:supplierapp/screens/login.dart';

class RegisterFailure extends StatefulWidget {
  @override
  _RegisterFailureState createState() => _RegisterFailureState();
}

class _RegisterFailureState extends State<RegisterFailure> {
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
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  specialTitle('Algo salio mal'),
                  SizedBox(
                    height: 15,
                  ),
                  specialEmoticon('🤕'),
                  SizedBox(
                    height: 10,
                  ),
                  specialMessage(
                      'Puede haber existido un problema en el servidor o durante el envío de su solicitud. Le rogamos intente solicitar su registro nuevamente.'),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
