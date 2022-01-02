class TextValidation {
  String? validateEmail(String value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value) || value == '') {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  String? validateUsername(String value, bool isLogin) {
    if (isLogin) {
      return null;
    } else {
      if (value.length < 4) {
        return 'Username must be at least 4 characters';
      } else {
        return null;
      }
    }
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return 'Password must be at least 8 characters';
    } else {
      return null;
    }
  }

  String? validateConfirmPassword(
      String value, bool isLogin, String passwordController) {
    if (isLogin) {
      return null;
    } else {
      if (value.toString() != passwordController) {
        return "Passwords did't match";
      } else {
        return null;
      }
    }
  }

  String? validateIfNull(String value){
    if (value.isEmpty) {
      return "this field is required";
    }
    return null;

  }
  String? numberValidator(String value,String s) {
    final n = num.tryParse(value);
    if(n == null) {
      return '"$value" is not a valid $s';
    }
    return null;
  }
}

TextValidation textValidation = TextValidation();
