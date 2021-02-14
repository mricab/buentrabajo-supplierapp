import 'package:flutter/material.dart';
import 'package:supplierapp/ui/specialUI.dart';
import 'package:supplierapp/screens/register_personal.dart';
import 'package:supplierapp/screens/login.dart';
import 'package:supplierapp/logic/register_logic.dart';
import 'package:supplierapp/models/newsupplier.dart';
import 'package:supplierapp/widgets/avatarField.dart';

class RegisterAccount extends StatefulWidget {
  @override
  _RegisterAccountState createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount> {
  @override
  Widget build(BuildContext context) {
    final _regAccKey = GlobalKey<FormState>();
    final _lft = TextAlign.left;
    final _nextRoute =
        new MaterialPageRoute(builder: (context) => RegisterPersonal());
    final _loginRoute = new MaterialPageRoute(builder: (context) => Login());

    //Form Fields Controllers
    final avatar = TextEditingController();
    final name = TextEditingController();
    final first_last_name = TextEditingController();
    final second_last_name = TextEditingController();
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
              padding: EdgeInsets.fromLTRB(50, 0, 50, 80),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 1),
                    specialTitle('Registro'),
                    SizedBox(
                      height: 15,
                    ),
                    specialSubtitle('Paso 1: Crear una cuenta'),
                    Spacer(flex: 1),
                    Form(
                        key: _regAccKey,
                        child: Column(
                          children: [
                            specialAvatarField(context, validateAvatar, avatar),
                            specialTextFormField(
                                'Nombre', _lft, validatePersonName, name),
                            specialTextFormField('Primer Apellido', _lft,
                                validatePersonLastName, first_last_name),
                            specialTextFormField('Segundo Apellido', _lft,
                                validatePersonLastName, second_last_name),
                            specialTextFormField(
                                'Email', _lft, validateUserEmail, email),
                            specialPasswordFormField('Password', _lft,
                                validateUserPassword, password),
                            SizedBox(
                              height: 30,
                            ),
                            specialButton('Siguiente', () {
                              var supplier = new Supplier();
                              supplier.saveAccount(
                                  avatar.text,
                                  name.text,
                                  first_last_name.text,
                                  second_last_name.text,
                                  email.text,
                                  password.text);
                              validateAndSend(context, _nextRoute, _regAccKey,
                                  supplier, 'account');
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
