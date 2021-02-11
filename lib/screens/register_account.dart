import 'package:flutter/material.dart';
import 'package:supplierapp/ui/specialUI.dart';
import 'package:supplierapp/screens/register_personal.dart';
import 'package:supplierapp/screens/login.dart';

class RegisterAccount extends StatefulWidget {
  @override
  _RegisterAccountState createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount> {
  @override
  Widget build(BuildContext context) {
    final _regAccKey = GlobalKey<FormState>();
    final _lft = TextAlign.left;
    final _nextRoute =
        new MaterialPageRoute(builder: (context) => RegisterPersonal());
    final _loginRoute = new MaterialPageRoute(builder: (context) => Login());

    return Container(
        decoration: specialBackground(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: specialAppBar([
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 50, 0),
              child: specialInkWell('Cancelar', 14, context, _loginRoute),
            )
          ]),
          body: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 80),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 1),
                    specialTitle('Registro'),
                    SizedBox(
                      height: 15,
                    ),
                    specialSubtitle('Paso 1: Crear una cuenta'),
                    Spacer(flex: 1),
                    Form(
                        key: _regAccKey,
                        child: Column(
                          children: [
                            specialTextFormField('Avatar', _lft),
                            specialTextFormField('Nombre', _lft),
                            specialTextFormField('Primer Apellido', _lft),
                            specialTextFormField('Segundo Apellido', _lft),
                            specialTextFormField('Email', _lft),
                            specialPasswordFormField('Password', _lft),
                            specialPasswordFormField('Repetir Password', _lft),
                            SizedBox(
                              height: 30,
                            ),
                            specialButton('Siguiente', () {
                              validateAccount(context, _nextRoute);
                            }),
                          ],
                        )),
                    Spacer(flex: 1),
                  ]),
            ),
          ),
        ));
  }
}

void validateAccount(BuildContext context, MaterialPageRoute route) {
  Navigator.push(context, route);
}
