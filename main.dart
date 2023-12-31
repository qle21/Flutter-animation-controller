import 'package:flutter/material.dart';
import 'bouncing_ball.dart'; // Import the bouncing_ball.dart file
import 'spinning_wheel.dart';
import 'rotating_cube.dart';
import 'BorderAndRotationAnimation.dart'; // Import the BorderAndRotationAnimation.dart file
import 'circle_animation.dart';
import 'sliding_logo.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fragments App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FragmentsScreen(),
    );
  }
}

class FragmentsScreen extends StatefulWidget {
  @override
  _FragmentsScreenState createState() => _FragmentsScreenState();
}

class _FragmentsScreenState extends State<FragmentsScreen> {
  List<String> animations = [
    "Bouncing Ball",
    "Spinning Wheel",
    "Rotating Cube",
    "Border Rotation",
    "Circle Expanding",
    "Logo Change Color",
  ];

  String selectedAnimation = "";
  bool isPaused = false;
  bool isReversed = false;
  bool tap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fragments App'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: selectedAnimation.isEmpty ? 1 : 1,
            child: Container(
              color: Colors.yellow, // Set the background color to yellow
              child: ListView.builder(
                itemCount: animations.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black), // Add a bottom border
                      ),
                      color: selectedAnimation == animations[index] ? Colors.white : null, // Set the background color to white when selected
                    ),
                    child: ListTile(
                      title: Text(
                        animations[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      selected: selectedAnimation == animations[index],
                      onTap: () {
                        setState(() {
                          selectedAnimation = animations[index];
                          isPaused = false;
                          isReversed = false;
                          tap = false;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          if (selectedAnimation.isNotEmpty)
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                        child: selectedAnimation == "Bouncing Ball"
                            ? BouncingBall(
                          isPaused: isPaused,
                          isReversed: isReversed,
                        )
                            : selectedAnimation == "Spinning Wheel"
                            ? SpinningWheel(
                          isPaused: isPaused,
                          isReversed: isReversed,
                        )
                            : selectedAnimation == "Rotating Cube"
                            ? RotatingCube(
                          isPaused: isPaused,
                          isReversed: isReversed,
                        )
                            : selectedAnimation == "Border Rotation"
                            ? BorderAndRotationAnimation(
                          isPressed: tap,
                        )
                            : selectedAnimation == "Circle Expanding"
                            ? CircleAnimation(
                          isPressed: tap,
                        )
                            : selectedAnimation == "Logo Change Color"
                            ? SlideAnimation (
                          isPressed: tap,
                        )
                            : Text(
                          selectedAnimation,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                    ),
                  ),
                  if (['Border Rotation', 'Circle Expanding', 'Logo Change Color'].contains(selectedAnimation))
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Add your logic here for the button press
                            print('Button Pressed');
                            setState(() {
                              tap = !tap; // Toggle the tap state
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (tap) {
                                  return Colors.red; // Change the button color when tapped
                                }
                                return Colors.blue; // Default button color
                              },
                            ),
                          ),
                          child: Text(
                            'Press',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (!['Border Rotation', 'Circle Expanding', 'Logo Change Color'].contains(selectedAnimation))
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isPaused = !isPaused;
                            });
                          },
                          child: Text(
                            isPaused ? 'Resume' : 'Pause',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isReversed = !isReversed;
                            });
                          },
                          child: Text(
                            isReversed ? 'Forward' : 'Reverse',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}


