import 'package:flutter/material.dart';
import 'package:supplierapp/ui/specialUI.dart';
import 'package:supplierapp/screens/register_professional.dart';
import 'package:supplierapp/screens/login.dart';

class RegisterPersonal extends StatefulWidget {
  @override
  _RegisterPersonalState createState() => _RegisterPersonalState();
}

class _RegisterPersonalState extends State<RegisterPersonal> {
  @override
  Widget build(BuildContext context) {
    final _regPerKey = GlobalKey<FormState>();
    final _lft = TextAlign.left;
    final _nextRoute =
        new MaterialPageRoute(builder: (context) => RegisterProfessional());
    final _loginRoute = new MaterialPageRoute(builder: (context) => Login());

    var now = DateTime.now();
    var iDate = now.subtract(new Duration(days: 10950)); //30*365=10950
    var fDate = now.subtract(new Duration(days: 32850)); //90*365=32850
    var lDate = now.subtract(new Duration(days: 6750)); //18*365=6750

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
                    specialSubtitle('Paso 2: Datos Personales'),
                    Spacer(flex: 1),
                    Form(
                        key: _regPerKey,
                        child: Column(
                          children: [
                            specialDatePicker('Fecha de Nacimiento', iDate,
                                fDate, lDate, context),
                            specialTextFormField(
                                'Dirección de Domicilio', _lft),
                            specialTextFormField('Ciudad de Residencia', _lft),
                            specialNumericFormField('Teléfono', _lft),
                            specialTextFormField('Doc. de Identidad', _lft),
                            specialDropdown('Tipo Doc. de Identidad', <String>[
                              'Carnet',
                              'Pasaporte',
                              'Tarj. Residencia'
                            ]),
                            SizedBox(
                              height: 30,
                            ),
                            specialButton('Siguiente', () {
                              validatePersonal(context, _nextRoute);
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

void validatePersonal(BuildContext context, MaterialPageRoute route) {
  Navigator.push(context, route);
}
