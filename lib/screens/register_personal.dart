import 'package:flutter/material.dart';
import 'package:supplierapp/logic/register_logic.dart';
import 'package:supplierapp/ui/specialUI.dart';
import 'package:supplierapp/screens/register_account.dart';
import 'package:supplierapp/screens/login.dart';
import 'package:supplierapp/models/supplier.dart';
import 'package:supplierapp/logic/parameters.dart';

class RegisterPersonal extends StatefulWidget {
  @override
  _RegisterPersonalState createState() => _RegisterPersonalState();
}

class _RegisterPersonalState extends State<RegisterPersonal> {
  var cities;
  var id_types;

  @override
  void initState() {
    super.initState();
    var param;
    param = getParameter('cities').then((param) {
      //cities = param.map((c) => c as Map<String, String>)?.toList();
      cities = param.map((e) {
        return {
          'id': e['id'].toString(),
          'name': e['name'] as String,
        };
      }).toList();
      setState(() {});
    });
    param = getParameter('id_types').then((param) {
      id_types = param.cast<String>();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // Constructur
    Supplier supplier;

    // Constants
    final _regPerKey = GlobalKey<FormState>();
    final _lft = TextAlign.left;
    final _nextRoute = new MaterialPageRoute(
        builder: (context) => RegisterAccount(
              supplier: supplier,
            ));
    final _loginRoute = new MaterialPageRoute(builder: (context) => Login());

    //Birth Date Form Fiel Parameters
    var now = DateTime.now();
    var iDate = now.subtract(new Duration(days: 10950)); //30*365=10950
    var fDate = now.subtract(new Duration(days: 32850)); //90*365=32850
    var lDate = now.subtract(new Duration(days: 6750)); //18*365=6750

    //Form Fields Controllers
    var avatar = TextEditingController();
    var name = TextEditingController();
    final first_last_name = TextEditingController();
    final second_last_name = TextEditingController();
    final birth_date = TextEditingController();
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
                    specialSubtitle('Paso 1: Datos Personales'),
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: Form(
                          key: _regPerKey,
                          child: ListView(
                            children: [
                              specialAvatarField(
                                  context, validateAvatar, avatar),
                              specialTextFormField(
                                  'Nombre', _lft, validateName, name),
                              specialTextFormField('Primer Apellido', _lft,
                                  validateFirstLastName, first_last_name),
                              specialTextFormField('Segundo Apellido', _lft,
                                  validateSecondLastName, second_last_name),
                              specialDatePicker(
                                  'Fecha de Nacimiento',
                                  iDate,
                                  fDate,
                                  lDate,
                                  context,
                                  validateBirthDate,
                                  birth_date),
                              specialTextFormField('Dirección de Domicilio',
                                  _lft, validateHomeAddress, home_address),
                              specialDropdown2(
                                  'Ciudad de Residencia',
                                  cities ?? <Map<String, String>>[],
                                  validateCity,
                                  city),
                              specialPhoneFormField(
                                  'Teléfono', _lft, validatePhone, phone),
                              specialTextFormField('Doc. de Identidad', _lft,
                                  validateIdNum, id_num),
                              specialDropdown(
                                  'Tipo Doc. de Identidad',
                                  id_types ?? <String>[''],
                                  validateIdType,
                                  id_type),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          )),
                    ),
                    specialButton('Siguiente', () async {
                      supplier = new Supplier();
                      supplier.setPerson(
                        avatar.text,
                        name.text,
                        first_last_name.text,
                        second_last_name.text,
                        birth_date.text,
                        home_address.text,
                        city.text,
                        phone.text,
                        id_num.text,
                        id_type.text,
                      );
                      bool val =
                          await validate(_regPerKey, supplier, 'personal');
                      if (val) {
                        Navigator.push(context, _nextRoute);
                      }
                    })
                  ]),
            ),
          ),
        ));
  }
}
