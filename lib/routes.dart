import 'package:get/get.dart';

import 'databinding.dart';
import 'home.dart';

class Routes{

  static final routes = [
    GetPage(name: '/home',
      page: () => Home(),
      binding:  DataBinding(),),


  ];
}