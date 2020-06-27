import 'package:flutter/material.dart';
import 'package:video_conference/ui/utils/notifications.dart';
import 'package:video_conference/ui/widgets/image_motion.dart';

class PullToRefreshContainer extends StatelessWidget {
  final double maxHeight;
  final double height;
  final ChangeNotifier refreshNotifier;

  PullToRefreshContainer({this.maxHeight, this.height, this.refreshNotifier});

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      width: width,
      child: ClipRect(
        child: Container(
          child: BasketballPTRContainerAnimation(
            maxHeight: maxHeight,
            height: height,
            refreshNotifier: refreshNotifier,
          ),
        ),
      ),
    );
  }
}

class BasketballPTRContainerAnimation extends StatefulWidget {
  final double maxHeight;
  final double height;
  final ChangeNotifier refreshNotifier;

  BasketballPTRContainerAnimation(
      {this.maxHeight = 180, this.height = 0, this.refreshNotifier});

  @override
  State createState() {
    return _BasketballPTRContainerAnimationState(
        maxHeight, height, refreshNotifier);
  }
}

class _BasketballPTRContainerAnimationState
    extends State<BasketballPTRContainerAnimation>
    with SingleTickerProviderStateMixin {
  final double _maxHeight;
  double _height;

  AnimationController _controller;
  Animation<double> _scaleAnimation;

  ChangeNotifier _refreshNotifier;

  _BasketballPTRContainerAnimationState(
      this._maxHeight, this._height, this._refreshNotifier);

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(seconds: 2, milliseconds: 500));

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.5, end: 0.0)
            .chain(CurveTween(curve: ElasticOutCurve(0.65)).chain(
          Tween<double>(begin: 0.0, end: 0.5),
        )),
        weight: 2.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 0.0),
        weight: 5.0,
      ),
    ]).animate(_controller);

    _controller.addListener(() {
      setState(() {});
      if (_controller.value > 0.9) {
        DoneLoadingNotification()..dispatch(context);
      }
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        LoadingNotification()..dispatch(context);
      }
    });

    _refreshNotifier.addListener(() {
      _controller.forward(from: 0.0);
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(BasketballPTRContainerAnimation oldWidget) {
    if (oldWidget.height != widget.height) {
      setState(() {
        _height = widget.height;
        if (_height == 0) {
          _controller.reset();
        }
      });
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(context) {
    final appSize = MediaQuery.of(context).size;

    final scale = 0.8 -
        Curves.easeIn.transform((_height / _maxHeight) / 2.0) *
            _scaleAnimation.value;

    final centerX = appSize.width / 2;
    final backboardWidth = 0.8 * _maxHeight * scale;
    final netWidth = 0.35 * _maxHeight * scale;
    final rimWidth = 0.4 * _maxHeight * scale;

    final backboardHeight = backboardWidth * 0.69375;
    final netHeight = netWidth * 0.984375;
    final rimHeight = rimWidth * 0.121739;

    final yOffset = _maxHeight * 0.08;

    final startY = yOffset * 3.0;
    final backboardY = startY + backboardHeight / 2;
    final rimY = backboardY + backboardHeight * 0.33;
    final netY = rimY + netHeight * 0.5;

    String refreshText = '';
    if (_controller.value > 6 / 7) {
      refreshText = 'Updated!';
    } else if (_controller.isAnimating) {
      refreshText = 'Checking for updates!';
    } else if (_height / _maxHeight >= 1.05) {
      refreshText = 'Release to update data';
    } else {
      refreshText = 'Swipe down to refresh';
    }

    List<Widget> children = <Widget>[
      Positioned(
        left: 0,
        top: yOffset,
        width: appSize.width,
        child: Text(refreshText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF808080),
              fontFamily: 'Gilroy',
              fontSize: 12,
            )),
      ),
      Positioned(
        left: centerX - backboardWidth / 2,
        top: backboardY - backboardHeight / 2,
        width: backboardWidth,
        child: Image(image: AssetImage('assets/images/backboard.png')),
      ),
      Positioned(
        left: centerX - netWidth / 2,
        top: netY - netHeight / 2,
        width: netWidth,
        child: Image(image: AssetImage('assets/images/net.png')),
      ),
      Positioned(
        left: 50,
        child: Image.asset("assets/images/rocket.png"),
      ),
      Positioned(
        left: centerX - rimWidth / 2,
        top: rimY - rimHeight / 2,
        width: rimWidth,
        child: Image(
          image: AssetImage('assets/images/rim.png'),
          width: 50,
        ),
      ),
    ];

    children.insert(_controller.value > 0.28 ? 2 : 4,
        SpinningBasketball(controller: _controller, maxHeight: _maxHeight));
    return Stack(
      children: children,
    );
  }
}
