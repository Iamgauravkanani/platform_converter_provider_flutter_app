import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../Platform_Provider/Provider/platform_provider.dart';

class Cupertino_Screen extends StatelessWidget {
  const Cupertino_Screen({super.key});

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
                child: const Text("Cupertino Action Sheet"),
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (ctx) {
                        return CupertinoActionSheet(
                          cancelButton: CupertinoActionSheetAction(
                              isDestructiveAction: true,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel")),
                          title:
                              const Text("Example of Cupertino Action Sheet"),
                          message: const Text("Type Your Message here..."),
                          actions: [
                            CupertinoActionSheetAction(
                              isDefaultAction: true,
                              onPressed: () {},
                              child: const Text("Save"),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () {},
                              child: const Text("Save Later"),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () {},
                              child: const Text("Allow"),
                            ),
                          ],
                        );
                      });
                }),
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
