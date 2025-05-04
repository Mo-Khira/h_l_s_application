import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: "Search",
        labelStyle: TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 4),
          child: SizedBox(
            height: 16,
            width: 16,
            child: Center(
              child: SvgPicture.asset(
                'assets/svgs/search_lens.svg',
              ),
            ),
          ),
        ),
        contentPadding: EdgeInsets.all(12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Color(0xff9EFF00),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Color(0xff9EFF00),
          ),
        ),
      ),
    );
  }
}
