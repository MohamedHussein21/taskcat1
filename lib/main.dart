import 'package:cat_task1/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(
            color: Colors.black
          ),
          color: Theme.of(context).scaffoldBackgroundColor
        ),

      ),
      home: const LoginScreen(),
    );
  }
}

