import 'package:flutter/material.dart';
import 'package:supplierapp/screens/register_personal.dart';
import 'package:supplierapp/screens/password_recover.dart';
import 'package:supplierapp/ui/specialUI.dart';
import 'package:supplierapp/logic/login_logic.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _loginFormKey = GlobalKey<FormState>();
    final _left = TextAlign.left;

    return Container(
        decoration: specialBackground(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(50, 80, 50, 80),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 1),
                    specialTitle('Iniciar Sesión'),
                    Spacer(flex: 2),
                    Form(
                        key: _loginFormKey,
                        child: Column(
                          children: [
                            specialTextFormField(
                                'Email', _left, validateUserEmail, email),
                            specialPasswordFormField('Password', _left,
                                validateUserPassword, password),
                            SizedBox(
                              height: 30,
                            ),
                            specialButton(
                              'ENTRAR',
                              () async {
                                await login(context, email.text, password.text);
                              },
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    specialInkWell(
                        '¿Olvido su contraseña?',
                        13,
                        context,
                        new MaterialPageRoute(
                            builder: (context) => PasswordRecover())),
                    Spacer(flex: 2),
                    specialInkWell(
                        'SOLICITAR REGISTRO',
                        14,
                        context,
                        new MaterialPageRoute(
                            builder: (context) => RegisterPersonal()))
                  ]),
            ),
          ),
        ));
  }
}
