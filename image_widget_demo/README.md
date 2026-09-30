# Image Widget Demo

A small Flutter project for a classroom presentation about Flutter's `Image` widget.

## Real-world use case

The app uses an image as a student profile photo. It lets the presenter change three `Image.asset` properties and immediately see the result.

## The three properties

1. `width` — controls the image width.
2. `height` — controls the image height.
3. `fit` — controls how the image is fitted into the space given to it.

## Run the project

1. Open this folder in Android Studio or VS Code.
2. Make sure Flutter is installed and configured.
3. Run `flutter pub get`.
4. Start an Android emulator or connect an Android device.
5. Run `flutter run`.

The project uses a local image asset, so the demo does not depend on an internet connection.

## Presentation demo

Use the sliders to change `width` and `height`. Use the `fit` dropdown to switch between values such as `BoxFit.cover` and `BoxFit.contain`.

For the presentation, explain:
- what the image looks like before changing a property;
- what changes on screen;
- why a developer might change that property.

## Final UI

![Final UI](screenshots/final_ui.png)

## Source

The implementation follows Flutter's official `Image` widget API and uses `Image.asset` with a local asset.
