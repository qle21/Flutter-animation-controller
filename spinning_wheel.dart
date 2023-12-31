import 'package:flutter/material.dart';

class SpinningWheel extends StatefulWidget {
  final bool isPaused;
  final bool isReversed;

  SpinningWheel({required this.isPaused, required this.isReversed});

  @override
  _SpinningWheelState createState() => _SpinningWheelState();
}

class _SpinningWheelState extends State<SpinningWheel>
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

    _animation = Tween<double>(begin: 0, end: 2 * 3.14159).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );

    if (!widget.isPaused) {
      _animationController.repeat(reverse:true);
    }
  }

  @override
  void didUpdateWidget(SpinningWheel oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isPaused) {
      _animationController.stop();
    } else {
      if (widget.isReversed) {
        _animationController.reverse();
        _animationController.repeat(reverse:false);
      } else {
        _animationController.forward();
        _animationController.repeat(reverse:true);
      }
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
        return Transform.rotate(
          angle: _animation.value,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
            child: Center(
              child: Text(
                'Spinning Wheel',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
