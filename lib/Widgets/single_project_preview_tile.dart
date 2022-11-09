import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SingleProjectPreviewTile extends StatelessWidget {
  const SingleProjectPreviewTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var heightMain = MediaQuery.of(context).size.height;
    var widthMain = MediaQuery.of(context).size.width;
    return Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 300,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 200,
                            width: widthMain,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/bg4.jpeg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            height: 200,
                            width: widthMain,
                            color: Colors.black.withOpacity(.1),
                          ),
                          Container(
                            height: 200,
                            width: widthMain,
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                                top: 20,
                                bottom: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "EVERSPACE 2",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
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
                                        " ROCKSTAR Games ",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
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
                                        "assets/clock-icon.svg",
                                        height: 16,
                                        width: 16,
                                        color: Colors.white,
                                        fit: BoxFit.scaleDown,
                                      ),
                                      Text(
                                        "  19 ",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        "Days Left",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.black.withOpacity(.1),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Target",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(.5),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 5,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "\$100,000 ",
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Text(
                                      "  33%",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: Colors.black.withOpacity(.5),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    SvgPicture.asset(
                                      "assets/thumbs-up-icon.svg",
                                      height: 14,
                                      width: 14,
                                      fit: BoxFit.scaleDown,
                                      color: Colors.black.withOpacity(.5),
                                    ),
                                    Text(
                                      " 86%",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: Colors.black.withOpacity(.5),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              LinearPercentIndicator(
                                //backgroundColor: CapecommColors.whiteColor,
                                fillColor: Colors.transparent,
                                progressColor: Colors.purple,
                                barRadius: Radius.circular(20),
                                backgroundColor: Colors.black.withOpacity(.5),
                                padding: EdgeInsets.zero,
                                percent: .7,
                                lineHeight: 4,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
  }
}