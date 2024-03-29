import 'package:flutter/material.dart';
import 'package:meal_app/data/models/category.dart';
import '../../data/dummy_data.dart';
import 'categories_item.dart';
import 'add_categories_dialog.dart';

class CategoriesScreen extends StatefulWidget {
  static const String routeName = '/categories-screens';
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> listCategories = dummyCategoriesName.toList();

  void _addCategories(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return AddCategoriesDialog(addCategory: _addToListCategories);
        });
  }

  void _addToListCategories(Category value) {
    setState(() {
      listCategories.add(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: listCategories.map((e) {
          return CategoriesItem(category: e);
        }).toList(),
      ),
      floatingActionButton: SizedBox(
        width: 50,
        child: FloatingActionButton(
          onPressed: () => _addCategories(context),
          child: const Icon(Icons.add),
          elevation: 3,
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
