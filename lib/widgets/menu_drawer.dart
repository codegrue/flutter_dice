import 'package:flutter/material.dart';
import 'package:flutter_dice/models/theme_model.dart';
import 'package:provider/provider.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Theme'),
          ),
          ListTile(
            leading: Icon(Icons.brightness_7),
            title: Text('Light'),
            trailing:
                (theme.type == ThemeType.light) ? Icon(Icons.check) : null,
            onTap: () {
              theme.type = ThemeType.light;
            },
          ),
          ListTile(
            leading: Icon(Icons.brightness_4),
            title: Text('Dark'),
            trailing: (theme.type == ThemeType.dark) ? Icon(Icons.check) : null,
            onTap: () {
              theme.type = ThemeType.dark;
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('System'),
            trailing:
                (theme.type == ThemeType.system) ? Icon(Icons.check) : null,
            onTap: () {
              theme.type = ThemeType.system;
            },
          ),
        ],
      ),
    );
  }
}
