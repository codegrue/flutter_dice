import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ProviderExample/main.dart';
import 'prefs_singleton.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final String appName = 'Flutter Dice Examples';

  PrefsSingleton.prefs = await SharedPreferences.getInstance();

  runApp(MaterialApp(title: appName, home: DiceApp()));
}

class DiceApp extends StatelessWidget {
  final String appName = 'Flutter Dice Examples';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text("BLOC"),
            ),
            ElevatedButton(
              child: Text("Provider"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute<void>(builder: (context) => ProviderMain()),
              ),
            ),
            ElevatedButton(
              child: Text("RiverPod"),
            ),
          ],
        ),
      ),
    );
  }
}
