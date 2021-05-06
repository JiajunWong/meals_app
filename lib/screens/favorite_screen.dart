import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMails;

  const FavoritesScreen(this.favoriteMails);

  @override
  Widget build(BuildContext context) {
    return favoriteMails.isEmpty ? Center(
      child: Text('You have no favorites yet - start to add some.'),
    ) : ListView.builder(
      itemBuilder: (context, index) {
        return MealItem(
          id: favoriteMails[index].id,
          title: favoriteMails[index].title,
          imageUrl: favoriteMails[index].imageUrl,
          duration: favoriteMails[index].duration,
          complexity: favoriteMails[index].complexity,
          affordability: favoriteMails[index].affordability,
        );
      },
      itemCount: favoriteMails.length,
    );
  }
}
