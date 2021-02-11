import 'package:flutter/material.dart';
import 'package:supplierapp/ui/specialUI.dart';
import 'package:supplierapp/screens/register_instructions.dart';
import 'package:supplierapp/screens/login.dart';

class RegisterServices extends StatefulWidget {
  @override
  _RegisterServicesState createState() => _RegisterServicesState();
}

class _RegisterServicesState extends State<RegisterServices> {
  @override
  Widget build(BuildContext context) {
    final _regSerKey = GlobalKey<FormState>();
    final _lft = TextAlign.left;
    final _nextRoute =
        new MaterialPageRoute(builder: (context) => RegisterInstructions());
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
              padding: EdgeInsets.fromLTRB(50, 80, 50, 80),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 1),
                    specialTitle('Registro'),
                    SizedBox(
                      height: 15,
                    ),
                    specialSubtitle('Paso 4: Primer Servicio'),
                    Spacer(flex: 1),
                    Form(
                        key: _regSerKey,
                        child: Column(
                          children: [
                            specialDropdown('Tipo de Servicio*', <String>[
                              'Mantenimiento',
                              'Instalación',
                              'Asesoramiento',
                            ]),
                            specialTextFormField(
                                'Nombre del Servicio (Falta en BD)', _lft),
                            specialMultiLineTextFormField(
                                'Descripción', _lft, 3, 4),
                            specialNumericFormField('Precio', _lft),
                            SizedBox(
                              height: 30,
                            ),
                            specialButton('Enviar', () {
                              validateServices(context, _nextRoute);
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

void validateServices(BuildContext context, MaterialPageRoute route) {
  Navigator.push(context, route);
}