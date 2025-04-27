import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/app_router.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/auth/presentation/views/widgets/custom_login_button.dart';

class UserHeightPage extends StatefulWidget {
  @override
  _UserHeightPage createState() => _UserHeightPage();
}

class _UserHeightPage extends State<UserHeightPage> {
  bool isKgSelected = true;
  TextEditingController weightController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive design
    double screenWidth = kWidth(context);
    double screenHeight = kHeight(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
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
                        "How much do you height ?",
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.15,
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // KG / LBS Toggle
                          Container(
                            width: 122,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                _buildToggleButton("FEET", !isKgSelected),
                                _buildToggleButton("CM", isKgSelected),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          // Weight Input Box (Perfectly Aligned)
                          Container(
                            width: screenWidth * 0.8,
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Number Input
                                SizedBox(
                                  width: 45,
                                  child: TextField(
                                    maxLength: 3,
                                    controller: weightController,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    style: Styles.textStyle24,
                                    decoration: const InputDecoration(
                                      counterText: "",
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.zero,
                                    ),
                                  ),
                                ),

                                // Vertical Separator
                                Container(
                                  width: 1,
                                  height: 25,
                                  color: Colors.white,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                ),

                                // Unit Text (kg/lbs)
                                Text(isKgSelected ? "Cm   " : "feet  ",
                                    style: Styles.textStyle24),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.08,
                  ),
                  CustomLoginButton(
                    text: "Next Steps",
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kUserFitnessPage);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton(String label, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isKgSelected = label == "CM";
          });
        },
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? kSecondaryColor : Colors.transparent,
          ),
          child: Center(
            child: Text(
              label,
              style: Styles.textStyle22.copyWith(
                color: isSelected ? Colors.black : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
