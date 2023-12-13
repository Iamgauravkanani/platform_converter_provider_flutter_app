// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:platform_convertor_provider/Modules/App/Material_Screen/Providers/NavigationBar_Provider/navigationbar_provider.dart';
import 'package:platform_convertor_provider/Modules/Components/Material_Pages/Call_Screen/Views/call_screen.dart';
import 'package:platform_convertor_provider/Modules/Components/Material_Pages/Message_Screen/Views/message_screen.dart';

import 'package:platform_convertor_provider/Modules/Components/Material_Pages/Sliver_Screen/Views/sliver_screen.dart';
import 'package:platform_convertor_provider/Modules/Platform_Provider/Provider/platform_provider.dart';
import 'package:provider/provider.dart';

class Material_Screen extends StatelessWidget {
  Material_Screen({super.key});
  List<Widget> pages = [
    CallScreen(),
    const message_screen(),
    const SliverScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: Provider.of<NavigationBarProvider>(context, listen: true)
            .navigationBarModel
            .currentIndex,
        onTap: (val) {
          Provider.of<NavigationBarProvider>(context, listen: false)
              .changeIndex(val: val);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "Call"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "message"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "setting"),
        ],
      ),
      body: PageView(
        controller: Provider.of<NavigationBarProvider>(context, listen: true)
            .pageController,
        onPageChanged: (val) {
          Provider.of<NavigationBarProvider>(context, listen: false)
              .changeIndex(val: val);
        },
        children: pages,
      ),
    );
  }
}
