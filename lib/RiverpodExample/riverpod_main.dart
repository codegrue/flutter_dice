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
