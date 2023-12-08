import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convertor_provider/Modules/App/Material_Screen/Providers/Date_Picker_Provider/date_picker_provider.dart';
import 'package:platform_convertor_provider/Modules/App/Material_Screen/Providers/NavigationBar_Provider/navigationbar_provider.dart';
import 'package:platform_convertor_provider/Modules/App/Material_Screen/Providers/Time_Picker_Provider/time_picker_provider.dart';
import 'package:platform_convertor_provider/Modules/App/Material_Screen/Views/material_screen.dart';
import 'package:platform_convertor_provider/Modules/Components/Cupertino_Pages/Call_Screen/Provider/SliderProvider/slider_provider.dart';
import 'package:platform_convertor_provider/Modules/Components/Cupertino_Pages/Message_Screen/Providers/Segment_Provider/segment_provider.dart';
import 'package:platform_convertor_provider/Modules/Platform_Provider/Provider/platform_provider.dart';
import 'package:provider/provider.dart';
import 'Modules/App/Cupertino_Screen/Views/cupertino_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider(create: (ctx) => PlatformProvider()),
        ListenableProvider(create: (ctx) => DatePickerProvider()),
        ListenableProvider(create: (ctx) => TimePickerProvider()),
        ListenableProvider(create: (ctx) => NavigationBarProvider()),
        ListenableProvider(create: (ctx) => SliderProvider()),
        ListenableProvider(create: (ctx) => SegmentProvider()),
      ],
      builder: (context, child) {
        return (Provider.of<PlatformProvider>(context, listen: true).isios ==
                false)
            ? MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(useMaterial3: true),
                home: Material_Screen(),
              )
            : CupertinoApp(
                debugShowCheckedModeBanner: false,
                home: Cupertino_Tab(),
              );
      },
    ),
  );
}
