# flutter_dice

A sample Flutter app that shows how to manage responsive state using the bloc pattern.

![Screenshot](https://github.com/codegrue/flutter_dice/blob/master/images/screenshots/sample-light.png?s=150)
![Screenshot](https://github.com/codegrue/flutter_dice/blob/master/images/screenshots/sample-dark.png?s=150)

## Concepts Illustrated

### BlOC pattern

- Using a bloc pattern for global app state (i.e. Theme)
- Using a bloc pattern as a view model for a screen
- Using an `InheritedWidget` Provider to make the blocs accessible
- Consumption of bloc using `StreamBuilder` widgets

### Persistence

- App and screen state saves when changed and is loaded on startup
- An instrance of `SharedPreferences` is creeated globally as a singleton
- Blocs are able to save and load their own state

### Dynamic Theme

- Can change between light and dark theme.
- Implemented as a bloc.