import 'package:supplierapp/models/user.dart';

class Person {
  //Person data
  String avatar;
  String name;
  String first_last_name;
  String second_last_name;
  String birth_date;
  String home_address;
  String city;
  String phone;
  String id_num;
  String id_type;
  //Person objects
  User user = new User();

  Person();

  Map data() {
    return {
      'name': name ?? '',
      'first_last_name': first_last_name ?? '',
      'second_last_name': second_last_name ?? '',
      'birth_date': birth_date ?? '',
      'home_address': home_address ?? '',
      'city': city ?? '',
      'phone': phone ?? '',
      'id_num': id_num ?? '',
      'id_type': id_type ?? '',
    };
  }

  Map files() {
    return {
      'avatar': [avatar, 'image'] ?? '',
    };
  }
}
