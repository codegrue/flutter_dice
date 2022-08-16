import 'package:flutter/material.dart';
import 'package:flutter_dice/ProviderExample/models/theme_model.dart';
import 'package:provider/provider.dart';

class ThemedImage extends StatelessWidget {
  ThemedImage(this.filename);

  final String filename;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    String suffix = (theme.effectiveType == ThemeType.light) ? "w" : "b";

    return Image(image: AssetImage('images/$filename-$suffix.png'));
  }
}
