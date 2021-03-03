import 'package:supplierapp/models/schedule.dart';

class Service {
  //Service data
  String serviceType;
  String description;
  String price;
  //Service schedule
  List<Schedule> schedules;

  Service(
    String serviceType,
    String description,
    String price,
    //List<Schedule> schedules,
  ) {
    this.serviceType = serviceType;
    this.description = description;
    this.price = price;
    //this.schedules = schedules;
  }
  Map data() {
    return {
      'service': serviceType ?? '',
      'description': description ?? '',
      'price': price ?? '',
    };
  }
}
