import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({super.key});

  @override
  State<NotificationSetting> createState() => _NotificationSetting();
}

class _NotificationSetting extends State<NotificationSetting> {
  bool generalNotification = true;
  bool sound = true;
  bool disturbMode = true;
  bool vibrate = true;
  bool lockScreen = true;
  bool reminders = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        padding: const EdgeInsetsDirectional.all(0),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () {
                          GoRouter.of(context).pop();
                        },
                      ),
                      Text(
                        "Notification Setting",
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                Column(
                  children: [
                    SwitchListTile(
                      contentPadding: const EdgeInsets.all(0),
                      activeColor: Colors.white,
                      activeTrackColor: kSecondaryColor,
                      inactiveThumbColor: Colors.black,
                      title: Text(
                        'General Notification',
                        style: Styles.textStyle20,
                      ),
                      value: generalNotification,
                      onChanged: (bool value) {
                        setState(() {
                          generalNotification = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    SwitchListTile(
                      contentPadding: const EdgeInsets.all(0),
                      activeColor: Colors.white,
                      activeTrackColor: kSecondaryColor,
                      inactiveThumbColor: Colors.black,
                      title: Text(
                        'Sound',
                        style: Styles.textStyle20,
                      ),
                      value: sound,
                      onChanged: (bool value) {
                        setState(() {
                          sound = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    SwitchListTile(
                      contentPadding: const EdgeInsets.all(0),
                      activeColor: Colors.white,
                      activeTrackColor: kSecondaryColor,
                      inactiveThumbColor: Colors.black,
                      title: Text(
                        'Don\'t Disturb Mode',
                        style: Styles.textStyle20,
                      ),
                      value: disturbMode,
                      onChanged: (bool value) {
                        setState(() {
                          disturbMode = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    SwitchListTile(
                      contentPadding: const EdgeInsets.all(0),
                      activeColor: Colors.white,
                      activeTrackColor: kSecondaryColor,
                      inactiveThumbColor: Colors.black,
                      title: Text(
                        'Vibrate',
                        style: Styles.textStyle20,
                      ),
                      value: vibrate,
                      onChanged: (bool value) {
                        setState(() {
                          vibrate = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    SwitchListTile(
                      contentPadding: const EdgeInsets.all(0),
                      activeColor: Colors.white,
                      activeTrackColor: kSecondaryColor,
                      inactiveThumbColor: Colors.black,
                      title: Text(
                        'Lock Screen',
                        style: Styles.textStyle20,
                      ),
                      value: lockScreen,
                      onChanged: (bool value) {
                        setState(() {
                          lockScreen = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    SwitchListTile(
                      contentPadding: const EdgeInsets.all(0),
                      activeColor: Colors.white,
                      activeTrackColor: kSecondaryColor,
                      inactiveThumbColor: Colors.black,
                      title: Text(
                        'Reminders',
                        style: Styles.textStyle20,
                      ),
                      value: reminders,
                      onChanged: (bool value) {
                        setState(() {
                          reminders = value;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
