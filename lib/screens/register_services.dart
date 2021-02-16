import 'package:flutter/material.dart';
import 'package:supplierapp/logic/register_logic.dart';
import 'package:supplierapp/ui/specialUI.dart';
import 'package:supplierapp/screens/register_instructions.dart';
import 'package:supplierapp/screens/login.dart';
import 'package:supplierapp/models/newsupplier.dart';

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
                                  'Tipo de Servicio*',
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
                            ],
                          )),
                    ),
                    specialButton('Enviar', () {
                      var supplier = new Supplier();
                      supplier.saveService(
                          service.text, description.text, price.text);
                      validateAndSend(
                          context, _nextRoute, _regSerKey, supplier, 'service');
                      print(service.text);
                      print(description.text);
                      print(price.text);
                    })
                  ]),
            ),
          ),
        ));
  }
}
