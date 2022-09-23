import 'package:get/get.dart';
import '../controller/meal_screen_controller.dart';

class MealScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MealScreenController());
  }
}
