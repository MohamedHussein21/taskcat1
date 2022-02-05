import 'package:cat_task1/screens/home_screen.dart';
import 'package:cat_task1/screens/register/register.dart';
import 'package:cat_task1/shared/componant/componant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  SharedPreferences? sharedPreferences;
  bool? newuser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checklogin();
  }
  void checklogin() async {
    sharedPreferences = await SharedPreferences.getInstance();
    newuser = (sharedPreferences!.getBool('login') ?? true);
    debugPrint(newuser.toString());
    if (newuser == false) {
      navigateAndFinish(context,const Home());
    }
  }
  // Future init() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0, left: 25, right: 25),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Center(
                    child: Image.asset(
                      "assets/images/logo.png",
                      scale: 8,
                    )),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Image(
                                  image:
                                  AssetImage("assets/images/facebook_Logo.png"),
                                  height: 35.0),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Facebook',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                    OutlinedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Image(
                                  image:
                                  AssetImage("assets/images/google_Logo.png"),
                                  height: 35.0),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Google',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                    child: Text(
                      'Or',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )),
                defaultFormField(
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Your Email';
                    }
                  },
                  label: 'Email ID',
                ),
                const SizedBox(
                  height: 20,
                ),
                defaultFormField(
                  isPassword: true,
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Your password';
                    }
                  },
                  label: 'Password',
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () {},
                        child: const Text('Forgot Password ?',
                          style: TextStyle(color: Colors.black),))
                  ],),
                const SizedBox(height: 20,),
                defaultButton(function: () {
                 String email = emailController.text;
                 String password = passwordController.text;
                 //نمشيها ان الباس  سترينج دلوقتي
                 if(email != '' &&password!= '') {
                   sharedPreferences!.setBool('login', false);
                   sharedPreferences!.setString('email', email);
                   sharedPreferences!.setString('email', password);
                   navigateAndFinish(context,const Home());
                 }
                }, text: 'Login'),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t Have any account ?'),
                    TextButton(onPressed: () {
                      navigateTo(context,const RegisterScreen());
                    },
                        child: const Text(
                          'Register ', style: TextStyle(color: Colors.black),))
                  ],),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future save() async {
   await sharedPreferences!.setString('email', emailController.text.toString());
   await sharedPreferences!.setString(
        'password', passwordController.text.toString());
  }
}