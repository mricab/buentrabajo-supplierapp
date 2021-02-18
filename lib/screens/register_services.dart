import 'package:flutter/material.dart';
import 'package:supplierapp/logic/register_logic.dart';
import 'package:supplierapp/ui/specialUI.dart';
import 'package:supplierapp/screens/register_instructions.dart';
import 'package:supplierapp/screens/login.dart';
import 'package:supplierapp/models/supplier.dart';
import 'package:supplierapp/models/service.dart';
import 'package:supplierapp/models/schedule.dart';
import 'package:supplierapp/widgets/chipsField.dart';

class RegisterServices extends StatefulWidget {
  //Supplier
  Supplier supplier;
  RegisterServices({Key key, @required this.supplier}) : super(key: key);

  @override
  _RegisterServicesState createState() =>
      _RegisterServicesState(supplier: supplier);
}

class _RegisterServicesState extends State<RegisterServices> {
  Supplier supplier;
  bool registrationSuccess;
  _RegisterServicesState({@required this.supplier});

  @override
  Widget build(BuildContext context) {
    //Constants
    final _regSerKey = GlobalKey<FormState>();
    final _lft = TextAlign.left;
    final _nextRoute = new MaterialPageRoute(
        builder: (context) => RegisterInstructions(
              success: registrationSuccess,
            ));
    final _loginRoute = new MaterialPageRoute(builder: (context) => Login());

    //Form Fields Controllers
    final serviceType = TextEditingController();
    final description = TextEditingController();
    final price = TextEditingController();
    final ChipsController schedules = new ChipsController(List());

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
                    specialSubtitle('Paso 4: Primer Servicio'),
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: Form(
                          key: _regSerKey,
                          child: ListView(
                            children: [
                              specialDropdown(
                                  'Tipo de Servicio',
                                  <String>[
                                    'Mantenimiento',
                                    'Instalación',
                                    'Asesoramiento',
                                  ],
                                  validateServiceType,
                                  serviceType),
                              specialMultiLineTextFormField('Descripción', _lft,
                                  3, 4, validateDescription, description),
                              specialAmountFormField(
                                  'Precio', _lft, validatePrice, price, 'Bs.'),
                              specialScheduleField(
                                  'Horario', context, null, schedules),
                            ],
                          )),
                    ),
                    specialButton('Siguiente', () async {
                      Service service = new Service(
                          serviceType.text, description.text, price.text);
                      supplier.addService(service);
                      bool val =
                          await validate(_regSerKey, supplier, 'service');
                      if (val) {
                        registrationSuccess = await saveNewSupplier(supplier);
                        Navigator.push(context, _nextRoute);
                      }
                    })
                  ]),
            ),
          ),
        ));
  }
}
