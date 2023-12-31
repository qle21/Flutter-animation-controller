import 'package:flutter/material.dart';

class CircleAnimation extends StatefulWidget {
  final bool isPressed;

  CircleAnimation({required this.isPressed});

  @override
  _CircleAnimationState createState() => _CircleAnimationState();
}

class _CircleAnimationState extends State<CircleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0, end: 100).animate(_animationController);
  }

  @override
  void didUpdateWidget(covariant CircleAnimation oldWidget) {
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
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Center(
          child: Container(
            width: _animation.value,
            height: _animation.value,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
          ),
        );
      },
    );
  }
}
