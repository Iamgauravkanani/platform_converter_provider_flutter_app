import 'package:flutter/cupertino.dart';
import 'package:platform_convertor_provider/Modules/Components/Cupertino_Pages/Message_Screen/Model/Segment_Control/segment_model.dart';

class SegmentProvider extends ChangeNotifier {
  SegmentModel segment = SegmentModel(value: 0);

  void changeVal({required int val}) {
    segment.value = val;
    notifyListeners();
  }
}
