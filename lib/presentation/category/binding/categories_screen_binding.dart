import 'package:get/get.dart';
import 'package:meal_app/presentation/category/controller/categories_screen_controller.dart';

class CategoriesScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoriesScreenController());
  }
}
