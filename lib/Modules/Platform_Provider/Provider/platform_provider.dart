import 'package:flutter/cupertino.dart';
import 'package:platform_convertor_provider/Modules/Platform_Provider/Model/platform_model.dart';

class PlatformProvider extends ChangeNotifier {
  // Platform platform = Platform(isIOS: false);
  bool isios = false;
  void changePlatform() {
    isios = !isios;
    notifyListeners();
  }
}
