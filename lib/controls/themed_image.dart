import 'package:flutter/material.dart';
import 'package:flutter_dice/blocs/state_bloc.dart';
import 'package:flutter_dice/providers/state_provider.dart';

class ThemedImage extends StatelessWidget {
  ThemedImage(this.filename);

  final String filename;

  @override
  Widget build(BuildContext context) {
    final stateBloc = StateProvider.of(context);

    return StreamBuilder(
      stream: stateBloc.themeType,
      builder: (content, snapshot) {
        ThemeType type = snapshot.data;
        String suffix = (type == ThemeType.Light) ? "w" : "b";

        return Image(image: AssetImage('images/$filename-$suffix.png'));
      },
    );
  }
}
