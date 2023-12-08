import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Platform_Provider/Provider/platform_provider.dart';

class CallScreen extends StatelessWidget {
  CallScreen({super.key});
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
        leading: const Icon(Icons.home),
        actions: [
          Switch(
              value: Provider.of<PlatformProvider>(context, listen: true).isios,
              onChanged: (val) {
                Provider.of<PlatformProvider>(context, listen: false)
                    .changePlatform();
              }),
        ],
      ),
      key: scaffoldKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator.adaptive(),
            const SizedBox(
              height: 50,
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Material Button"),
            ),
            ElevatedButton(
                onPressed: () {
                  scaffoldKey.currentState!.showBottomSheet(
                    (context) => Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.red.withOpacity(0.8),
                    ),
                  );
                },
                child: const Text("Bottom Sheet")),
          ],
        ),
      ),
    );
  }
}
