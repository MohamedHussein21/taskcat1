import 'package:cat_task1/shared/componant/componant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children:  [
               const Text('Register To Music Festival ',style: TextStyle(
                fontWeight: FontWeight.bold,
                 fontSize: 20
              ),),
                const SizedBox(height: 30,),
                defaultFormField(
                  controller: nameController,
                  type: TextInputType.name,
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Your name';
                    }
                  },
                  label: 'Full name ',
                ),
                const SizedBox(
                  height: 20,
                ),
                defaultFormField(
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Your Email';
                    }
                  },
                  label: 'Email ',
                ),
                const SizedBox(
                  height: 20,
                ),
                defaultFormField(
                  controller: phoneController,
                  type: TextInputType.phone,
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Your num';
                    }
                  },
                  label: 'Mobile Num  ',
                ),
                const SizedBox(
                  height: 20,
                ),
                defaultFormField(
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Your password';
                    }
                  },
                  label: 'password ',
                ),
                const SizedBox(
                  height: 20,
                ),
                defaultFormField(
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Your password';
                    }
                  },
                  label: 'confirm password ',
                ),
                const SizedBox(
                  height: 50,
                ),
                defaultButton(function: (){
                  if(formKey.currentState!.validate()){}
                }, text: 'Register'),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
