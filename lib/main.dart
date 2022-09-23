import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/theme/app_themes.dart';
import 'presentation/category/categories_screen.dart';
import 'presentation/category/categories_meal_screen.dart';
import 'presentation/meal_item/meal_item_detail_screen.dart';
import 'presentation/tab/tabs_screen.dart';
import 'presentation/filter/filters-screen.dart';
import 'data/models/meal.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> currentlyFilter = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> favoriteMeals = [];

  void setFilters(Map<String, bool> selectedFilters) {
    setState(() {
      currentlyFilter = selectedFilters;
    });
  }

  bool isExisting(Meal meal) {
    return favoriteMeals.contains(meal);
  }

  void markFavorite(String mealID) {
    final existingIndex =
        favoriteMeals.indexWhere((element) => element.id == mealID);
    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeals
            .add(dummyMeal.firstWhere((element) => element.id == mealID));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal Planner',
      theme: AppThemes.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(favoriteMeals: favoriteMeals),
        CategoriesMealScreen.routeName: (context) =>
            CategoriesMealScreen(filters: currentlyFilter),
        MealItemDetailScreen.routeName: (context) => MealItemDetailScreen(
            markFavorite: markFavorite, isExisting: isExisting),
        CategoriesScreen.routeName: (context) => const CategoriesScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(
            selectFilter: setFilters, currentlyFilters: currentlyFilter),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (context) => const CategoriesScreen());
      },
    );
  }
}
