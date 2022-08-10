import 'package:flutter/material.dart';
import 'package:projeto_refeicoes/components/meal_item.dart';
import 'package:projeto_refeicoes/data/dummy_data.dart';

import '../models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeal = DUMMY_MEALS.where((meal) {
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
