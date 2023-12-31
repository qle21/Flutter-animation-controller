import 'package:flutter/material.dart';

class BorderAndRotationAnimation extends StatefulWidget {
  bool isPressed;

  BorderAndRotationAnimation({required this.isPressed});

  @override
  _BorderAndRotationAnimationState createState() =>
      _BorderAndRotationAnimationState();
}

class _BorderAndRotationAnimationState
    extends State<BorderAndRotationAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;
  double _borderThickness = 2.0;
  Color _borderColor = Colors.blue;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _rotationAnimation = Tween<double>(begin: 0, end: 2 * 3.14159)
        .animate(_animationController);
  }

  @override
  void didUpdateWidget(covariant BorderAndRotationAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isPressed) {
      _borderThickness = 4.0;
      _borderColor = Colors.red;
      _animationController.forward();
    } else {
      _borderThickness = 2.0;
      _borderColor = Colors.blue;
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
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _rotationAnimation.value,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            decoration: BoxDecoration(
              border: Border.all(
                color: _borderColor,
                width: _borderThickness,
              ),
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.isPressed = !widget.isPressed;
                });
              },
              child: CustomPaint(
                size: Size(100, 100),
                painter: TrianglePainter(color: Colors.red), // Customize the color of the triangle
              ),
            ),
          ),
        );
      },
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) => false;
}