class Supplier {
  //Datos Generales
  String photo_path; //avatar widget
  String name;
  String first_last_name;
  String second_last_name;
  String email;
  String password;

  //Datos Personales
  String birth_date;
  String address;
  String city;
  String phone; // formater??
  String id_num;
  String id_type;

  //Datos Profesionales
  String profession;
  String experience;
  String work_address;
  String work_latitude; // location picker
  String work_longitude;

  //Servicio
  String service;
  String service_name;
  String description;
  String price;
  String schedule; // ¿?

  Supplier saveAccount(String photo, String name, String flname, String slname,
      String email, String password) {
    this.photo_path = photo;
    this.name = name;
    this.first_last_name = flname;
    this.second_last_name = slname;
    this.email = email;
    this.password = password;
    return this;
  }

  dynamic accountData() {
    return {
      'photo': 'photo_path',
      'name': name,
      'first_last_name': first_last_name,
      'second_last_name': second_last_name,
      'email': email,
      'password': password,
    };
  }

  Supplier savePersonal(String birth_date, String address, String city,
      String phone, String id_num, String id_type) {
    this.birth_date = birth_date;
    this.address = address;
    this.city = city;
    this.phone = phone;
    this.id_num = id_num;
    this.id_type = id_type;
    return this;
  }

  dynamic personalData() {
    return {
      'birthdate': birth_date,
      'home_address': address,
      'city': city,
      'phone': phone,
      'id_num': id_num,
      'id_type': id_type,
    };
  }

  Supplier saveProfessional(String profession, String experience,
      String work_address, String work_latitude, String work_longitude) {
    this.profession = profession;
    this.experience = experience;
    this.work_address = work_address;
    this.work_latitude = work_latitude;
    this.work_longitude = work_longitude;
    return this;
  }

  dynamic professionalData() {
    return {
      'profession': profession,
      'experience': experience,
      'work_address': work_address,
      'work_latitude': work_latitude,
      'work_longitude': work_longitude,
    };
  }

  Supplier saveService(String service, String description, String price) {
    this.service = service;
    this.description = description;
    this.price = price;
    return this;
  }

  dynamic serviceData() {
    return {
      'service': service,
      'description': description,
      'price': price,
    };
  }
}
