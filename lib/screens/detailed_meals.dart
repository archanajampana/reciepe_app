import 'package:flutter/material.dart';
import 'package:reciepe_app/models/meals_model.dart'; 

class MealDetailScreen extends StatelessWidget {
  final Meal meal; 

  MealDetailScreen({required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Color(0xffAA47BC),
        title: Text(meal.title,style: TextStyle(color: Colors.white),),
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                meal.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    'Ingredients',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: meal.ingredients.map((ingredient) {
                    return Card(
                      color: const Color.fromARGB(255, 214, 200, 200),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          ingredient,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    'Steps to prepare',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 176, 159, 6)),
                  ),
                ],
              ),
            ),
          
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) {
                  return Text(
                    '${index + 1}. ${meal.steps[index]}',
                    style: TextStyle(fontSize: 18),
                  );
                  
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
