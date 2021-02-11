import 'package:flutter/material.dart';
import 'package:supplierapp/ui/specialUI.dart';
import 'package:supplierapp/screens/register_services.dart';
import 'package:supplierapp/screens/login.dart';

class RegisterProfessional extends StatefulWidget {
  @override
  _RegisterProfessionalState createState() => _RegisterProfessionalState();
}

class _RegisterProfessionalState extends State<RegisterProfessional> {
  @override
  Widget build(BuildContext context) {
    final _regProKey = GlobalKey<FormState>();
    final _lft = TextAlign.left;
    final _nextRoute =
        new MaterialPageRoute(builder: (context) => RegisterServices());
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
                    specialSubtitle('Paso 3: Datos Profesionales'),
                    Spacer(flex: 1),
                    Form(
                        key: _regProKey,
                        child: Column(
                          children: [
                            specialDropdown('Profesión', <String>[
                              'Carpintero',
                              'Cerrajero',
                              'Albañil',
                              'Plomero',
                              'Técnico de Aire Acondicionado',
                            ]),
                            specialMultiLineTextFormField(
                                'Experiencia', _lft, 4, 5),
                            specialTextFormField('Dirección Laboral', _lft),
                            specialTextFormField('Localización*', _lft),
                            SizedBox(
                              height: 30,
                            ),
                            specialButton('Siguiente', () {
                              validateProfessional(context, _nextRoute);
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

void validateProfessional(BuildContext context, MaterialPageRoute route) {
  Navigator.push(context, route);
}
