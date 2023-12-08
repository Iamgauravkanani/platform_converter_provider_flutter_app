import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../App/Material_Screen/Providers/Date_Picker_Provider/date_picker_provider.dart';
import '../../../../Platform_Provider/Provider/platform_provider.dart';

class Message_Screen extends StatelessWidget {
  const Message_Screen({super.key});

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
            CupertinoButton.filled(
              child: const Text("Show Time Picker"),
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
                        message: SizedBox(
                          height: 300,
                          child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.time,
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
              },
            ),
            CupertinoContextMenu(
              actions: const [
                CupertinoContextMenuAction(
                  isDefaultAction: true,
                  child: Text("Save"),
                ),
                CupertinoContextMenuAction(
                  isDestructiveAction: true,
                  child: Text("Share"),
                ),
                CupertinoContextMenuAction(child: Text("send")),
              ],
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://media.istockphoto.com/id/1195743934/vector/cute-panda-character-vector-design.jpg?s=612x612&w=0&k=20&c=J3ht-bKADmsXvF6gFIleRtfJ6NGhXnfIsrwlsUF8w80="),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(
                "${Provider.of<DatePickerProvider>(context, listen: true).datePickerModel.dateTime.hour}:"
                "${Provider.of<DatePickerProvider>(context, listen: true).datePickerModel.dateTime.minute}"),
            const SizedBox(
              height: 20,
            ),
            CupertinoButton.filled(
                child: const Text("Cupertino Alert Dialogue"),
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (ctx) => CupertinoAlertDialog(
                            title: const Text("Platform Convertor App"),
                            content: const Text("Do You Want to Continue??"),
                            actions: [
                              CupertinoDialogAction(
                                child: const Text("Yes"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                isDefaultAction: true,
                              ),
                              CupertinoDialogAction(
                                onPressed: () {},
                                child: const Text("No"),
                                isDestructiveAction: true,
                              ),
                            ],
                          ));
                }),
          ],
        ),
      ),
    );
  }
}
