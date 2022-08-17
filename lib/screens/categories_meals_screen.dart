import 'package:flutter/material.dart';
import '../components/meal_item.dart';
import '../data/dummy_data.dart';
import '../models/category.dart';
import '../models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen(this.meals, {Key? key}) : super(key: key);

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {

    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeal = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeal.length,
        itemBuilder: (ctx, index) {
          return MealItem(categoryMeal[index]);
        },
      ),
    );
  }
}
