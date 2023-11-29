import 'package:flutter/material.dart';
import 'package:platform_convertor_provider/Modules/Platform_Provider/Provider/platform_provider.dart';
import 'package:provider/provider.dart';

class Material_Screen extends StatefulWidget {
  const Material_Screen({super.key});

  @override
  State<Material_Screen> createState() => _Material_ScreenState();
}

class _Material_ScreenState extends State<Material_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
        leading: Icon(Icons.home),
        actions: [
          Switch(
              value: Provider.of<PlatformProvider>(context, listen: true).isios,
              onChanged: (val) {
                setState(() {
                  Provider.of<PlatformProvider>(context, listen: false)
                      .changePlatform();
                });
              }),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 50,
            ),
            TextButton(onPressed: () {}, child: Text("Material Button")),
            ElevatedButton(onPressed: () {}, child: Text("Material Button"))
          ],
        ),
      ),
    );
  }
}
