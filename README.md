# Flutter Animation Simulator App

This Flutter app simulates Android fragments by displaying two widgets horizontally. The left-side widget showcases a list of animations, including examples like "bouncing ball," "spinning wheel," and "rotating cube." Users can choose an animation from the list, and the selected animation will be displayed in the right-side widget.

## Features

1. **Initial Layout:**
   - When the app is started, the left-side widget occupies the entire width of the screen.
   - The left-side widget displays a list of animations.

2. **Selection Interaction:**
   - Upon selecting an animation from the list:
     - The width of the left-side widget is shrunk to about 1/4 of the screen.
     - The selected animation is highlighted.
     - The remaining 3/4 of the screen displays the selected animation in the right-side widget.

3. **Animations:**
   - At least 2 explicit animations.
   - At least 2 implicit animations.
   - A total of 6 animations.

4. **Explicit Animation Controls:**
   - Buttons for pausing and resuming the animation.
   - A button for reversing the direction of the animation.
   - These buttons are displayed in the right-side widget.

## Implementation Notes

- The app utilizes Flutter animations to simulate the selected animations.
- The selected list item is highlighted for better user feedback.
- Explicit animations include controls for pausing, resuming, and reversing the direction.
- The design is optimized for both functionality and visual appeal.

## Getting Started

1. Clone the repository.

2. Open the project in your preferred Flutter IDE.

3. Run the app on an emulator or physical device.

4. Explore the animation simulator app, choose animations, and interact with explicit animation controls.

Feel free to extend the app with more animations or additional features as needed for your specific use case.
