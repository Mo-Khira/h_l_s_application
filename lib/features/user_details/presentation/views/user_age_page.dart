import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';
import 'package:h_l_s_application/features/user_details/data/user_info_cubit.dart';

class UserAgePage extends StatefulWidget {
  @override
  _UserAgePage createState() => _UserAgePage();
}

class _UserAgePage extends State<UserAgePage> {
  int selectedAge = 18;
  FixedExtentScrollController _controller =
      FixedExtentScrollController(initialItem: 18 - 12);

  @override
  Widget build(BuildContext context) {
    return
        //  BlocProvider(
        //   create: (context) => UserInfoCubit(),
        //   child:
        SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 24,
                ),
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
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kHomeView);
                      },
                      child: Text("Skip",
                          style: Styles.textStyle14.copyWith(
                              color: kSecondaryColor,
                              fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "How old are you ?",
                      style: Styles.textStyle20
                          .copyWith(fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: kWidth(context) * 2,
                  height: kHeight(context) * 0.6,
                  child: ListWheelScrollView.useDelegate(
                    controller: _controller, // Set the controller here
                    physics: const FixedExtentScrollPhysics(),
                    itemExtent: 80, // Adjusted for better alignment
                    diameterRatio: 1000,
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        selectedAge = 12 + index;
                      });
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        int age = 12 + index;
                        return Center(
                          child: Container(
                            height: 45,
                            width: 67,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: selectedAge == age
                                  ? kSecondaryColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              "$age",
                              style: Styles.textStyle32.copyWith(
                                color: selectedAge == age
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: 69, // Range from 12 to 80
                    ),
                  ),
                ),
                CustomLoginButton(
                  text: "Next Steps",
                  onPressed: () {
                    context.read<UserInfoCubit>().setAge(selectedAge);
                    // BlocProvider.of<UserInfoCubit>(context)
                    //     .setAge(selectedAge);
                    GoRouter.of(context).push(
                      '${AppRouter.kUserInfoInputs}/${AppRouter.kUserWeightPage}',
                      // AppRouter.kUserWeightPage,
                      // '${AppRouter.kOnboarding}/${AppRouter.kUserWeightPage}',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      // ),
    );
  }
}
