import 'package:get/get.dart';
import 'package:meal_app/presentation/favorite/controller/favorite_screen_controler.dart';

class FavoriteScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoriteScreenController());
  }
}
