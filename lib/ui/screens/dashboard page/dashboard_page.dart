import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:video_conference/core/utils/architecture_view.dart';
import 'package:video_conference/ui/screens/dashboard%20page/dashboard_page_view_model.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder(
      viewModel: DashboardPageViewModel(),
      builder: (context, uiHelpers, model) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: model.index,
          onTap: model.changeIndex,
          selectedLabelStyle:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12,
          ),
          items: [
            BottomNavigationBarItem(
                icon: Icon(FlutterIcons.message_circle_fea), label: "Messages"),
            BottomNavigationBarItem(
                icon: Icon(FlutterIcons.phone_call_fea), label: "History"),
            BottomNavigationBarItem(
                icon: Icon(FlutterIcons.users_fea), label: "Contacts"),
          ],
        ),
      ),
    );
  }
}
