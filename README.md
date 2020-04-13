# flutter_dice

A sample Flutter app that shows how to manage responsive state using the provider pattern.

![Screenshot](https://github.com/codegrue/flutter_dice/blob/master/images/screenshots/sample-light.png?s=150)
![Screenshot](https://github.com/codegrue/flutter_dice/blob/master/images/screenshots/sample-dark.png?s=150)

## Concepts Illustrated

### Provider pattern

- Using a provider for global app state (i.e. Theme)
- Using a provider as a view model for a screen
- Using an `MultiProvider` to make the providers accessible
- Using `ChangeNotifierProvider<T>` to make the app responsive
- Consumption of providers using `Provider.of<T>(context)` method

### Persistence

- App and screen state saves when changed and is loaded on startup
- An instrance of `SharedPreferences` is creeated globally as a singleton
- Providers are able to save and load their own state

### Dynamic Theme

- Can change between light and dark theme.
- Implemented as a provider.
