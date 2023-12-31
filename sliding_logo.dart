import 'package:flutter/material.dart';

class SlideAnimation extends StatefulWidget {
  final bool isPressed;

  SlideAnimation({required this.isPressed});

  @override
  _SlideAnimationState createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(1, 0))
        .animate(_animationController);
    _colorAnimation = ColorTween(begin: Colors.blue, end: Colors.red)
        .animate(_animationController);
  }

  @override
  void didUpdateWidget(covariant SlideAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isPressed) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: AnimatedBuilder(
        animation: _colorAnimation,
        builder: (BuildContext context, Widget? child) {
          return ColorFiltered(
            colorFilter: ColorFilter.mode(
              _colorAnimation.value ?? Colors.transparent,
              BlendMode.modulate,
            ),
            child: FlutterLogo(
              size: 100,
            ),
          );
        },
      ),
    );
  }
}
