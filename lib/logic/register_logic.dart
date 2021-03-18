import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:supplierapp/models/supplier.dart';
import 'package:supplierapp/utils/network.dart';

var errors;
final _URL = 'http://127.0.0.1:8000/api/register';

// Flow
Future<bool> validate(
    GlobalKey<FormState> key, Supplier supplier, String validationType) async {
  errors = null;
  if (key.currentState.validate()) {
    if (!await externalValidation(supplier, validationType)) {
      key.currentState.validate();
      return false;
    }
    return true;
  }
  return false;
}

Future<bool> externalValidation(
    Supplier supplier, String validationType) async {
  //Api address
  Network networkMgr = new Network(_URL);

  // Prepare data
  String apiURL = '/validate';
  Map data = supplier.data();
  print(data);
  Map files = supplier.files();
  data['validation'] = validationType;

  // Send request
  var response = await networkMgr.postMultipartRequest(data, files, apiURL);
  var body = json.decode(response.body);
  print(body);

  // Return errors
  if (body['success']) {
    errors = null;
    return true;
  } else {
    var message = body['message'];
    Map<String, List<dynamic>> messageErrors =
        Map<String, List<dynamic>>.from(message);
    errors = messageErrors;
    return false;
  }
}

Future<bool> saveNewSupplier(Supplier supplier) async {
  //Api address
  Network networkMgr = new Network(_URL);

  // Prepare data
  String apiURL = '/store';
  Map data = supplier.data();
  Map files = supplier.files();

  // Send request
  var response = await networkMgr.postMultipartRequest(data, files, apiURL);
  var body = json.decode(response.body);
  print(body);

  // Return status
  if (body['success']) {
    return true;
  } else {
    return false;
  }
}

// Validators
String validateUserEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Correo inválido.';
  }
  if (errors != null) {
    return errors['email']?.toString() ?? null;
  }
  return null;
}

String validateUserPassword(String value) {
  if (value.isEmpty || value.length <= 3) {
    return 'Al menos 4 caracteres.';
  }
  if (errors != null) {
    return errors['password']?.toString() ?? null;
  }
  return null;
}

String validateAvatar(String value) {
  if (value == null) {
    return 'Ingrese una imagen.';
  }
  if (errors != null) {
    return errors['avatar']?.toString() ?? null;
  }
  return null;
}

String validateName(String value) {
  if (value.isEmpty || value.length <= 3) {
    return 'El nombre debe tener almenos 3 caracteres.';
  }
  if (errors != null) {
    return errors['name']?.toString() ?? null;
  }
  return null;
}

String validateFirstLastName(String value) {
  if (value.isEmpty || value.length <= 3) {
    return 'El apellido debe tener almenos 3 caracteres.';
  }
  if (errors != null) {
    return errors['first_last_name']?.toString() ?? null;
  }
  return null;
}

String validateSecondLastName(String value) {
  if (value.isEmpty || value.length <= 3) {
    return 'El apellido debe tener almenos 3 caracteres.';
  }
  if (errors != null) {
    return errors['second_last_name']?.toString() ?? null;
  }
  return null;
}

String validateBirthDate(String value) {
  //DatePicker
  if (value.isEmpty) {
    return 'Debe seleccionar una fecha.';
  }
  if (errors != null) {
    return errors['birth_date']?.toString() ?? null;
  }
  return null;
}

String validateHomeAddress(String value) {
  if (value.isEmpty || value.length <= 15) {
    return 'la dirección es muy corta.';
  }
  if (errors != null) {
    return errors['home_address']?.toString() ?? null;
  }
  return null;
}

String validateCity(dynamic value) {
  //Dropdown
  if (value == null) {
    return 'Debe seleccionar su ciudad.';
  }
  if (errors != null) {
    return errors['city']?.toString() ?? null;
  }
  return null;
}

String validatePhone(String value) {
  if (value.isEmpty || value.length <= 7) {
    return 'El número es inválido.';
  }
  if (errors != null) {
    return errors['phone']?.toString() ?? null;
  }
  return null;
}

String validateIdNum(String value) {
  if (value.isEmpty || value.length <= 6) {
    return 'El número de documento es inválido.';
  }
  if (errors != null) {
    return errors['id_num']?.toString() ?? null;
  }
  return null;
}

String validateIdType(dynamic value) {
  //Dropdown
  if (value == null) {
    return 'Debe indicar el tipo de su documento.';
  }
  if (errors != null) {
    return errors['id_type']?.toString() ?? null;
  }
  return null;
}

String validateProfession(dynamic value) {
  //Dropdown
  if (value == null) {
    return 'Debe seleccionar una professión.';
  }
  if (errors != null) {
    return errors['profession']?.toString() ?? null;
  }
  return null;
}

String validateExperience(String value) {
  if (value.isEmpty || value.length <= 49) {
    return 'Por favor, detalle más su experiencia.';
  } else if (value.length >= 141) {
    return 'Solamente se permiten 140 caracteres.';
  }
  if (errors != null) {
    return errors['experience']?.toString() ?? null;
  }
  return null;
}

String validateWorkAddress(String value) {
  if (value.isEmpty || value.length <= 15) {
    return 'la dirección es muy corta.';
  }
  if (errors != null) {
    return errors['work_address']?.toString() ?? null;
  }
  return null;
}

String validateLocation(String value) {
  //Locarion Picker
  if (value == null) {
    return 'Indique una posición.';
  }
  if (errors != null) {
    String latitude = errors['work_latitude']?.toString() ?? null;
    String longitude = errors['work_latitude']?.toString() ?? null;
    if (latitude != null && longitude != null) {
      return '$latitude $longitude';
    }
  }
  return null;
}

String validateServiceType(dynamic value) {
  //Dropdown
  if (value == null) {
    return 'Debe seleccionar un tipo de servicio.';
  }
  if (errors != null) {
    return errors['service']?.toString() ?? null;
  }
  return null;
}

String validateDescription(String value) {
  if (value.isEmpty || value.length <= 49) {
    return 'Mínimo 50 caracteres, máximo 250.';
  } else if (value.length >= 251) {
    return 'Mínimo 50 caracteres, máximo 250.';
  }
  if (errors != null) {
    return errors['cidescriptionty']?.toString() ?? null;
  }
  return null;
}

String validatePrice(String value) {
  try {
    double result = double.parse(value);
    if (result < 0) {
      return 'El precio no puede ser negativo.';
    }
    if (result == 0) {
      return 'El precio no puede ser cero.';
    }
    if (errors != null) {
      return errors['price']?.toString() ?? null;
    }
    return null;
  } catch (e) {
    return 'El valor ingresado es inválido.';
  }
}
