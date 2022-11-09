import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsBanner extends StatelessWidget {
  const DetailsBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var heightMain = MediaQuery.of(context).size.height;
    var widthMain = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          height: heightMain * .4,
          width: widthMain,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg4.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: heightMain * .4,
          width: widthMain,
          color: Colors.black.withOpacity(.2),
        ),
        Positioned(
          top: 20,
          child: Container(
            width: widthMain,
            padding: EdgeInsets.all(40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.more_horiz,
                  size: 24,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: widthMain,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Graphene Headphones",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Advanced nano-materials for hign\nperformance audio",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/company-propic.png",
                          ),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Text(
                      "  ROCKSTAR Games ",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/twitter-verified-badge.svg",
                      height: 16,
                      width: 16,
                      fit: BoxFit.scaleDown,
                    ),
                    Expanded(child: Container()),
                    SvgPicture.asset(
                      "assets/marker.svg",
                      height: 12,
                      width: 12,
                      color: Colors.white,
                      fit: BoxFit.scaleDown,
                    ),
                    Text(
                      " Canada",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
