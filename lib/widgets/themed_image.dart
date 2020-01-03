import 'package:flutter/material.dart';
import 'package:flutter_dice/blocs/theme_bloc.dart';
import 'package:flutter_dice/providers/theme_provider.dart';

class ThemedImage extends StatelessWidget {
  ThemedImage(this.filename);

  final String filename;

  @override
  Widget build(BuildContext context) {
    final themeBloc = ThemeProvider.of(context);

    return StreamBuilder(
      stream: themeBloc.themeType,
      builder: (content, snapshot) {
        ThemeType type = snapshot.data as ThemeType;
        String suffix = (type == ThemeType.light) ? "w" : "b";

        return Image(image: AssetImage('images/$filename-$suffix.png'));
      },
    );
  }
}
