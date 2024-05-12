import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todoappli/controller/controller.dart';
import 'package:provider_todoappli/view/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Todocontroller(),
          )
        ],
        child: MaterialApp(
          title: 'Todo App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.pink,
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: const Homescreen(),
        ));
  }
}
