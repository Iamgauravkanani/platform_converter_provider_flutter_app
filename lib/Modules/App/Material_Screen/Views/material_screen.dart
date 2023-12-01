// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:platform_convertor_provider/Modules/App/Material_Screen/Providers/Date_Picker_Provider/date_picker_provider.dart';
import 'package:platform_convertor_provider/Modules/App/Material_Screen/Providers/Time_Picker_Provider/time_picker_provider.dart';
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
            TextButton(
              onPressed: () {},
              child: Text("Material Button"),
            ),
            ElevatedButton(
                onPressed: () {
                  scaffoldKey.currentState!.showBottomSheet(
                    (context) => Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.red.withOpacity(0.8),
                    ),
                  );
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
                child: Text("Modal Bottom Sheet")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                          initialDatePickerMode: DatePickerMode.year,
                          confirmText: "Pick",
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2025));

                      Provider.of<DatePickerProvider>(context, listen: false)
                          .pickDate(pickedDate: pickedDate!);
                    },
                    icon: Icon(
                      Icons.calendar_month,
                      size: 35,
                    )),
                Text(
                    "${Provider.of<DatePickerProvider>(context, listen: true).datePickerModel.dateTime.day}/"
                    "${Provider.of<DatePickerProvider>(context, listen: true).datePickerModel.dateTime.month}/"
                    "${Provider.of<DatePickerProvider>(context, listen: true).datePickerModel.dateTime.year}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      Provider.of<TimePickerProvider>(context, listen: false)
                          .pickTime(pickedTime: pickedTime!);
                    },
                    icon: Icon(
                      Icons.watch,
                      size: 35,
                    )),
                Text(
                    "${Provider.of<TimePickerProvider>(context, listen: true).timePicker.time.hour}:"
                    "${Provider.of<TimePickerProvider>(context, listen: true).timePicker.time.minute}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
