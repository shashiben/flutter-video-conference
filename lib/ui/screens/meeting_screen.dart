import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:video_conference/model/recent_chat.dart';
import 'package:video_conference/ui/utils/notifications.dart';
import 'package:video_conference/ui/widgets/pull_to_refresh.dart';
import 'package:video_conference/ui/widgets/recent_chat_widget.dart';
import 'package:video_conference/viewmodels/meetingscreen_viewmodel.dart';

class MeetingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MeetingScreenViewModel>.reactive(
      viewModelBuilder: () => MeetingScreenViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Recent Chats"),
        ),
        body: Container(child: BodyScreen()),
      ),
    );
  }
}

class BodyScreen extends StatefulWidget {
  @override
  State createState() {
    return _BodyScreenState();
  }
}

class _BodyScreenState extends State<BodyScreen>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController;

  AnimationController _controller;
  Animation<double> _pullAnimation;

  double _percentage = 0.0;
  bool _isLoading = false;

  double _maxHeight;

  ValueNotifier<bool> _refreshNotifier;
  List<RecentChat> data = [
    RecentChat(
        image:
            "https://firebasestorage.googleapis.com/v0/b/naniz-team.appspot.com/o/1592909787704-CSE_LOGO.png?alt=media&token=7d3b98bc-5d31-4af8-bce8-7171ca6ecf05",
        name: "Shashi",
        uid: "http",
        timeStamp: "22:50",
        lastMessage: "Bye!"),
    RecentChat(
        image:
            "https://firebasestorage.googleapis.com/v0/b/naniz-team.appspot.com/o/1592909787704-CSE_LOGO.png?alt=media&token=7d3b98bc-5d31-4af8-bce8-7171ca6ecf05",
        name: "Luffy",
        uid: "http",
        timeStamp: "yesterday",
        lastMessage: "All the best!"),
    RecentChat(
        image:
            "https://firebasestorage.googleapis.com/v0/b/naniz-team.appspot.com/o/1592909787704-CSE_LOGO.png?alt=media&token=7d3b98bc-5d31-4af8-bce8-7171ca6ecf05",
        name: "Zoro",
        uid: "http",
        timeStamp: "just now",
        lastMessage: "Meet u tomorrow!"),
    RecentChat(
        image:
            "https://firebasestorage.googleapis.com/v0/b/naniz-team.appspot.com/o/1592909787704-CSE_LOGO.png?alt=media&token=7d3b98bc-5d31-4af8-bce8-7171ca6ecf05",
        name: "Name",
        timeStamp: "1 Week ago",
        uid: "http",
        lastMessage: "Hey!")
  ];

  @override
  void initState() {
    _scrollController = ScrollController();

    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 400),
        upperBound: 1.0);

    _pullAnimation = Tween<double>(begin: 1.2, end: 0.0).animate(_controller);

    _pullAnimation.addListener(() {
      setState(() {
        _percentage = _pullAnimation.value;
      });
    });

    _refreshNotifier = ValueNotifier(false);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    _refreshNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    if (_maxHeight == null) {
      _maxHeight =
          (MediaQuery.of(context).size.height * 0.325).clamp(0.0, 180.0);
    }
    return Column(
      children: [
        NotificationListener<LoadingNotification>(
          onNotification: _handleLoadingNotification,
          child: PullToRefreshContainer(
            maxHeight: _maxHeight,
            height: _percentage * _maxHeight,
            refreshNotifier: _refreshNotifier,
          ),
        ),
        Expanded(
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: _handleOverscrollNotification,
            child: NotificationListener<ScrollNotification>(
              onNotification: _handleScrollNotification,
              child: ListView.builder(
                  controller: _scrollController,
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return RecentChatWidget(
                      data: data[index],
                    );
                  }),
            ),
          ),
        )
      ],
    );
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    double deltaOffset = 0.0;

    if (notification is ScrollEndNotification) {
      if (!_isLoading) {
        if (_percentage < 1.05) {
          _reset();
        } else {
          _refreshNotifier.value = !_refreshNotifier.value;
          _relax();
        }
      }
    }

    if (notification is ScrollUpdateNotification) {
      if (notification.dragDetails == null &&
          _percentage >= 1.2 &&
          notification.scrollDelta != 0) {
        _scrollController.jumpTo(_scrollController.offset);
      }
      if (notification.scrollDelta > 0.0) {
        deltaOffset += notification.scrollDelta;
      } else if (_scrollController.offset < 0) {
        deltaOffset += notification.scrollDelta;
      }
    }

    if (notification is OverscrollNotification) {
      if (notification.overscroll < 0.0) {
        deltaOffset += notification.overscroll;
      }
    }

    if (_percentage > 0.0) {
      // We are scrolling the ptr area not the view so make sure the view stays static
      _scrollController.position.correctPixels(0);
    }

    _pull(deltaOffset);

    return false;
  }

  Future<void> _pull(double offset) async {
    // Wait until next event loop to call setState of flutter will yell at you
    await Future<void>.value();

    if (!_isLoading) {
      setState(() {
        _percentage += (-offset / _maxHeight);
        _percentage = _percentage.clamp(0.0, 1.2);
      });
    }
  }

  bool _handleOverscrollNotification(
      OverscrollIndicatorNotification notification) {
    if (notification.depth != 0 || !notification.leading) return false;

    notification.disallowGlow();
    return false;
  }

  bool _handleLoadingNotification(LoadingNotification notification) {
    if (notification is DoneLoadingNotification) {
      _reset();
    } else {
      _isLoading = true;
    }

    return false;
  }

  Future<void> _reset() async {
    // Wait until next event loop to advance animation and call setState or flutter will yell at you
    await Future<void>.value();

    _controller.forward(from: 1.0 - _percentage * 0.83);
    if (_isLoading) {
      setState(() {});
    }
    _isLoading = false;
  }

  Future<void> _relax() async {
    await Future<void>.value();
    _controller.value = 1.0 - _percentage * 0.83;
    _controller.animateTo(0.22);
  }
}
