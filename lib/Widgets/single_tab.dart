import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleTab extends StatelessWidget {
  final String icon;
  final String title;
  final bool isSelected;

  const SingleTab({
    Key? key,
    required this.icon,
    required this.title,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 40,
      child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.05),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              height: 35,
              width: 35,
              fit: BoxFit.scaleDown,
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: isSelected ? Colors.white: Colors.black.withOpacity(.5)),
            ),
          ],
        ),
      ),
    );
  }
}
