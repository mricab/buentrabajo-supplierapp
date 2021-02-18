import 'package:flutter/material.dart';
import 'package:supplierapp/ui/specialUI.dart';
import 'package:supplierapp/screens/login.dart';

class RegisterInstructions extends StatefulWidget {
  // Register state
  final bool success;
  RegisterInstructions({Key key, @required this.success}) : super(key: key);
  @override
  _RegisterInstructionsState createState() =>
      _RegisterInstructionsState(success: success);
}

class _RegisterInstructionsState extends State<RegisterInstructions> {
  final bool success;
  _RegisterInstructionsState({@required this.success});

  final _loginRoute = new MaterialPageRoute(builder: (context) => Login());
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: specialBackground(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: specialAppBar([
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 50, 0),
              child: specialInkWell('Cerrar', 14, context, _loginRoute),
            )
          ]),
          body: (success)
              ? Center(
                  child: Padding(
                    padding: EdgeInsets.all(50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        specialTitle('¡Gracias!'),
                        SizedBox(
                          height: 10,
                        ),
                        specialSubtitle('Su solicitud a sido recibida'),
                        SizedBox(
                          height: 15,
                        ),
                        specialEmoticon('✉️'),
                        specialMessage(
                            'En los proximos días recibirá un correo electrónico notificandole el resultado de la solicitud.'),
                        SizedBox(
                          height: 10,
                        ),
                        specialEmoticon('🚨'),
                        specialMessage(
                            'No olvide que debe validar su correo electrónico antes de que su solicitud sea revisada. Para verificarlo solo debe hacer click en el link incluido en el correo que le hemos enviado.'),
                        SizedBox(
                          height: 10,
                        ),
                        specialEmoticon('🙂'),
                        SizedBox(
                          height: 10,
                        ),
                        specialMessage(
                            '¡Esperamos trabajar juntos muy pronto!'),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: Padding(
                    padding: EdgeInsets.all(50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        specialTitle('Algo salio mal'),
                        SizedBox(
                          height: 15,
                        ),
                        specialEmoticon('🤕'),
                        SizedBox(
                          height: 10,
                        ),
                        specialMessage(
                            'Puede haber existido un problema en el servidor o durante el envío de su solicitud. Le rogamos intente solicitar su registro nuevamente.'),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }
}
