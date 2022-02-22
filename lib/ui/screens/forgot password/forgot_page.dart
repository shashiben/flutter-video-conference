// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_icons/flutter_icons.dart';

// Project imports:
import 'package:video_conference/core/utils/architecture_view.dart';
import 'package:video_conference/ui/screens/forgot%20password/forgot_page_view_model.dart';
import 'package:video_conference/ui/widgets/inputField.dart';

class ForgotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder(
      viewModel: ForgotPasswordViewModel(),
      builder: (context, uiHelpers, dynamic model) => Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          color: Colors.white,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/illustrations/forgot.jpeg",
                  height: 200,
                  width: 250,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),
                InputField(
                  validator: model.updateEmail,
                  error: model.emailError,
                  keyboardType: TextInputType.emailAddress,
                  hint: "Email id",
                  iconData: FlutterIcons.email_search_mco,
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: model.resetPassword,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.pink,
                          border: Border.all(color: Colors.pink)),
                      child: model.isBusy
                          ? CircularProgressIndicator(
                              strokeWidth: 2,
                            )
                          : Text(
                              "Send mail",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontFamily: "Gilroy"),
                            ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
