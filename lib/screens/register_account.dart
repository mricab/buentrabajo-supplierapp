import 'package:flutter/material.dart';
import 'package:supplierapp/ui/specialUI.dart';
import 'package:supplierapp/screens/register_professional.dart';
import 'package:supplierapp/screens/login.dart';
import 'package:supplierapp/logic/register_logic.dart';
import 'package:supplierapp/models/supplier.dart';

class RegisterAccount extends StatefulWidget {
  //Supplier
  Supplier supplier;
  RegisterAccount({Key key, @required this.supplier}) : super(key: key);

  @override
  _RegisterAccountState createState() =>
      _RegisterAccountState(supplier: supplier);
}

class _RegisterAccountState extends State<RegisterAccount> {
  Supplier supplier;
  _RegisterAccountState({@required this.supplier});

  @override
  Widget build(BuildContext context) {
    //Constants
    final _regAccKey = GlobalKey<FormState>();
    final _lft = TextAlign.left;
    final _nextRoute = new MaterialPageRoute(
        builder: (context) => RegisterProfessional(
              supplier: supplier,
            ));
    final _loginRoute = new MaterialPageRoute(builder: (context) => Login());

    //Form Fields Controllers
    final email = TextEditingController();
    final password = TextEditingController();

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
                    specialSubtitle('Paso 2: Datos del Usuario'),
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: Form(
                        key: _regAccKey,
                        child: ListView(
                          children: [
                            specialTextFormField(
                                'Email', _lft, validateUserEmail, email),
                            specialPasswordFormField('Password', _lft,
                                validateUserPassword, password),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                    specialButton('Siguiente', () async {
                      supplier.user.setUser(email.text, password.text);
                      bool val = await validate(_regAccKey, supplier, 'user');
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
