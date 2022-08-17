import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ProviderExample/provider_main.dart';
import 'BLOCExample/bloc_main.dart';
import 'prefs_singleton.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  PrefsSingleton.prefs = await SharedPreferences.getInstance();

  runApp(DiceApp());
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
  final String appName = 'Flutter Dice Examples';

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
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            child: Text("BLOC"),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute<void>(
                  builder: (context) => BlocMain(), maintainState: false),
            ),
          ),
          ElevatedButton(
            child: Text("Provider"),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute<void>(
                  builder: (context) => ProviderMain(), maintainState: false),
            ),
          ),
          // ElevatedButton(
          //   child: Text("RiverPod"),
          // ),
        ],
      ),
    );
  }
}
