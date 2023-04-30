import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/task.dart';
import './screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          primaryColor: Colors.yellow[700],
          fontFamily: 'Lato',
          textTheme: ThemeData.light().textTheme.copyWith(
                titleMedium: const TextStyle(
                  color: Colors.purple,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
                titleSmall: const TextStyle(
                  color: Colors.purple,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
          appBarTheme: AppBarTheme(
            toolbarTextStyle: ThemeData.light().textTheme.copyWith(
                  titleMedium: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ).bodyMedium, titleTextStyle: ThemeData.light().textTheme.copyWith(
                  titleMedium: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ).titleLarge,
          ),
        ),
        title: 'To Do List',
        home: Homepage(),
      ),
    );
  }
}
