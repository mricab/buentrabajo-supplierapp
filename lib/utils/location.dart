import 'package:flutter/material.dart';
import 'package:simple_location_picker/simple_location_picker_screen.dart';
import 'package:simple_location_picker/simple_location_result.dart';

class LocationPicker {
  String _appBarTitle;
  Color _appBarColor;
  Color _appBarTextColor;
  Color _markerColor;
  SimpleLocationResult _selectedLocation;
  SimpleLocationResult _startingLocation;

  LocationPicker(
    String appBarTitle,
    Color appBarColor,
    Color appBarTextColor,
    Color markerColor,
    SimpleLocationResult startingLocation,
  ) {
    _appBarTitle = appBarTitle;
    _appBarColor = appBarColor;
    _appBarTextColor = appBarTextColor;
    _markerColor = markerColor;
    _startingLocation = startingLocation;
  }

  Future getLocation(BuildContext context) async {
    double latitude = _selectedLocation != null
        ? _selectedLocation.latitude
        : _startingLocation.latitude;
    double longitude = _selectedLocation != null
        ? _selectedLocation.longitude
        : _startingLocation.longitude;
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SimpleLocationPicker(
                  initialLatitude: latitude,
                  initialLongitude: longitude,
                  appBarTitle: _appBarTitle,
                  appBarColor: _appBarColor,
                  appBarTextColor: _appBarTextColor,
                  markerColor: _markerColor,
                  displayOnly: false,
                ))).then((value) {
      if (value != null) {
        _selectedLocation = value;
      }
    });
  }

  SimpleLocationResult selectedLocation() {
    return _selectedLocation;
  }

  String textValue() {
    if (_selectedLocation != null) {
      return '${_selectedLocation.latitude}, ${_selectedLocation.longitude}';
    }
    return null;
  }
}
