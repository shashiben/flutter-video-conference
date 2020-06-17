mixin Validators {
  String validateEmail(String email) {
    RegExp reg = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!reg.hasMatch(email)) {
      return 'Please enter a valid email';
    } else if (email.length < 5) {
      return 'Please enter a valid email';
    }
    return "";
  }

  String validatePassword(String password) {
    if (password.isEmpty) {
      return 'Please Enter Your Password';
    } else if (password.length < 6) {
      return 'Your password must be atleast 6';
    }
    return "";
  }

  String validateName(String name) {
    RegExp reg = new RegExp(r"^[a-zA-Z ]{5,}$");
    if (name.isEmpty) {
      return "Please Enter your name";
    } else if (!reg.hasMatch(name)) {
      return "Enter a valid name";
    }
    return "";
  }
}
