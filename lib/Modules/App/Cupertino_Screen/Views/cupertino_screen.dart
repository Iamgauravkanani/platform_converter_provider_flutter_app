import 'package:flutter/cupertino.dart';
import 'package:platform_convertor_provider/Modules/Components/Cupertino_Pages/Call_Screen/Views/call_screen.dart';
import 'package:platform_convertor_provider/Modules/Components/Cupertino_Pages/Message_Screen/Views/message_screen.dart';
import 'package:platform_convertor_provider/Modules/Components/Cupertino_Pages/Settings_Screen/Views/settings_screen.dart';

class Cupertino_Tab extends StatelessWidget {
  Cupertino_Tab({super.key});
  List<Widget> pagelist = [
    const Call_Screen(),
    const Message_Screen(),
    SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.phone), label: "Call"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble), label: "Messages"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings), label: "Settings"),
          ],
        ),
        tabBuilder: (ctx, i) => CupertinoTabView(
              builder: (ctx) => pagelist[i],
            ));
  }
}
