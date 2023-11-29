// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:platform_convertor_provider/Modules/Platform_Provider/Provider/platform_provider.dart';
import 'package:provider/provider.dart';

class Material_Screen extends StatelessWidget {
  Material_Screen({super.key});
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
        leading: Icon(Icons.home),
        actions: [
          Switch(
              value: Provider.of<PlatformProvider>(context, listen: true).isios,
              onChanged: (val) {
                Provider.of<PlatformProvider>(context, listen: false)
                    .changePlatform();
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
            ElevatedButton(
                onPressed: () {
                  scaffoldKey.currentState!
                      .showBottomSheet((context) => Container(
                            height: 200,
                            width: double.infinity,
                            color: Colors.red.withOpacity(0.8),
                          ));
                },
                child: Text("Bottom Sheet")),
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (ctx) {
                        return Container(
                          height: 200,
                          width: double.infinity,
                        );
                      });
                },
                child: Text("Modal Bottom Sheet"))
          ],
        ),
      ),
    );
  }
}
