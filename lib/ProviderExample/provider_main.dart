import 'package:flutter/material.dart';
import 'package:flutter_dice/ProviderExample/provider_page.dart';
import 'package:provider/provider.dart';

import 'provider_model.dart';

class ProviderMain extends StatelessWidget {
  final String appName = 'Flutter Dice - Provider';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderModel>(
      create: (_) => ProviderModel(),
      child: ProviderPage(appName),
    );
  }
}
