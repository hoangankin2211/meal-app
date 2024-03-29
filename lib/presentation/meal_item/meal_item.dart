import 'package:flutter/material.dart';
import 'package:meal_app/data/models/meal.dart';
import 'package:meal_app/presentation/meal_item/meal_item_detail_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function(String) removeItem;
  const MealItem({Key? key, required this.meal, required this.removeItem})
      : super(key: key);

  String? get complexityText {
    switch (meal.complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String? get affordabilityText {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealItemDetailScreen.routeName, arguments: meal)
        .then(
      (value) {
        if (value != null) removeItem(meal.id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 220,
                    color: Colors.black54,
                    child: Text(
                      meal.title,
                      style: const TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.schedule,
                            size: constraints.maxWidth * 0.3 / 4,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            '${meal.duration} min',
                            style: const TextStyle(fontSize: 17),
                            textScaleFactor: constraints.maxWidth * 0.3 / 100,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.schedule,
                            size: constraints.maxWidth * 0.3 / 4,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            '$affordabilityText',
                            style: const TextStyle(fontSize: 16),
                            textScaleFactor: constraints.maxWidth * 0.3 / 100,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.schedule,
                            size: constraints.maxWidth * 0.3 / 4,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            '$complexityText',
                            style: const TextStyle(fontSize: 17),
                            textScaleFactor: constraints.maxWidth * 0.3 / 100,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
