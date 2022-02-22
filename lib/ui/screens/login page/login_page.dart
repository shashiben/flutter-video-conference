// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_icons/flutter_icons.dart';

// Project imports:
import 'package:video_conference/core/utils/architecture_view.dart';
import 'package:video_conference/ui/screens/login%20page/login_page_view_model.dart';
import 'package:video_conference/ui/widgets/circle_checkbox.dart';
import 'package:video_conference/ui/widgets/inputField.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder(
      viewModel: LoginScreenViewModel(),
      onModelReady: (dynamic model) => model.init(),
      builder: (context, uiHelpers, dynamic model) => Scaffold(
        body: Container(
          alignment: Alignment.center,
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    "assets/illustrations/login.jpeg",
                    fit: BoxFit.cover,
                    width: 250,
                    height: 200,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                        fontFamily: "Gilroy",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InputField(
                    controller: model.emailController,
                    validator: model.mailValid(),
                    hint: "Email id",
                    keyboardType: TextInputType.emailAddress,
                    error: model.emailError,
                    iconData: FlutterIcons.email_minus_outline_mco,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputField(
                    controller: model.passController,
                    validator: model.passValid(),
                    hint: "Password",
                    keyboardType: TextInputType.text,
                    iconData: FlutterIcons.textbox_password_mco,
                    obscure: true,
                    error: model.passwordError,
                  ),
                  SizedBox(height: 15),
                  CircleCheckbox(
                      value: model.check,
                      onChanged: (bool? c) {
                        model.checkTap();
                      }),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => model.login(),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            border: Border.all(color: Colors.pink),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Login now",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
