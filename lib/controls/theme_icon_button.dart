import 'package:flutter/material.dart';
import 'package:flutter_dice/blocs/state_bloc.dart';
import 'package:flutter_dice/providers/state_provider.dart';

class ThemeIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stateBloc = StateProvider.of(context);

    return StreamBuilder(
      stream: stateBloc.themeType,
      builder: (content, snapshot) {
        ThemeType type = snapshot.data;
        IconData icon =
            (type == ThemeType.light) ? Icons.brightness_4 : Icons.brightness_7;
        return IconButton(
          icon: Icon(icon),
          onPressed: () => stateBloc.flipTheme(),
        );
      },
    );
  }
}
