import 'package:flutter/material.dart';
import 'package:supplierapp/logic/register_logic.dart';
import 'package:supplierapp/ui/specialUI.dart';
import 'package:supplierapp/screens/register_services.dart';
import 'package:supplierapp/screens/login.dart';
import 'package:supplierapp/models/newsupplier.dart';
import 'package:supplierapp/widgets/locationPickerField.dart';

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

    //Form Fields Controllers
    final profession = TextEditingController();
    final experience = TextEditingController();
    final work_address = TextEditingController();
    final work_latitude = TextEditingController();
    final work_longitude = TextEditingController();

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
                            specialLocationField(context, validateLocation,
                                work_longitude, work_longitude),
                            specialTextFormField('Dirección laboral', _lft,
                                validateAddress, work_address),
                            specialDropdown(
                                'Profesión',
                                <String>[
                                  'Carpintero',
                                  'Cerrajero',
                                  'Albañil',
                                  'Plomero',
                                  'Técnico de Aire Acondicionado',
                                ],
                                validateProfession,
                                profession),
                            specialMultiLineTextFormField('Experiencia', _lft,
                                4, 5, validateExperience, experience),
                            SizedBox(
                              height: 30,
                            ),
                            specialButton('Siguiente', () {
                              print(work_latitude.text);
                              print(work_longitude.text);
                              var supplier = new Supplier();
                              supplier.saveProfessional(
                                  profession.text,
                                  experience.text,
                                  work_address.text,
                                  '123',
                                  '123');
                              validateAndSend(context, _nextRoute, _regProKey,
                                  supplier, 'professional');
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
