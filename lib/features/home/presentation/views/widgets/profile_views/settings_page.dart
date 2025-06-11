import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/core/utils/styles.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Row(
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
                      "Settings",
                      style: Styles.textStyle20
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(),
                  ],
                ),
                const SizedBox(height: 60),
                Column(
                  children: [
                    ListTile(
                      onTap: () =>
                          GoRouter.of(context).push(AppRouter.kReminderPage),
                      leading:
                          const Icon(Icons.notifications_outlined, size: 24),
                      title: Text("Reminder", style: Styles.textStyle20),
                      trailing:
                          const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                      contentPadding: EdgeInsets.zero,
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      onTap: () => GoRouter.of(context)
                          .push(AppRouter.kChangePasswordPage),
                      leading: const Icon(Icons.lock_open_rounded, size: 24),
                      title: Text("Change Password", style: Styles.textStyle20),
                      trailing: const Icon(Icons.arrow_forward_ios_outlined,
                          size: 16),
                      contentPadding: EdgeInsets.zero,
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      onTap: () => GoRouter.of(context)
                          .push(AppRouter.kNotificationSettingPage),
                      leading: const Icon(Icons.notification_important_outlined,
                          size: 24),
                      title: Text("Notification Setting",
                          style: Styles.textStyle20),
                      trailing:
                          const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                      contentPadding: EdgeInsets.zero,
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      onTap: () => GoRouter.of(context)
                          .push(AppRouter.kHelpAndSupportPage),
                      leading: const Icon(Icons.help_outline_rounded, size: 24),
                      title: Text("Help & Support", style: Styles.textStyle20),
                      trailing:
                          const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                      contentPadding: EdgeInsets.zero,
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
