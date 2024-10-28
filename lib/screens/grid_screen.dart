import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reciepe_app/providers/category_provider.dart';
import 'package:reciepe_app/screens/meals_list.dart';


class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<CategoriesProvider>(context).categories;
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Color(0xffAA47BC),
        // title: Text('Categories',style: TextStyle(color: Colors.white),),
        actions: [Icon(Icons.favorite_border_sharp,color: Colors.white,)],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/ 2,
          
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (ctx, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => CategoryMealsScreen(category.id, category.name),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(category.color),
              ),
              child: Center(
                child: Text(
                  category.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
