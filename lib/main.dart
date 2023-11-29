import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convertor_provider/Modules/App/Material_Screen/Views/material_screen.dart';
import 'package:platform_convertor_provider/Modules/Platform_Provider/Provider/platform_provider.dart';
import 'package:provider/provider.dart';
import 'Modules/App/Cupertino_Screen/Views/cupertino_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider(create: (ctx) => PlatformProvider()),
      ],
      builder: (context, child) {
        return (Provider.of<PlatformProvider>(context, listen: true).isios ==
                true)
            ? MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(useMaterial3: true),
                home: Material_Screen(),
              )
            : CupertinoApp(
                debugShowCheckedModeBanner: false,
                home: Cupertino_Screen(),
              );
      },
    ),
  );
}
