import 'package:flutter/material.dart';
import 'package:supplierapp/logic/register_logic.dart';
import 'package:supplierapp/ui/specialUI.dart';
import 'package:supplierapp/screens/register_services.dart';
import 'package:supplierapp/screens/login.dart';
import 'package:supplierapp/models/supplier.dart';
import 'package:supplierapp/widgets/locationPickerField.dart';

class RegisterProfessional extends StatefulWidget {
  //Supplier
  Supplier supplier;
  RegisterProfessional({Key key, @required this.supplier}) : super(key: key);

  @override
  _RegisterProfessionalState createState() =>
      _RegisterProfessionalState(supplier: supplier);
}

class _RegisterProfessionalState extends State<RegisterProfessional> {
  Supplier supplier;
  _RegisterProfessionalState({@required this.supplier});

  @override
  Widget build(BuildContext context) {
    //Constants
    final _regProKey = GlobalKey<FormState>();
    final _lft = TextAlign.left;
    final _nextRoute = new MaterialPageRoute(
        builder: (context) => RegisterServices(
              supplier: supplier,
            ));
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
              padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    specialTitle('Registro'),
                    SizedBox(
                      height: 15,
                    ),
                    specialSubtitle('Paso 3: Datos Profesionales'),
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: Form(
                          key: _regProKey,
                          child: ListView(
                            children: [
                              specialLocationField(context, validateLocation,
                                  work_latitude, work_longitude),
                              specialTextFormField('Dirección laboral', _lft,
                                  validateWorkAddress, work_address),
                              specialDropdown(
                                  'Profesión',
                                  <String>[
                                    'Carpintero',
                                    'Cerrajero',
                                    'Albañil',
                                    'Plomero',
                                    'Técnico de Aire Acond.',
                                  ],
                                  validateProfession,
                                  profession),
                              specialMultiLineTextFormField('Experiencia', _lft,
                                  4, 5, validateExperience, experience),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          )),
                    ),
                    specialButton('Siguiente', () async {
                      supplier.setSupplier(
                          profession.text,
                          experience.text,
                          work_address.text,
                          work_latitude.text,
                          work_longitude.text);
                      bool val =
                          await validate(_regProKey, supplier, 'professional');
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
