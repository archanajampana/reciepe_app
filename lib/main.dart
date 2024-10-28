import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reciepe_app/providers/category_provider.dart';
import 'package:reciepe_app/providers/meal_provider.dart';
import 'package:reciepe_app/screens/grid_screen.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp( DevicePreview(
      builder: (context) => MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => CategoriesProvider()),
        ChangeNotifierProvider(create: (ctx) => MealsProvider()),
      ],
      child: MaterialApp(
        title: 'Recipe App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: CategoriesScreen(),
      ),
    );
  }
}
