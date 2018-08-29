import 'package:flutter/material.dart';
import 'package:flutter_dice/blocs/theme_bloc.dart';
import 'package:flutter_dice/providers/theme_provider.dart';

class ThemeIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeBloc = ThemeProvider.of(context);

    return StreamBuilder(
      stream: themeBloc.themeType,
      builder: (content, snapshot) {
        ThemeType type = snapshot.data;
        IconData icon =
            (type == ThemeType.light) ? Icons.brightness_4 : Icons.brightness_7;
        return IconButton(
          icon: Icon(icon),
          onPressed: () => themeBloc.flipTheme(),
        );
      },
    );
  }
}
