import 'package:flutter/cupertino.dart';
import 'package:platform_convertor_provider/Modules/Components/Cupertino_Pages/Call_Screen/Provider/SliderProvider/slider_provider.dart';
import 'package:provider/provider.dart';
import '../../../../App/Material_Screen/Providers/Date_Picker_Provider/date_picker_provider.dart';
import '../../../../Platform_Provider/Provider/platform_provider.dart';

class Call_Screen extends StatelessWidget {
  const Call_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Home Screen"),
        leading: const Icon(CupertinoIcons.settings),
        trailing: CupertinoSwitch(
            value: Provider.of<PlatformProvider>(context, listen: true).isios,
            onChanged: (val) {
              Provider.of<PlatformProvider>(context, listen: false)
                  .changePlatform();
            }),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CupertinoActivityIndicator(
              radius: 20,
            ),
            const SizedBox(
              height: 50,
            ),
            CupertinoButton(
                child: const Text("Show Date Picker"),
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (ctx) {
                        return CupertinoActionSheet(
                          cancelButton: CupertinoActionSheetAction(
                              isDestructiveAction: true,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel")),
                          title: const Text("Cupertino Date Picker"),
                          message: Container(
                            height: 300,
                            child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.date,
                                initialDateTime:
                                    Provider.of<DatePickerProvider>(context)
                                        .datePickerModel
                                        .dateTime,
                                use24hFormat: false,
                                onDateTimeChanged: (val) {
                                  Provider.of<DatePickerProvider>(context,
                                          listen: false)
                                      .pickDate(pickedDate: val);
                                }),
                          ),
                          actions: [
                            CupertinoActionSheetAction(
                              onPressed: () {},
                              child: const Text("Allow"),
                            ),
                          ],
                        );
                      });
                }),
            Text(
                "${Provider.of<DatePickerProvider>(context, listen: true).datePickerModel.dateTime.day}/"
                "${Provider.of<DatePickerProvider>(context, listen: true).datePickerModel.dateTime.month}/"
                "${Provider.of<DatePickerProvider>(context, listen: true).datePickerModel.dateTime.year}"),
            CupertinoSlider(
              value: Provider.of<SliderProvider>(context, listen: true)
                  .sliderModel
                  .slidervalue,
              onChanged: (val) {
                Provider.of<SliderProvider>(context, listen: false)
                    .changeValue(val: val);
              },
            ),
          ],
        ),
      ),
    );
  }
}
