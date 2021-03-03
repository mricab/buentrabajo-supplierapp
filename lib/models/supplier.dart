import 'dart:io';

import 'package:supplierapp/models/person.dart';
import 'package:supplierapp/models/service.dart';

class Supplier extends Person {
  //Supplier data
  String profession;
  String experience;
  String work_address;
  String work_latitude;
  String work_longitude;
  //Supplier objects
  List<Service> services = List();

  Supplier();

  void setPerson(
    String avatar,
    String name,
    String first_last_name,
    String second_last_name,
    String birth_date,
    String address,
    String city,
    String phone,
    String id_num,
    String id_type,
  ) {
    this.avatar = avatar;
    this.name = name;
    this.first_last_name = first_last_name;
    this.second_last_name = second_last_name;
    this.birth_date = birth_date;
    this.home_address = address;
    this.city = city;
    this.phone = phone;
    this.id_num = id_num;
    this.id_type = id_type;
  }

  void setSupplier(
    String profession,
    String experience,
    String work_address,
    String work_latitude,
    String work_longitude,
  ) {
    this.profession = profession;
    this.experience = experience;
    this.work_address = work_address;
    this.work_latitude = work_latitude;
    this.work_longitude = work_longitude;
  }

  Map _supplierData() {
    return {
      'profession': profession ?? '',
      'experience': experience ?? '',
      'work_address': work_address ?? '',
      'work_latitude': work_latitude ?? '',
      'work_longitude': work_longitude ?? '',
    };
  }

  Map _servicesData() {
    Map m = new Map();
    for (int i = 0; i < services.length; i++) {
      Service s = services.elementAt(i);
      m['services'] = {
        i: s.data(),
      };
    }
    return m;
  }

  Map _firstServiceData() {
    if (services.length >= 1) {
      Service s = services.elementAt(0);
      return s.data();
    }
    return null;
  }

  void addService(Service service) {
    services.add(service);
  }

  Map data() {
    return {
      ...?super.data(),
      ...?_supplierData(),
      ...?user.data(),
      ...?_firstServiceData(),
    };
  }

  Map files() {
    return super.files();
  }
}
