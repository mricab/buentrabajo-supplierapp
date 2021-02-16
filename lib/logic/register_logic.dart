import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:supplierapp/models/newsupplier.dart';
import 'package:supplierapp/utils/network.dart';

// Flow
void validateAndSend(BuildContext context, MaterialPageRoute route,
    GlobalKey<FormState> key, Supplier supplier, String api) {
  if (key.currentState.validate()) {
    Navigator.push(context, route);
    if (externalValidation(api, supplier) != null) {
      //Retornar errores
    }
  }
  //Navigator.push(context, route);
}

Future<String> externalValidation(String apiMethod, Supplier supplier) async {
  var data;
  String apiURL;
  if (apiMethod == 'account') {
    data = supplier.accountData();
    apiURL = '/validateAccount';
  }
  if (apiMethod == 'personal') {
    data = supplier.personalData();
    apiURL = '/validatePersonal';
  }
  if (apiMethod == 'professional') {
    data = supplier.professionalData();
    apiURL = '/validateProfessional';
  }
  if (apiMethod == 'service') {
    data = supplier.serviceData();
    apiURL = '/validateService';
  }

  var res = await Network().register(data, apiURL);
  var body = json.decode(res.body);
  print(body);
  if (body['success']) {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // localStorage.setString('token', json.encode(body['token']));
    // localStorage.setString('user', json.encode(body['user']));
    print('Validado');
    return null;
  } else {
    print('Existen errores');
    return 'Existen errores';
  }
}

// Local Validators
String validateUserEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Correo inválido.';
  else
    return null;
}

String validateUserPassword(String value) {
  if (value.isEmpty || value.length <= 3) {
    return 'Al menos 4 caracteres.';
  }
  return null;
}

String validateAvatar(String value) {
  if (value == null) {
    return 'Ingrese una imagen.';
  }
  return null;
}

String validatePersonName(String value) {
  if (value.isEmpty || value.length <= 3) {
    return 'El nombre debe tener almenos 3 caracteres.';
  }
  return null;
}

String validatePersonLastName(String value) {
  if (value.isEmpty || value.length <= 3) {
    return 'El apellido debe tener almenos 3 caracteres.';
  }
  return null;
}

String validateBirthDate(String value) {
  //DatePicker
  if (value.isEmpty) {
    return 'Debe seleccionar una fecha.';
  }
  return null;
}

String validateAddress(String value) {
  if (value.isEmpty || value.length <= 15) {
    return 'la dirección es muy corta.';
  }
  return null;
}

String validateCity(dynamic value) {
  //Dropdown
  if (value == null) {
    return 'Debe seleccionar su ciudad.';
  }
  return null;
}

String validatePhone(String value) {
  if (value.isEmpty || value.length <= 7) {
    return 'El número es inválido.';
  }
  return null;
}

String validateIdNum(String value) {
  if (value.isEmpty || value.length <= 6) {
    return 'El número de documento es inválido.';
  }
  return null;
}

String validateIdType(dynamic value) {
  //Dropdown
  if (value == null) {
    return 'Debe indicar el tipo de su documento.';
  }
  return null;
}

String validateProfession(dynamic value) {
  //Dropdown
  if (value == null) {
    return 'Debe seleccionar una professión.';
  }
  return null;
}

String validateExperience(String value) {
  if (value.isEmpty || value.length <= 50) {
    return 'Por favor, detalle más su experiencia.';
  } else if (value.length >= 140) {
    return 'Solamente se permiten 140 caracteres.';
  }
  return null;
}

String validateLocation(String value) {
  //Locarion Picker
  if (value == null) {
    return 'Indique una posición.';
  }
  return null;
}

String validateServiceType(dynamic value) {
  //Dropdown
  if (value == null) {
    return 'Debe seleccionar un tipo de servicio.';
  }
  return null;
}

String validateDescription(String value) {
  if (value.isEmpty || value.length <= 50) {
    return 'Mínimo 50 caracteres, máximo 200.';
  } else if (value.length >= 250) {
    return 'Mínimo 50 caracteres, máximo 250.';
  }
  return null;
}

String validatePrice(String value) {
  try {
    double result = double.parse(value);
    if (result > 0) {
      return null;
    } else {
      return 'El precio no puede ser negativo.';
    }
  } catch (e) {
    return 'El valor ingresado es inválido.';
  }
}
