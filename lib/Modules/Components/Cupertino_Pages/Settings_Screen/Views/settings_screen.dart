import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../Platform_Provider/Provider/platform_provider.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Home Screen"),
        leading: const Icon(CupertinoIcons.settings),
        trailing: CupertinoSwitch(
            value: Provider.of<PlatformProvider>(context, listen: true).isios,
            onChanged: (val) {
              Provider.of<PlatformProvider>(context, listen: false)
                  .changePlatform();
            }),
      ),
      child: Center(child: Text("Hello Its Settings Screen")),
    );
  }
}
