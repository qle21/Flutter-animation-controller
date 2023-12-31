import 'package:flutter/material.dart';

class BouncingBall extends StatefulWidget {
  final bool isPaused;
  final bool isReversed;

  BouncingBall({required this.isPaused, required this.isReversed});

  @override
  _BouncingBallState createState() => _BouncingBallState();
}

class _BouncingBallState extends State<BouncingBall>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 200).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    if (!widget.isPaused) {
      _animationController.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(BouncingBall oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isPaused) {
      _animationController.stop();

    } else {
      if ( widget.isReversed) {
            _animationController.reverse(from: 200);
      } else {
            _animationController.reverse(from: 0);
      }
      _animationController.repeat(reverse: true);
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
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
          ),
        );
      },
    );
  }
}
