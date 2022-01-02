import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled11/apis/apis.dart';
import 'package:untitled11/helper/connect_screen.dart';
import 'package:untitled11/helper/text_validation.dart';
import 'package:untitled11/helper/textfield.dart';
import 'package:untitled11/main.dart';
import 'new_registar_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
   String token='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20, bottom: 10),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, bottom: 20),
                          child: const Text(
                            'Login now to see our hot offers',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        customTextFiled.loginTextField(
                            customTextFiled.emailController,
                            customTextFiled.emailNode,
                            40,
                            TextInputType.text,
                            'E-mail',
                            (value) =>
                                textValidation.validateEmail(value.toString()),
                            () {
                          customTextFiled.passwordNode.requestFocus();
                        }, false),
                        customTextFiled.loginTextField(
                            customTextFiled.passwordController,
                            customTextFiled.passwordNode,
                            40,
                            TextInputType.text,
                            'Password',
                            (value) => textValidation
                                .validatePassword(value.toString()), () {
                          customTextFiled.confirmPasswordNode.unfocus();
                        }, true),
                        Center(
                          child: InkWell(
                            onTap: () async {
                              if (formKey.currentState?.validate() == true) {
                                apiProvider
                                    .loginApi(
                                        customTextFiled.emailController.text,
                                        customTextFiled.passwordController.text)
                                    .then((value) {
                                      try{
                                        token='${value?.body.split("access_token\":")[1].split('}')[0].toString()}';

                                      }catch(e){
                                        print(e);

                                      }
                                      if(token!=''){
                                        linkingScreen.goToNextScreenAndRemove(
                                            context, MyApp(token));
                                      }else{
                                        print(value?.body.split('{"message":')[1]);
                                      }

                                });
                              }
                            },
                            child: Container(
                              width: 200,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: const Center(
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t Have an account yet ?',
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextButton(
                              onPressed: () {
                                linkingScreen.goToNextScreen(
                                    context, const SignupScreen(),
                                    isReplacement: true);
                              },
                              child: const Text('Sign up'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
