import 'package:flutter/material.dart';
import 'package:flutter_dice/blocs/state_bloc.dart';

class StateProvider extends InheritedWidget {
  StateProvider({Key key, Widget child}) : super(key: key, child: child);

  final stateBloc = StateBloc();

  @override
  bool updateShouldNotify(_) => true;

  static StateBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(StateProvider)
            as StateProvider)
        .stateBloc;
  }
}
