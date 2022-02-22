// Dart imports:
import 'dart:math' as math;
import 'dart:ui' as ui;

// Flutter imports:
import 'package:flutter/material.dart';

class SineCurve extends Curve {
  final double start;
  final double length;

  SineCurve({this.start = 0.0, this.length = math.pi * 2});

  @override
  double transformInternal(double d) {
    return math.sin(start + d * length) * 0.5 + 0.5;
  }
}

class SpinningBasketball extends StatefulWidget {
  final AnimationController? controller;
  final double? maxHeight;

  SpinningBasketball({this.controller, this.maxHeight})
      : super(key: ValueKey(controller));

  @override
  State createState() {
    return _SpinningBasketballState(controller, maxHeight);
  }
}

class _SpinningBasketballState extends State<SpinningBasketball>
    with SingleTickerProviderStateMixin {
  double? _maxHeight;

  AnimationController? _controller;

  late Animation<double> _spriteAnimation;

  late Animation<double> _xAnimation;
  late Animation<double> _yAnimation;
  late Animation<double> _scaleAnimation;

  _SpinningBasketballState(this._controller, this._maxHeight);

  @override
  void initState() {
    final cosCurve = SineCurve(start: -math.pi / 2, length: math.pi * 4);
    final sineCurve = SineCurve(length: math.pi * 4);

    _spriteAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 19.0),
        weight: 2,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 20.0, end: 39.0),
        weight: 2,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 20.0, end: 39.0),
        weight: 2,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 40.0, end: 59.0),
        weight: 1,
      ),
    ]).animate(_controller!);

    _xAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 0.08),
        weight: 1.2,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.08, end: 0.12),
        weight: 0.6,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.12, end: -0.12)
            .chain(CurveTween(curve: cosCurve)),
        weight: 4.2,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.12, end: 0.0)
            .chain(CurveTween(curve: Curves.easeInSine)),
        weight: 1,
      ),
    ]).animate(_controller!);

    _yAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.70, end: -0.72)
            .chain(CurveTween(curve: Curves.easeOutSine)),
        weight: 1.3,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: -0.72, end: 0.02).chain(
            CurveTween(curve: SineCurve(start: -math.pi / 2, length: math.pi))),
        weight: 0.7,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(0.02),
        weight: 4.00,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.02, end: 0.30)
            .chain(CurveTween(curve: Curves.easeInCubic)),
        weight: 1,
      ),
    ]).animate(_controller!);

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: ConstantTween<double>(1.0),
        weight: 2,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.05, end: 0.9)
            .chain(CurveTween(curve: sineCurve)),
        weight: 4,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(1.0),
        weight: 1,
      ),
    ]).animate(_controller!);

    _controller!.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(context) {
    final appSize = MediaQuery.of(context).size;

    double scaledWidth = 0.3 * _maxHeight! * _scaleAnimation.value * 0.8;
    double scaledHeight = 0.3 * _maxHeight! * _scaleAnimation.value * 0.8;

    final yOffset = _maxHeight! * 0.08;
    final backboardWidth = 0.8 * _maxHeight! * 0.8;
    final backboardHeight = backboardWidth * 0.69375;
    final startY = yOffset * 3.0;
    final backboardY = startY + backboardHeight / 2;
    final rimY = backboardY + backboardHeight * 0.33;

    // Draw the ball from a sprite sheet, position according to the animation
    return Positioned(
      left: _xAnimation.value * 160 * ((appSize.width / 320).clamp(1, 1.5)) +
          appSize.width / 2 -
          scaledWidth / 2,
      top: _yAnimation.value * _maxHeight! / 2 + rimY - scaledHeight,
      width: scaledWidth,
      height: scaledHeight,
      child: AnimatedSprite(
        image: AssetImage('assets/images/basketball.png'),
        frameWidth: 400,
        frameHeight: 400,
        animation: _spriteAnimation,
      ),
    );
  }
}

class AnimatedSprite extends AnimatedWidget {
  final ImageProvider image;
  final int frameWidth;
  final int? frameHeight;

  AnimatedSprite({
    Key? key,
    required this.image,
    required this.frameWidth,
    this.frameHeight,
    required Animation<double> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Sprite(
      image: image,
      frameWidth: frameWidth,
      frameHeight: frameHeight,
      frame: animation.value,
    );
  }
}

class Sprite extends StatefulWidget {
  final ImageProvider image;
  final int frameWidth;
  final int? frameHeight;
  final num frame;

  Sprite(
      {Key? key,
      required this.image,
      required this.frameWidth,
      this.frameHeight,
      this.frame = 0})
      : super(key: key);

  @override
  _SpriteState createState() => _SpriteState();
}

class _SpriteState extends State<Sprite> {
  ImageStream? _imageStream;
  ImageInfo? _imageInfo;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getImage();
  }

  @override
  void didUpdateWidget(Sprite oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.image != oldWidget.image) {
      _getImage();
    }
  }

  void _getImage() {
    final ImageStream? oldImageStream = _imageStream;
    _imageStream = widget.image.resolve(createLocalImageConfiguration(context));
    if (_imageStream!.key == oldImageStream?.key) {
      return;
    }
    final ImageStreamListener listener = ImageStreamListener(_updateImage);
    oldImageStream?.removeListener(listener);
    _imageStream!.addListener(listener);
  }

  void _updateImage(ImageInfo imageInfo, bool synchronousCall) {
    setState(() {
      _imageInfo = imageInfo;
    });
  }

  @override
  void dispose() {
    _imageStream?.removeListener(ImageStreamListener(_updateImage));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ui.Image? img = _imageInfo?.image;
    if (img == null) {
      return SizedBox();
    }
    int w = img.width, frame = widget.frame.round();
    int? frameW = widget.frameWidth, frameH = widget.frameHeight;
    int cols = (w / frameW).floor();
    int col = frame % cols, row = (frame / cols).floor();
    ui.Rect rect = ui.Rect.fromLTWH(
        col * frameW * 1.0, row * frameH! * 1.0, frameW * 1.0, frameH * 1.0);
    return CustomPaint(painter: _SpritePainter(img, rect));
  }
}

class _SpritePainter extends CustomPainter {
  ui.Image image;
  ui.Rect rect;

  _SpritePainter(this.image, this.rect);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImageRect(image, rect,
        ui.Rect.fromLTWH(0.0, 0.0, size.width, size.height), Paint());
  }

  @override
  bool shouldRepaint(_SpritePainter oldPainter) {
    return oldPainter.image != image || oldPainter.rect != rect;
  }
}
