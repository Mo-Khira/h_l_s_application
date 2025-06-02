import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/Home_view/widgets/heart_pulse.dart';

class HeartState extends StatefulWidget {
  final String text;
  final String iconPath;
  const HeartState({
    super.key,
    required this.text,
    required this.iconPath,
  });

  @override
  State<HeartState> createState() => _HeartStateState();
}

class _HeartStateState extends State<HeartState> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 175,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(widget.iconPath),
                Text(
                  widget.text,
                  style: Styles.textStyle16.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const HeartBeatAnimation(),
          ],
        ),
      ),
    );
  }
}
