import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../Platform_Provider/Provider/platform_provider.dart';

class Cupertino_Screen extends StatefulWidget {
  const Cupertino_Screen({super.key});

  @override
  State<Cupertino_Screen> createState() => _Cupertino_ScreenState();
}

class _Cupertino_ScreenState extends State<Cupertino_Screen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Home Screen"),
        leading: Icon(CupertinoIcons.settings),
        trailing: CupertinoSwitch(
            value: Provider.of<PlatformProvider>(context, listen: true).isios,
            onChanged: (val) {
              setState(() {
                Provider.of<PlatformProvider>(context, listen: false)
                    .changePlatform();
              });
            }),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CupertinoActivityIndicator(
              radius: 20,
            ),
            const SizedBox(
              height: 50,
            ),
            CupertinoButton(
                child: const Text("Cupertino Button"), onPressed: () {}),
            const SizedBox(
              height: 50,
            ),
            CupertinoButton.filled(
                child: const Text("Cupertino Button"), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
