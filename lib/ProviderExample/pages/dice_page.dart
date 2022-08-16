import 'package:flutter/material.dart';
import 'package:flutter_dice/ProviderExample/widgets/action_buttons.dart';
import 'package:flutter_dice/ProviderExample/widgets/dice_display.dart';
import 'package:flutter_dice/ProviderExample/widgets/menu_drawer.dart';
import 'package:flutter_dice/ProviderExample/widgets/sides_buttons.dart';

class DicePage extends StatelessWidget {
  DicePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: MenuDrawer(),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Stack(
          children: <Widget>[
            DiceDisplay(),
            SidesButtons(),
            ActionButtons(),
          ],
        ),
      ),
    );
  }
}
