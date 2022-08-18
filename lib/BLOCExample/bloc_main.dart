import 'package:flutter/material.dart';
import 'package:flutter_dice/BLOCExample/bloc_page.dart';
import 'package:flutter_dice/BLOCExample/bloc_model.dart';

class BlocMain extends StatelessWidget {
  final String appName = 'Flutter Dice - BLoC';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: BlocPage(appName),
    );
  }
}
