import 'package:shared_preferences/shared_preferences.dart';

class PrefsSingleton {
  static final PrefsSingleton _singleton = PrefsSingleton._internal();

  static SharedPreferences prefs;

  factory PrefsSingleton() {
    return _singleton;
  }

  PrefsSingleton._internal();
}
