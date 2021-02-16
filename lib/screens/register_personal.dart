import 'package:flutter/material.dart';
import 'package:supplierapp/logic/register_logic.dart';
import 'package:supplierapp/ui/specialUI.dart';
import 'package:supplierapp/screens/register_professional.dart';
import 'package:supplierapp/screens/login.dart';
import 'package:supplierapp/models/newsupplier.dart';

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

    //Form Fields Controllers
    final birthdate = TextEditingController();
    final home_address = TextEditingController();
    final city = TextEditingController();
    final phone = TextEditingController();
    final id_num = TextEditingController();
    final id_type = TextEditingController();

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
              padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    specialTitle('Registro'),
                    SizedBox(
                      height: 15,
                    ),
                    specialSubtitle('Paso 2: Datos Personales'),
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: Form(
                          key: _regPerKey,
                          child: ListView(
                            children: [
                              specialDatePicker(
                                  'Fecha de Nacimiento',
                                  iDate,
                                  fDate,
                                  lDate,
                                  context,
                                  validateBirthDate,
                                  birthdate),
                              specialTextFormField('Dirección de Domicilio',
                                  _lft, validateAddress, home_address),
                              specialDropdown(
                                  'Ciudad de Residencia',
                                  <String>[
                                    'La Paz',
                                    'Cochabamba',
                                    'Santa Cruz',
                                  ],
                                  validateCity,
                                  city),
                              specialPhoneFormField(
                                  'Teléfono', _lft, validatePhone, phone),
                              specialTextFormField('Doc. de Identidad', _lft,
                                  validateIdNum, id_num),
                              specialDropdown(
                                  'Tipo Doc. de Identidad',
                                  <String>[
                                    'Carnet',
                                    'Pasaporte',
                                    'Tarj. Residencia'
                                  ],
                                  validateIdType,
                                  id_type),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          )),
                    ),
                    specialButton('Siguiente', () {
                      var supplier = new Supplier();
                      supplier.savePersonal(birthdate.text, home_address.text,
                          city.text, phone.text, id_num.text, id_type.text);
                      validateAndSend(context, _nextRoute, _regPerKey, supplier,
                          'personal');
                    })
                  ]),
            ),
          ),
        ));
  }
}
