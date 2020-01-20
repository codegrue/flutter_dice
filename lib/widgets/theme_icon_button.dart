import 'package:flutter/material.dart';
import 'package:flutter_dice/models/theme_model.dart';
import 'package:provider/provider.dart';

class ThemeIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);

    IconData icon = (theme.type == ThemeType.light)
        ? Icons.brightness_4
        : Icons.brightness_7;
    return IconButton(
      icon: Icon(icon),
      onPressed: () => theme.flipTheme(),
    );
  }
}
