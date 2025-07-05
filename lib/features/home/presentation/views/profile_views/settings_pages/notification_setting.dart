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
  bool disturbMode = false;
  bool vibrate = true;
  bool lockScreen = true;
  bool reminders = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                    buildSwitchTile(
                      title: 'General Notification',
                      value: generalNotification,
                      onChanged: (val) =>
                          setState(() => generalNotification = val),
                    ),
                    buildSwitchTile(
                      title: 'Sound',
                      value: sound,
                      onChanged: (val) => setState(() => sound = val),
                    ),
                    buildSwitchTile(
                      title: 'Don\'t Disturb Mode',
                      value: disturbMode,
                      onChanged: (val) => setState(() => disturbMode = val),
                    ),
                    buildSwitchTile(
                      title: 'Vibrate',
                      value: vibrate,
                      onChanged: (val) => setState(() => vibrate = val),
                    ),
                    buildSwitchTile(
                      title: 'Lock Screen',
                      value: lockScreen,
                      onChanged: (val) => setState(() => lockScreen = val),
                    ),
                    buildSwitchTile(
                      title: 'Reminders',
                      value: reminders,
                      onChanged: (val) => setState(() => reminders = val),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSwitchTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SwitchListTile(
        contentPadding: EdgeInsets.zero,
        activeColor: Colors.white,
        activeTrackColor: kSecondaryColor,
        // inactiveThumbColor: Colors.black,
        title: Text(title, style: Styles.textStyle20),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
