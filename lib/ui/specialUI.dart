import 'package:flutter/material.dart';
import 'package:supplierapp/widgets/avatarField.dart';

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

// Form Fields

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

TextFormField specialTextFormField(String hint, TextAlign align,
    String valMethod(String value), TextEditingController fieldController) {
  return TextFormField(
    controller: fieldController,
    style: TextStyle(color: Colors.white),
    textAlign: align,
    obscureText: false,
    decoration: textFormFieldsDecoration(hint, null),
    validator: valMethod,
  );
}

TextFormField specialMultiLineTextFormField(
    String hint,
    TextAlign align,
    int min,
    int max,
    String valMethod(String value),
    TextEditingController fieldController) {
  return TextFormField(
    controller: fieldController,
    minLines: min,
    maxLines: max,
    validator: valMethod,
    style: TextStyle(color: Colors.white),
    textAlign: align,
    obscureText: false,
    decoration: textFormFieldsDecoration(hint, null),
  );
}

TextFormField specialPasswordFormField(String hint, TextAlign align,
    String valMethod(String value), TextEditingController fieldController) {
  return TextFormField(
    controller: fieldController,
    style: TextStyle(color: Colors.white),
    textAlign: align,
    obscureText: true,
    decoration: textFormFieldsDecoration(hint, null),
    validator: valMethod,
  );
}

TextFormField specialNumericFormField(String hint, TextAlign align,
    String valMethod(String value), TextEditingController fieldController) {
  return TextFormField(
    controller: fieldController,
    keyboardType: TextInputType.number,
    style: TextStyle(color: Colors.white),
    textAlign: align,
    obscureText: false,
    decoration: textFormFieldsDecoration(hint, null),
    validator: valMethod,
  );
}

TextFormField specialDatePicker(
    String label,
    DateTime iDate,
    DateTime fDate,
    DateTime lDate,
    BuildContext context,
    String valMethod(String value),
    TextEditingController fieldController) {
  //final dateController = TextEditingController();

  return TextFormField(
    controller: fieldController,
    readOnly: true,
    //controller: dateController,
    validator: valMethod,
    decoration: textFormFieldsDecoration(label, Icons.calendar_today_outlined),
    onTap: () async {
      var date = await showDatePicker(
          context: context,
          initialDate: iDate,
          firstDate: fDate,
          lastDate: lDate);
      //dateController.text = date.toString().substring(0, 10);
      fieldController.text = date.toString().substring(0, 10);
    },
  );
}

DropdownButtonFormField specialDropdown(String hint, List<String> items,
    String valMethod(String value), TextEditingController fieldController) {
  //final dropdownController = TextEditingController();
  return DropdownButtonFormField(
    validator: null,
    decoration: textFormFieldsDecoration(hint, null),
    onChanged: (value) {
      //dropdownController.text = value;
      fieldController.text = value;
    },
    items: items.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
  );
}

Widget specialAvatarField(BuildContext context, String valMethod(String value),
    TextEditingController fieldController) {
  return AvatarFormField(
    controller: fieldController,
    validator: valMethod,
    avatarRadius: 45,
    avatarBackground: Color(0x8860e7ff),
    context: context,
    modalCameraLabel: Text(
      'CAPTURAR',
      style: TextStyle(color: Colors.lightBlue),
    ),
    modalGalleryLabel: Text(
      'SELECCIONAR',
      style: TextStyle(color: Colors.lightBlue),
    ),
    modalCameraIcon: Icon(Icons.camera, color: Colors.lightBlue),
    modalGalleryIcon: Icon(Icons.photo, color: Colors.lightBlue),
  );
}
