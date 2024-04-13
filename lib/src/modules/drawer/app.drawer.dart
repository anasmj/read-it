import 'package:flutter/material.dart';
import 'package:pattern_m/src/modules/router/provider/route.provider.dart';
import 'package:pattern_m/src/modules/setting/view/setting.view.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          ListTile(
            title: const Text('Settings'),
            leading: const Icon(Icons.settings),
            onTap: () async => await fadePush(context, const SettingView()),
          ),
        ],
      ),
    );
  }
}
