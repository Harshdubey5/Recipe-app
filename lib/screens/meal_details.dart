import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailscreen extends StatelessWidget {
  const MealDetailscreen({
    super.key,
    required this.meal,
    required this.onToggleFavorite,
  });

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavorite(meal);
            },
            icon: const Icon(
              Icons.star,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 14),
            Text(
              'Ingredients:',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10), // Adding some space between texts
            // Assuming meal.ingredients is a list of ingredients
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: meal.ingredients.map((ingredient) {
                return Text(
                  ' $ingredient',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 14,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 14),
            Text(
              'Steps:',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10), // Adding some space between texts
            // Centering and spacing out the steps list
            Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment:
                  MainAxisAlignment.spaceAround, // Adjust the spacing as needed
              children: meal.steps.map((step) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 6.0,
                      vertical: 6.0), // Adding vertical space between steps
                  child: Text(
                    textAlign: TextAlign.center,
                    ' $step',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 14,
                    ),
                  ),
                );
              }).toList(),
            )),
          ],
        ),
      ),
    );
  }
}
