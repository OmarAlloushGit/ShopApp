import 'package:flutter/material.dart';
import 'package:untitled11/apis/apis.dart';
import 'package:untitled11/helper/connect_screen.dart';
import 'package:untitled11/helper/text_validation.dart';
import 'package:untitled11/helper/textfield.dart';
import 'package:untitled11/main.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20, bottom: 10),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, bottom: 20),
                    child: const Text(
                      'sign up now to see our hot offers',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  customTextFiled.loginTextField(
                      customTextFiled.emailController,
                      customTextFiled.emailNode,
                      40,
                      TextInputType.emailAddress,
                      'E-mail',
                          (value) => textValidation.validateEmail(value.toString()),
                          () {
                        customTextFiled.usernameNode.requestFocus();
                      }, false),
                  customTextFiled.loginTextField(
                      customTextFiled.usernameController,
                      customTextFiled.usernameNode,
                      40,
                      TextInputType.name,
                      'Username',
                          (value) => textValidation.validateUsername(
                          value.toString(), false), () {
                    customTextFiled.passwordNode.requestFocus();
                  }, false),
                  customTextFiled.loginTextField(
                      customTextFiled.passwordController,
                      customTextFiled.passwordNode,
                      40,
                      TextInputType.name,
                      'Password',
                          (value) =>
                          textValidation.validatePassword(value.toString()),
                          () {
                        customTextFiled.confirmPasswordNode.requestFocus();
                      }, true),
                  customTextFiled.loginTextField(
                      customTextFiled.confirmPasswordController,
                      customTextFiled.confirmPasswordNode,
                      40,
                      TextInputType.visiblePassword,
                      'Confirm Password',
                          (value) => textValidation.validateConfirmPassword(
                          value.toString(),
                          false,
                          customTextFiled.passwordController.text), () {
                    customTextFiled.confirmPasswordNode.unfocus();
                  }, true),
                  Center(
                    child: InkWell(
                      onTap: () async {
                        if (formKey.currentState?.validate() == true) {
                          apiProvider
                              .regesterApi(
                              customTextFiled.emailController.text,
                              customTextFiled.passwordController.text,
                              customTextFiled.usernameController.text,
                              customTextFiled
                                  .confirmPasswordController.text,
                              'facebook',
                              'whatsapp',
                              '20',
                              '0991967155')
                              .then((value) {
                            token='${value?.body.split("access_token\":")[1].split('}')[0].toString()}';
                            print(token);
                            print('Done: ${value?.body}');
                            linkingScreen.goToNextScreenAndRemove(
                                context,   MyApp(token));
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: const Center(
                          child: Text(
                            'Sign Up',
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
                        'Already have an account?',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          linkingScreen.goToNextScreen(
                              context, const LoginScreen(),
                              isReplacement: true);
                        },
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
