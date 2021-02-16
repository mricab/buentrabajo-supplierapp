import 'package:flutter/material.dart';
import 'package:supplierapp/logic/register_logic.dart';
import 'package:supplierapp/ui/specialUI.dart';
import 'package:supplierapp/screens/register_instructions.dart';
import 'package:supplierapp/screens/login.dart';
import 'package:supplierapp/models/newsupplier.dart';
import 'package:supplierapp/widgets/chipsField.dart';

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

    //Form Fields Controllers
    final service = TextEditingController();
    final description = TextEditingController();
    final price = TextEditingController();
    final ChipsController schedule = new ChipsController(List());

    //Chips
    List<String> options = [
      'L-8.30-12.30',
      'L-14.30-18.30',
      'L-19.00-23.00',
      'Automotive',
      'Sports',
      'Education',
      'Fashion',
      'Travel',
      'Food',
      'Tech',
      'Science',
    ];

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
                                  service),
                              specialMultiLineTextFormField('Descripción', _lft,
                                  3, 4, validateDescription, description),
                              specialAmountFormField(
                                  'Precio', _lft, validatePrice, price, 'Bs.'),
                              specialScheduleField(
                                  'Horario', context, null, schedule),
                            ],
                          )),
                    ),
                    specialButton('Enviar', () {
                      print(schedule.data);
                      // var supplier = new Supplier();
                      // supplier.saveService(
                      //     service.text, description.text, price.text);
                      // validateAndSend(
                      //     context, _nextRoute, _regSerKey, supplier, 'service');
                    })
                  ]),
            ),
          ),
        ));
  }
}
