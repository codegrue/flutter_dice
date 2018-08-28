import 'package:flutter/material.dart';
import 'package:flutter_dice/blocs/state_bloc.dart';
import 'package:flutter_dice/controls/themed_image.dart';
import 'package:flutter_dice/providers/state_provider.dart';

class SidesButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stateBloc = StateProvider.of(context);

    return Align(
      alignment: Alignment.topCenter,
      child: StreamBuilder(
        stream: stateBloc.sides,
        builder: (context, snapshot) {
          int faces = snapshot.data;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildFacesButton(4, faces, stateBloc),
              _buildFacesButton(6, faces, stateBloc),
              _buildFacesButton(8, faces, stateBloc),
              _buildFacesButton(12, faces, stateBloc),
              _buildFacesButton(20, faces, stateBloc),
            ],
          );
        },
      ),
    );
  }

  FloatingActionButton _buildFacesButton(
    int desiredFaces,
    int currentFaces,
    StateBloc stateBloc,
  ) {
    return FloatingActionButton(
      backgroundColor: (currentFaces == desiredFaces) ? Colors.orange : null,
      onPressed: () => stateBloc.changeSides(desiredFaces),
      child: ThemedImage('d$desiredFaces'),
    );
  }
}
