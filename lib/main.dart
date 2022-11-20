import 'package:flutter/material.dart';
import 'package:projet_flutter_sqlite/views/Pages/Home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter DB',
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}
