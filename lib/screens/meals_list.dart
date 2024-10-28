import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reciepe_app/providers/meal_provider.dart';
import 'package:reciepe_app/screens/detailed_meals.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryName;

  CategoryMealsScreen(this.categoryId, this.categoryName);

  @override
  Widget build(BuildContext context) {
    final meals = Provider.of<MealsProvider>(context).getMealsByCategory(categoryId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffAA47BC),
        title: Text(categoryName,style: TextStyle(color: Colors.white),),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          final meal = meals[index];
          return Card(
            elevation: 5,
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => MealDetailScreen(meal: meal),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          meal.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Icon(Icons.favorite_border,color: Colors.black,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
