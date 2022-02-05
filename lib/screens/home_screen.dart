import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  SharedPreferences? sharedPreferences;

  String? email;
  String? password;

  void initial() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      email = sharedPreferences!.getString('email');
      password = sharedPreferences!.getString('password');

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).scaffoldBackgroundColor ,elevation: 0,),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const[
            Image(image: AssetImage('assets/images/cat.png')),
          ],
        ),
      ),
    );
  }
}
