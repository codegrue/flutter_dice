import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'riverpod_page.dart';
import 'riverpod_model.dart';

// riverpod provider declared globally
final riverpodProvider = StateNotifierProvider<RiverpodNotifier, DiceState>(
    (ref) => RiverpodNotifier());

class RiverpodMain extends StatelessWidget {
  final String appName = 'Flutter Dice - Riverpod';

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: RiverpodPage(appName),
    );
  }
}

// /// Providers are declared globally and specify how to create a state
// //final counterProvider = StateProvider((ref) => DiceState(roll: 1, sides: 6));
// final counterProvider = StateProvider((ref) => RiverpodNotifier());

// class Home extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final dice = ref.watch(counterProvider.state).state;

//     return Scaffold(
//       appBar: AppBar(title: const Text('Counter example')),
//       body: Center(
//         // Consumer is a widget that allows you reading providers.
//         child: Consumer(builder: (context, ref, _) {
//           final count = dice.roll;
//           return Text('$count');
//         }),
//       ),
//       floatingActionButton: FloatingActionButton(
//         // The read method is a utility to read a provider without listening to it
//         onPressed: () => {
//           //var xxx = ref.read(counterProvider.state).state;
//           dice.incrementDice()
// //          ref.read(counterProvider.state).state.incrementDice()
//           //DiceState(roll: dice.roll + 1, sides: 6)
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// class Home extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final dice = ref.watch(counterProvider.state).state;

//     return Scaffold(
//       appBar: AppBar(title: const Text('Counter example')),
//       body: Center(
//         // Consumer is a widget that allows you reading providers.
//         child: Consumer(builder: (context, ref, _) {
//           final count = dice.roll;
//           return Text('$count');
//         }),
//       ),
//       floatingActionButton: FloatingActionButton(
//         // The read method is a utility to read a provider without listening to it
//         onPressed: () => {
//           //var xxx = ref.read(counterProvider.state).state;
//           ref.read(counterProvider.state).state =
//               DiceState(roll: dice.roll + 1, sides: 6)
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }