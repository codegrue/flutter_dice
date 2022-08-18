# flutter_dice

A sample Flutter app that shows how to manage responsive state using the leadding state management patterns

![Screenshot](https://github.com/codegrue/flutter_dice/blob/master/images/screenshots/sample-light.png?s=150)

## Methods Illustrated

### BLoC pattern

- Using a BLoC pattern for global app state
- Using the BlocProvider pattern for accessing the model
- Using `BehaviorSubject` methods to make elements reactive

### Provider pattern

- Using a provider for global app state
- Using a provider as a view model for a screen
- Using `ChangeNotifierProvider<T>` to make the app reactive
- Consumption of providers using `Provider.of<T>(context)` method

### Riverpod pattern

- Using a `ProviderScope` for global app state
- Using a `StateNotifier` for the model for a screen
- Using `StateNotifierProvider` to make the app reactive
- Consumption of providers using `ref.watch` and `ref.read` method

## Singleton Persistence

- App and screen state saves when changed and is loaded on startup
- An instrance of `SharedPreferences` is created globally as a singleton
- Providers are able to save and load their own state

