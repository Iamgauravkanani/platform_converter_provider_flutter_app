import 'package:flutter/cupertino.dart';
import 'package:platform_convertor_provider/Modules/Platform_Provider/Model/platform_model.dart';

class PlatformProvider extends ChangeNotifier {
  Platform platform = Platform(isIOS: false);

  void changePlatform() {
    platform.isIOS = !platform.isIOS;
    notifyListeners();
  }
}
