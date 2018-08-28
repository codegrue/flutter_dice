import 'package:flutter/material.dart';
import 'package:flutter_dice/controls/action_buttons.dart';
import 'package:flutter_dice/controls/dice_display.dart';
import 'package:flutter_dice/controls/sides_buttons.dart';
import 'package:flutter_dice/controls/theme_icon_button.dart';

class DicePage extends StatelessWidget {
  DicePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          ThemeIconButton(),
        ],
      ),
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
