import 'package:get/get.dart';
import '../controller/tab_screen_controller.dart';

class TabScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TabScreenController());
  }
}
