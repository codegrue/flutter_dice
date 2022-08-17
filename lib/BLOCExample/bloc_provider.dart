import 'package:flutter/material.dart';
import 'package:flutter_dice/BLOCExample/bloc_state.dart';

class BlocProvider extends InheritedWidget {
  BlocProvider({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final StateBloc stateBloc = StateBloc();

  @override
  bool updateShouldNotify(_) => true;

  static StateBloc of(BuildContext context) {
    var provider = context.dependOnInheritedWidgetOfExactType<BlocProvider>();

    return (provider == null) ? StateBloc() : provider.stateBloc;

    //return context.dependOnInheritedWidgetOfExactType<BlocProvider>().stateBloc;
  }
}
