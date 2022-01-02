//import 'package:demo/helper/animationScaleWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'animation.dart';

class CustomTextFiled {

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  FocusNode emailNode = FocusNode();
  FocusNode usernameNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  FocusNode confirmPasswordNode = FocusNode();

  Widget loginTextField(
      TextEditingController textEditingController,
      FocusNode focusNode,
      int maxLength,
      TextInputType textInputType,
      String labelText,
      FormFieldValidator<String> mValidator,
      Function function,
      bool secure) {
    return AnimationScaleWidget(
      child: Container(
        child: Center(
          child: TextFormField(
            validator: mValidator,
            style: GoogleFonts.meeraInimai(color: Colors.black, fontSize: 17),
            obscureText: secure,
            controller: textEditingController,
            focusNode: focusNode,
            maxLength: maxLength,
            onFieldSubmitted: (value) {
              function();
            },
            keyboardType: textInputType,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: Colors.deepOrange)),
              labelStyle:
              GoogleFonts.meeraInimai(color: Colors.deepOrange, fontSize: 20),
              labelText: labelText,
              contentPadding: EdgeInsets.only(top: 45,left: 30,right: 20),
              counterText: ' ',
              // border: OutlineInputBorder(borderSide: BorderSide.none),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              fillColor: Color(0xFFE6EBEC),
              filled: true,
              isDense: true,
            ),
          ),
        ),
        margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      ),
    );
  }
}

CustomTextFiled customTextFiled = CustomTextFiled();
