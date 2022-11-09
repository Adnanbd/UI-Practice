import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreTitle extends StatelessWidget {
  const ExploreTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    "Explore Project",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/sort-icon.svg",
                    height: 22,
                    width: 22,
                    fit: BoxFit.scaleDown,
                    color: Colors.black.withOpacity(.5),
                  ),
                ],
              ),
            );
  }
}