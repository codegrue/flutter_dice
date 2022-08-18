import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ProviderExample/provider_main.dart';
import 'BLOCExample/bloc_main.dart';
import 'RiverpodExample/riverpod_main.dart';
import 'prefs_singleton.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  PrefsSingleton.prefs = await SharedPreferences.getInstance();

  runApp(DiceApp());
}

class PreferenceNames {
  static const roll = "roll";
  static const sides = "sides";
}

class DiceApp extends StatelessWidget {
  final String appName = 'Flutter Dice Examples';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      home: DiceScaffold(),
    );
  }
}

class DiceScaffold extends StatelessWidget {
  final String appName = 'Flutter State Examples';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
      ),
      body: DiceExamplesMenu(),
    );
  }
}

class DiceExamplesMenu extends StatelessWidget {
  var buttonStyle = ElevatedButton.styleFrom(minimumSize: const Size(200, 40));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            child: Text("BLOC"),
            style: buttonStyle,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute<void>(
                  builder: (context) => BlocMain(), maintainState: false),
            ),
          ),
          ElevatedButton(
            child: Text("Provider"),
            style: buttonStyle,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute<void>(
                  builder: (context) => ProviderMain(), maintainState: false),
            ),
          ),
          ElevatedButton(
            child: Text("Riverpod"),
            style: buttonStyle,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute<void>(
                  builder: (context) => RiverpodMain(), maintainState: false),
            ),
          ),
        ],
      ),
    );
  }
}
