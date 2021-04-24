import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:video_conference/app/locator.dart';
import 'package:video_conference/core/services/authentication_service.dart';
import 'package:video_conference/ui/screens/auth%20page/auth_page.dart';
import 'package:video_conference/ui/screens/dashboard%20page/dashboard_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => MyAppViewModel(),
      builder: (context, model, child) => MaterialApp(
          home: model.isUserLogged() ? DashboardPage() : AuthPage()),
    );
  }
}

class MyAppViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  bool isUserLogged() {
    return _authenticationService.getUid() != null;
  }
}
