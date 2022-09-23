import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'presentation/category/categories_screen.dart';
import 'presentation/category/categories_meal_screen.dart';
import 'presentation/meal_item/meal_item_detail_screen.dart';
import 'presentation/tab/tabs_screen.dart';
import 'presentation/filter/filters-screen.dart';
import 'data/models/meal.dart';

void main() {
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
    return MaterialApp(
      title: 'Meal App',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.orange[300],
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 30,
            fontWeight: FontWeight.normal,
          ),
          headline2: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
          headline3: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 12.5,
            fontWeight: FontWeight.w600,
          ),
          caption: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Colors.red,
          ),
        ),
      ),
      // home: const CategoriesScreen(),
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
