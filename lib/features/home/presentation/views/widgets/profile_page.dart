import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/core/utils/assets.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/user_details/data/user_info_cubit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final userInfo = context.watch<UserInfoCubit>().state;

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
                      "Profile",
                      style: Styles.textStyle20
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      padding: const EdgeInsetsDirectional.all(0),
                      icon: const Icon(
                        Icons.edit_square,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.kEditProfilePage);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                const CircleAvatar(
                  backgroundImage: AssetImage(AssetsData.logo),
                  backgroundColor: Colors.white,
                  radius: 55,
                ),
                const SizedBox(height: 15),
                Text(
                  "User Name",
                  style: Styles.textStyle16,
                ),
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              userInfo.weight.toString(),
                              style: Styles.textStyle18,
                            ),
                            Text(
                              "Kg",
                              style: Styles.textStyle14,
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Weight",
                          style: Styles.textStyle12,
                        ),
                      ],
                    ),
                    Container(
                      width: 1,
                      height: 50,
                      color: const Color(0x6969694D),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              userInfo.height.toString(),
                              style: Styles.textStyle18,
                            ),
                            Text(
                              "Cm",
                              style: Styles.textStyle14,
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Height",
                          style: Styles.textStyle12,
                        ),
                      ],
                    ),
                    Container(
                      width: 1,
                      height: 50,
                      color: const Color(0x6969694d),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              userInfo.age.toString(),
                              style: Styles.textStyle18,
                            ),
                            Text(
                              "Year",
                              style: Styles.textStyle14,
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Age",
                          style: Styles.textStyle12,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 61),
                Column(
                  children: [
                    // Edit Profile
                    ListTile(
                      onTap: () =>
                          GoRouter.of(context).push(AppRouter.kEditProfilePage),
                      leading: const Icon(Icons.person_3_outlined, size: 24),
                      title: Text("Edit Profile", style: Styles.textStyle20),
                      trailing:
                          const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    ),
                    const SizedBox(height: 16),

                    // Favorites
                    ListTile(
                      onTap: () =>
                          GoRouter.of(context).push(AppRouter.kFavoritesPage),
                      leading:
                          const Icon(Icons.favorite_border_rounded, size: 24),
                      title: Text("Favorites", style: Styles.textStyle20),
                      trailing:
                          const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    ),
                    const SizedBox(height: 16),

                    // Settings
                    ListTile(
                      onTap: () =>
                          GoRouter.of(context).push(AppRouter.kSettingsPage),
                      leading: const Icon(Icons.settings, size: 24),
                      title: Text("Settings", style: Styles.textStyle20),
                      trailing:
                          const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      onTap: () => GoRouter.of(context)
                          .push(AppRouter.kHelpAndSupportPage),
                      leading: const Icon(Icons.help_outline_rounded, size: 24),
                      title: Text("Help & Support", style: Styles.textStyle20),
                      trailing:
                          const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    ),
                    const SizedBox(height: 32),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.logout_outlined, size: 24),
                      title: Text("Log Out", style: Styles.textStyle20),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    ),
                    const SizedBox(height: 20),
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
