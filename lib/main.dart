import 'package:flutter/material.dart';
import 'package:supplierapp/screens/login.dart';
import 'package:supplierapp/screens/register_account.dart';
import 'package:supplierapp/screens/register_personal.dart';
import 'package:supplierapp/screens/register_professional.dart';
import 'package:supplierapp/screens/register_services.dart';
import 'package:supplierapp/screens/register_instructions.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    routes: {
      '/login': (context) => Login(),
      '/register_account': (context) => RegisterAccount(),
      '/register_personal': (context) => RegisterPersonal(),
      '/register_professional': (context) => RegisterProfessional(),
      '/register_services': (context) => RegisterServices(),
      '/register_instructions': (context) => RegisterInstructions(),
    },
    theme: ThemeData(
        fontFamily: 'Gibson',
        accentColor: const Color(0xff60e7ff),
        textTheme: TextTheme(
            headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w500))),
  ));
}
