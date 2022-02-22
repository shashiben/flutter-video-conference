// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// Project imports:
import 'package:video_conference/app/locator.dart';
import 'package:video_conference/app/snackbar_ui.dart';
import 'package:video_conference/app/theme.dart';
import 'package:video_conference/core/services/authentication_service.dart';
import 'package:video_conference/ui/screens/auth%20page/auth_page.dart';
import 'package:video_conference/ui/screens/dashboard%20page/dashboard_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  setupSnackbarUi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => MyAppViewModel(),
      builder: (context, dynamic model, child) => MaterialApp(
          navigatorKey: StackedService.navigatorKey,
          theme: themeData(context),
          home: model.isUserLogged() ? DashboardPage() : AuthPage()),
    );
  }
}

class MyAppViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  bool isUserLogged() {
    return _authenticationService.isUserLoggedIn();
  }
}
