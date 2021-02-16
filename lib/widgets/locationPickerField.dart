import 'package:flutter/material.dart';
import 'package:supplierapp/utils/location.dart';
import 'package:simple_location_picker/simple_location_result.dart';

class LocationPickerField extends FormField<String> {
  LocationPickerField({
    //Avatar
    double avatarRadius = 40,
    Widget avatarHint = const Icon(
      Icons.pin_drop_outlined,
      color: Colors.white54,
    ),
    Color avatarBackground = Colors.grey,
    //Form Field
    BuildContext context,
    FormFieldSetter<String> onSaved,
    String initialValue,
    FormFieldValidator<String> validator,
    FormFieldState<String> state,
    bool autovalidate = false,
    TextEditingController latController,
    TextEditingController lngController,
    //Map Screen
    String appBarTitle,
    Color appBarColor,
    Color appBarTextColor,
    Color markerColor,
    double startingLatitude,
    double startingLongitude,
  }) : super(
            onSaved: (value) {},
            initialValue: initialValue,
            validator: validator,
            builder: (state) {
              var locationMgr = LocationPicker(
                  appBarTitle,
                  appBarColor,
                  appBarTextColor,
                  markerColor,
                  SimpleLocationResult(startingLatitude, startingLongitude));
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () async {
                        await locationMgr.getLocation(context);
                        latController.text =
                            locationMgr.selectedLocation().latitude.toString();
                        lngController.text =
                            locationMgr.selectedLocation().longitude.toString();
                        state.didChange(locationMgr.textValue());
                        state.save();
                      },
                      child: Column(
                        children: [
                          (state.value == null)
                              ? CircleAvatar(
                                  backgroundColor: avatarBackground,
                                  child:
                                      (state.value == null) ? avatarHint : null,
                                  minRadius: avatarRadius,
                                )
                              : CircleAvatar(
                                  backgroundColor: Colors.green[500],
                                  child:
                                      Icon(Icons.check, color: Colors.white54),
                                  minRadius: avatarRadius,
                                )
                        ],
                      ),
                    ),
                    state.hasError
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text(
                              state.errorText,
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        : Container()
                  ],
                ),
              );
            });
}
