import 'package:auto_route/auto_route_annotations.dart';
import 'package:video_conference/ui/screens/auth_screen.dart';
import 'package:video_conference/ui/screens/chat_screen.dart';
import 'package:video_conference/ui/screens/create_profile.dart';
import 'package:video_conference/ui/screens/dashboard_screen.dart';
import 'package:video_conference/ui/screens/home_screen.dart';
import 'package:video_conference/ui/screens/splashscreen.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  SplashScreen splashViewRoute;

  HomeScreen homeScreenRoute;
  AuthScreen authScreenRoute;
  Dashboard dashboardRoute;
  ChatScreen chatScreenRoute;
  CreateProfile createProfileRoute;
}
