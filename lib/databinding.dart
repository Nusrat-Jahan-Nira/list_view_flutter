import 'package:get/get.dart';
import 'package:test_list/testController.dart';

class  DataBinding extends Bindings{

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => TestController());
  }
}