import 'package:flutter/material.dart';
import 'package:h_l_s_application/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: Colors.black, // TODO this
      body: SplashViewBody(),
    );
  }
}
