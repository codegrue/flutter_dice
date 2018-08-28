# flutter_dice

A sample Flutter app that shows how to manage responsive state using the bloc pattern.

![Screenshot](https://github.com/codegrue/flutter_dice/blob/master/images/screenshots/sample-light.png?s=150)
![Screenshot](https://github.com/codegrue/flutter_dice/blob/master/images/screenshots/sample-dark.png?s=150)

## Concepts Illustrated

- Using a bloc pattern for application state
- Using an `InheritedWidget` Provider to make the bloc globally accessible
- dynamic theme switching
- Consumption of bloc using `StreamBuilder` widgets
- Persisting state using `SharedPreferences`

## Current Issues

- Screen draws prior to theme loading, so you may see the wrong theme briefly
