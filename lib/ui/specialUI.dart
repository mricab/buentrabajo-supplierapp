import 'package:flutter/material.dart';

BoxDecoration specialBackground() {
  return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [const Color(0xfff75555), const Color(0xff60e7ff)]));
}

AppBar specialAppBar(List<Widget> buttons) {
  return AppBar(
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    automaticallyImplyLeading: false,
    actions: buttons,
    primary: true,
    toolbarHeight: 40,
  );
}

Text specialTitle(String title) {
  return Text(title,
      style: TextStyle(
          fontSize: 36, fontWeight: FontWeight.w500, color: Colors.white));
}

Text specialSubtitle(String subtitle) {
  return Text(subtitle,
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white));
}

Widget specialInkWell(
    String label, double size, BuildContext context, MaterialPageRoute route) {
  return InkWell(
    onTap: () {
      Navigator.push(context, route);
    },
    child: Text(
      label,
      style: TextStyle(
        color: Colors.white,
        fontSize: size,
      ),
    ),
  );
}

Widget specialButton(String label, VoidCallback method) {
  Color getForegroundColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Color(0xff60e7ff);
  }

  return TextButton(
    onPressed: method,
    child: Text(
      label,
      style: TextStyle(fontSize: 14),
    ),
    style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith(getForegroundColor),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        minimumSize: MaterialStateProperty.all(Size(double.infinity, 40)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ))),
  );
}

InputDecoration textFormFieldsDecoration(String hint, IconData icon) {
  return InputDecoration(
    fillColor: Colors.white12,
    filled: false,
    hintText: hint,
    hintStyle: TextStyle(color: Colors.white70),
    focusColor: Colors.green,
    errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            color: Colors.red, width: 2.0, style: BorderStyle.solid)),
    focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            color: Colors.lightBlueAccent,
            width: 2.0,
            style: BorderStyle.solid)),
    enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            color: Colors.white, width: 1.0, style: BorderStyle.solid)),
    disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            color: Colors.grey, width: 2.0, style: BorderStyle.solid)),
    suffixIcon: Icon(
      icon,
      color: Colors.white70,
    ),
  );
}

TextFormField specialTextFormField(String hint, TextAlign align) {
  return TextFormField(
    style: TextStyle(color: Colors.white),
    textAlign: align,
    obscureText: false,
    decoration: textFormFieldsDecoration(hint, null),
    validator: (value) {
      if (value.isEmpty) {
        return 'Porfavor ingrese su correo.';
      }
      return null;
    },
  );
}

TextFormField specialMultiLineTextFormField(
    String hint, TextAlign align, int min, int max) {
  return TextFormField(
    minLines: min,
    maxLines: max,
    style: TextStyle(color: Colors.white),
    textAlign: align,
    obscureText: false,
    decoration: textFormFieldsDecoration(hint, null),
    validator: (value) {
      if (value.isEmpty) {
        return 'Porfavor ingrese su correo.';
      }
      return null;
    },
  );
}

TextFormField specialPasswordFormField(String hint, TextAlign align) {
  return TextFormField(
    style: TextStyle(color: Colors.white),
    textAlign: align,
    obscureText: true,
    decoration: textFormFieldsDecoration(hint, null),
    validator: (value) {
      if (value.isEmpty) {
        return 'Porfavor ingrese su correo.';
      }
      return null;
    },
  );
}

TextFormField specialNumericFormField(String hint, TextAlign align) {
  return TextFormField(
    keyboardType: TextInputType.number,
    style: TextStyle(color: Colors.white),
    textAlign: align,
    obscureText: false,
    decoration: textFormFieldsDecoration(hint, null),
    validator: (value) {
      if (value.isEmpty) {
        return 'Porfavor ingrese su correo.';
      }
      return null;
    },
  );
}

Widget specialDatePicker(String label, DateTime iDate, DateTime fDate,
    DateTime lDate, BuildContext context) {
  final dateController = TextEditingController();

  return TextFormField(
    readOnly: true,
    controller: dateController,
    decoration: textFormFieldsDecoration(label, Icons.calendar_today_outlined),
    onTap: () async {
      var date = await showDatePicker(
          context: context,
          initialDate: iDate,
          firstDate: fDate,
          lastDate: lDate);
      dateController.text = date.toString().substring(0, 10);
    },
  );
}

Widget specialDropdown(String hint, List<String> items) {
  final dropdownController = TextEditingController();
  return DropdownButtonFormField(
    decoration: textFormFieldsDecoration(hint, null),
    onChanged: (value) {
      dropdownController.text = value;
    },
    items: items.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
  );
}
