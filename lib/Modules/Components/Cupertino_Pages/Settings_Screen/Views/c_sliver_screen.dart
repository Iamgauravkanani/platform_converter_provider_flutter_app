import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../Platform_Provider/Provider/platform_provider.dart';

class CupertinoSliverScreen extends StatelessWidget {
  const CupertinoSliverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            middle: const Text("Cupertino Screen"),
            leading: const Icon(CupertinoIcons.settings),
            largeTitle: Text("Sliver Screen"),
            trailing: CupertinoSwitch(
                value:
                    Provider.of<PlatformProvider>(context, listen: true).isios,
                onChanged: (val) {
                  Provider.of<PlatformProvider>(context, listen: false)
                      .changePlatform();
                }),
          ),
          SliverToBoxAdapter(
            child: CupertinoListSection(
              footer: Text("Study Info"),
              header: Text("Student Info"),
              children: const [
                CupertinoListTile(
                  additionalInfo: Text("Red & White"),
                  title: Text("Prince"),
                  subtitle: Text("Flutter Developer"),
                  leading: CircleAvatar(),
                  trailing: Icon(Icons.settings),
                ),
                CupertinoListTile(
                  title: Text("Prince"),
                  subtitle: Text("Flutter Developer"),
                  leading: CircleAvatar(),
                  trailing: Icon(Icons.settings),
                ),
                CupertinoListTile(
                  title: Text("Prince"),
                  subtitle: Text("Flutter Developer"),
                  leading: CircleAvatar(),
                  trailing: Icon(Icons.settings),
                ),
                CupertinoListTile(
                  title: Text("Prince"),
                  subtitle: Text("Flutter Developer"),
                  leading: CircleAvatar(),
                  trailing: Icon(Icons.settings),
                ),
                CupertinoListTile(
                  title: Text("Prince"),
                  subtitle: Text("Flutter Developer"),
                  leading: CircleAvatar(),
                  trailing: Icon(Icons.settings),
                ),
                CupertinoListTile(
                  title: Text("Prince"),
                  subtitle: Text("Flutter Developer"),
                  leading: CircleAvatar(),
                  trailing: Icon(Icons.settings),
                ),
              ],
            ),
          ),
          const SliverFillRemaining(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CupertinoListTile(
                    additionalInfo: Text("Red & White"),
                    title: Text("Prince"),
                    subtitle: Text("Flutter Developer"),
                    leading: CircleAvatar(),
                    trailing: Icon(Icons.settings),
                  ),
                  CupertinoListTile(
                    title: Text("Prince"),
                    subtitle: Text("Flutter Developer"),
                    leading: CircleAvatar(),
                    trailing: Icon(Icons.settings),
                  ),
                  CupertinoListTile(
                    title: Text("Prince"),
                    subtitle: Text("Flutter Developer"),
                    leading: CircleAvatar(),
                    trailing: Icon(Icons.settings),
                  ),
                  CupertinoListTile(
                    additionalInfo: Text("Red & White"),
                    title: Text("Prince"),
                    subtitle: Text("Flutter Developer"),
                    leading: CircleAvatar(),
                    trailing: Icon(Icons.settings),
                  ),
                  CupertinoListTile(
                    title: Text("Prince"),
                    subtitle: Text("Flutter Developer"),
                    leading: CircleAvatar(),
                    trailing: Icon(Icons.settings),
                  ),
                  CupertinoListTile(
                    title: Text("Prince"),
                    subtitle: Text("Flutter Developer"),
                    leading: CircleAvatar(),
                    trailing: Icon(Icons.settings),
                  ),
                  CupertinoListTile(
                    additionalInfo: Text("Red & White"),
                    title: Text("Prince"),
                    subtitle: Text("Flutter Developer"),
                    leading: CircleAvatar(),
                    trailing: Icon(Icons.settings),
                  ),
                  CupertinoListTile(
                    title: Text("Prince"),
                    subtitle: Text("Flutter Developer"),
                    leading: CircleAvatar(),
                    trailing: Icon(Icons.settings),
                  ),
                  CupertinoListTile(
                    title: Text("Prince"),
                    subtitle: Text("Flutter Developer"),
                    leading: CircleAvatar(),
                    trailing: Icon(Icons.settings),
                  ),
                  CupertinoListTile(
                    additionalInfo: Text("Red & White"),
                    title: Text("Prince"),
                    subtitle: Text("Flutter Developer"),
                    leading: CircleAvatar(),
                    trailing: Icon(Icons.settings),
                  ),
                  CupertinoListTile(
                    title: Text("Prince"),
                    subtitle: Text("Flutter Developer"),
                    leading: CircleAvatar(),
                    trailing: Icon(Icons.settings),
                  ),
                  CupertinoListTile(
                    title: Text("Prince"),
                    subtitle: Text("Flutter Developer"),
                    leading: CircleAvatar(),
                    trailing: Icon(Icons.settings),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
