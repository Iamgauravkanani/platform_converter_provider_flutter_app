import 'package:flutter/cupertino.dart';
import 'package:platform_convertor_provider/Modules/Components/Cupertino_Pages/Call_Screen/Model/SliderModel/slider_model.dart';

class SliderProvider extends ChangeNotifier {
  SliderModel sliderModel = SliderModel(slidervalue: 0);

  void changeValue({required double val}) {
    sliderModel.slidervalue = val;
    notifyListeners();
  }
}
