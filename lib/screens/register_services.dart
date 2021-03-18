import 'package:flutter/material.dart';
import 'package:supplierapp/logic/register_logic.dart';
import 'package:supplierapp/ui/specialUI.dart';
import 'package:supplierapp/screens/register_instructions.dart';
import 'package:supplierapp/screens/login.dart';
import 'package:supplierapp/models/supplier.dart';
import 'package:supplierapp/models/service.dart';
import 'package:supplierapp/widgets/chipsField.dart';
import 'package:supplierapp/logic/parameters.dart';

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

  var servicesList;
  var mondaySchedules;
  var tuesdaySchedules;
  var wednesdaySchedules;
  var thursdaySchedules;
  var fridaySchedules;
  var saturdaySchedules;
  var sundaySchedules;

  @override
  void initState() {
    super.initState();
    var param;
    param = getParameter('services').then((param) {
      servicesList = param.map((e) {
        return {
          'id': e['id'].toString(),
          'name': e['name'] as String,
        };
      }).toList();
      setState(() {});
    });
    param = getParameter('mondaySchedules').then((param) {
      mondaySchedules = param.map((e) {
        return {
          'id': e['id'].toString(),
          'name': e['start'].toString() + ' - ' + e['end'].toString(),
        };
      }).toList();
      print(mondaySchedules);
      setState(() {});
    });
    param = getParameter('mondaySchedules').then((param) {
      tuesdaySchedules = param.map((e) {
        return {
          'id': e['id'].toString(),
          'name': e['start'].toString() + ' - ' + e['end'].toString(),
        };
      }).toList();
      print(tuesdaySchedules);
      setState(() {});
    });
    param = getParameter('mondaySchedules').then((param) {
      wednesdaySchedules = param.map((e) {
        return {
          'id': e['id'].toString(),
          'name': e['start'].toString() + ' - ' + e['end'].toString(),
        };
      }).toList();
      print(wednesdaySchedules);
      setState(() {});
    });
    param = getParameter('mondaySchedules').then((param) {
      thursdaySchedules = param.map((e) {
        return {
          'id': e['id'].toString(),
          'name': e['start'].toString() + ' - ' + e['end'].toString(),
        };
      }).toList();
      print(thursdaySchedules);
      setState(() {});
    });
    param = getParameter('mondaySchedules').then((param) {
      fridaySchedules = param.map((e) {
        return {
          'id': e['id'].toString(),
          'name': e['start'].toString() + ' - ' + e['end'].toString(),
        };
      }).toList();
      print(fridaySchedules);
      setState(() {});
    });
    param = getParameter('mondaySchedules').then((param) {
      saturdaySchedules = param.map((e) {
        return {
          'id': e['id'].toString(),
          'name': e['start'].toString() + ' - ' + e['end'].toString(),
        };
      }).toList();
      print(saturdaySchedules);
      setState(() {});
    });
    param = getParameter('mondaySchedules').then((param) {
      sundaySchedules = param.map((e) {
        return {
          'id': e['id'].toString(),
          'name': e['start'].toString() + ' - ' + e['end'].toString(),
        };
      }).toList();
      print(sundaySchedules);
      setState(() {});
    });
  }

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
                    specialSubtitle('Paso 4: Servicios'),
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: Form(
                          key: _regSerKey,
                          child: ListView(
                            children: [
                              specialDropdown2(
                                  'Tipo de Servicio',
                                  servicesList ?? <Map<String, String>>[],
                                  validateServiceType,
                                  serviceType),
                              specialMultiLineTextFormField('Descripción', _lft,
                                  3, 4, validateDescription, description),
                              specialAmountFormField(
                                  'Precio', _lft, validatePrice, price, 'Bs.'),
                              specialScheduleField(
                                  'Horario',
                                  context,
                                  mondaySchedules ?? <Map<String, String>>[],
                                  tuesdaySchedules ?? <Map<String, String>>[],
                                  wednesdaySchedules ?? <Map<String, String>>[],
                                  thursdaySchedules ?? <Map<String, String>>[],
                                  fridaySchedules ?? <Map<String, String>>[],
                                  saturdaySchedules ?? <Map<String, String>>[],
                                  sundaySchedules ?? <Map<String, String>>[],
                                  null,
                                  schedules),
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
