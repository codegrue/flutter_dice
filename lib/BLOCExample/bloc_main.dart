import 'package:flutter/material.dart';
//import 'package:flutter_dice/BLOCExample/services/state_persist.dart';
import 'package:flutter_dice/BLOCExample/bloc_page.dart';
import 'package:flutter_dice/BLOCExample/bloc_provider.dart';
import 'package:flutter_dice/BLOCExample/bloc_state.dart';

class BlocMain extends StatelessWidget {
  final String appName = 'Flutter Dice - Bloc';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: BlocPage(appName),
    );
  }
}



// class BlocMain extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StateProvider(
//       child: ThemeableApp(),
//     );
//   }
// }

// class ThemeableApp extends StatefulWidget {
//   final String appName = 'Flutter Dice';

//   @override
//   ThemeableAppState createState() {
//     return ThemeableAppState();
//   }
// }

// class ThemeableAppState extends State<ThemeableApp> {
//   final String appName = 'Flutter Dice - BLOC';

//   ThemeType themeTypeName;

//   @override
//   void initState() {
//     super.initState();
//     init();
//   }

//   void init() async {
//     final persistState = PersistState();
//     themeTypeName = await persistState.loadThemeType();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var stateBloc = StateProvider.of(context);

//     return StateProvider(
//       child: StreamBuilder(
//         initialData: stateBloc.themeTypeToData(themeTypeName),
//         stream: stateBloc.theme,
//         builder: (content, AsyncSnapshot<ThemeData> snapshot) {
//           //ThemeData theme = snapshot.data;
//           return DicePage(title: appName);
//         },
//       ),
//     );
//   }
// }
