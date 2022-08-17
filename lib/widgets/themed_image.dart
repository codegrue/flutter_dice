import 'package:flutter/material.dart';

class ThemedImage extends StatelessWidget {
  ThemedImage(this.filename);

  final String filename;

  @override
  Widget build(BuildContext context) {
    //final theme = Provider.of<ThemeModel>(context);
    String suffix = "w";
    // String suffix = (theme.effectiveType == ThemeType.light) ? "w" : "b";

    return Image(image: AssetImage('images/$filename-$suffix.png'));
  }
}
