import 'package:get/get.dart';
import 'package:meal_app/presentation/category/categories_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import './route_name.dart';

class AppRoute {
  static List<GetPage> pages = [
    GetPage(
      name: RouteName.categoriesScreen,
      page: () => const CategoriesScreen(),
    ),
    GetPage(
      name: RouteName.mainDrawer,
      page: () => const MainDrawer(),
    ),

    // GetPage(
    //   name: RouteName.tabScreen,
    //   page: () => const (),
    // ),
  ];
}
