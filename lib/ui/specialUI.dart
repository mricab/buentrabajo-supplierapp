import 'package:flutter/material.dart';
import 'package:supplierapp/widgets/avatarField.dart';
import 'package:supplierapp/widgets/locationPickerField.dart';
import 'package:simple_location_picker/utils/slp_constants.dart';

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

InputDecoration textFormFieldsDecoration(
    String hint, IconData iconData, String textData) {
  Icon sIcon;
  if (iconData != null) {
    sIcon = Icon(
      iconData,
      color: Colors.white70,
    );
  }
  Text sText;
  if (textData != null) {
    sText = Text(
      textData,
      style: TextStyle(color: Colors.white70),
    );
  }

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
    suffix: sText,
    suffixIcon: sIcon,
  );
}

TextFormField specialTextFormField(String hint, TextAlign align,
    String valMethod(String value), TextEditingController fieldController) {
  return TextFormField(
    controller: fieldController,
    style: TextStyle(color: Colors.white),
    textAlign: align,
    obscureText: false,
    decoration: textFormFieldsDecoration(hint, null, null),
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
    decoration: textFormFieldsDecoration(hint, null, null),
  );
}

TextFormField specialPasswordFormField(String hint, TextAlign align,
    String valMethod(String value), TextEditingController fieldController) {
  return TextFormField(
    controller: fieldController,
    style: TextStyle(color: Colors.white),
    textAlign: align,
    obscureText: true,
    decoration: textFormFieldsDecoration(hint, null, null),
    validator: valMethod,
  );
}

TextFormField specialAmountFormField(
    String hint,
    TextAlign align,
    String valMethod(String value),
    TextEditingController fieldController,
    String currency) {
  return TextFormField(
    controller: fieldController,
    keyboardType: TextInputType.number,
    style: TextStyle(color: Colors.white),
    textAlign: align,
    obscureText: false,
    decoration: textFormFieldsDecoration(hint, null, currency),
    validator: valMethod,
  );
}

TextFormField specialPhoneFormField(String hint, TextAlign align,
    String valMethod(String value), TextEditingController fieldController) {
  return TextFormField(
    controller: fieldController,
    keyboardType: TextInputType.number,
    style: TextStyle(color: Colors.white),
    textAlign: align,
    obscureText: false,
    decoration: textFormFieldsDecoration(hint, null, null),
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
  return TextFormField(
    controller: fieldController,
    readOnly: true,
    validator: valMethod,
    decoration:
        textFormFieldsDecoration(label, Icons.calendar_today_outlined, null),
    onTap: () async {
      var date = await showDatePicker(
          context: context,
          initialDate: iDate,
          firstDate: fDate,
          lastDate: lDate);
      fieldController.text = date.toString().substring(0, 10);
    },
  );
}

DropdownButtonFormField specialDropdown(String hint, List<String> items,
    String valMethod(String value), TextEditingController fieldController) {
  return DropdownButtonFormField(
    icon: Icon(null),
    validator: valMethod,
    decoration: textFormFieldsDecoration(hint, Icons.keyboard_arrow_down, null),
    onChanged: (value) {
      fieldController.text = value;
    },
    dropdownColor: Color(0xff60e7ff),
    items: items.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(
          value,
          style: TextStyle(color: Colors.white),
        ),
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

Widget specialLocationField(
    BuildContext context,
    String valMethod(String value),
    TextEditingController latController,
    TextEditingController lngController) {
  return LocationPickerField(
    context: context,
    latController: latController,
    lngController: lngController,
    validator: valMethod,
    avatarRadius: 45,
    avatarBackground: Color(0x8860e7ff),
    appBarTitle: 'Dirección Laboral',
    appBarColor: Colors.black87,
    appBarTextColor: Colors.white,
    markerColor: Colors.blue,
    startingLatitude: SLPConstants.DEFAULT_LATITUDE,
    startingLongitude: SLPConstants.DEFAULT_LONGITUDE,
  );
}
