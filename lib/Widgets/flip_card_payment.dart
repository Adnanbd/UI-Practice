import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FlipCardPayment extends StatelessWidget {
  const FlipCardPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var heightMain = MediaQuery.of(context).size.height;
    var widthMain = MediaQuery.of(context).size.width;
    var heightTop = MediaQuery.of(context).viewPadding.top;
    return FlipCard(
      fill: Fill
          .fillBack, // Fill the back side of the card to make in the same size as the front.
      direction: FlipDirection.HORIZONTAL, // default
      front: Container(
        height: 220,
        width: widthMain * .8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1.8,
            color: Colors.black.withOpacity(.2),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      "assets/visa-seeklogo.svg",
                      height: 20,
                      fit: BoxFit.scaleDown,
                    ),
                    Text(
                      "6038 9908\n6038 9908",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Row(
                      children: [
                        Text(
                          "Exp ",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          "09/24",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                //borderRadius: BorderRadius.circular(25),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: AssetImage("assets/bg2.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            )),
          ],
        ),
      ),
      back: Container(
        height: 220,
        width: widthMain * .8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1.8,
            color: Colors.black.withOpacity(.2),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      "assets/visa-seeklogo.svg",
                      height: 20,
                      fit: BoxFit.scaleDown,
                    ),
                    Text(
                      "6038 9908\n6038 9908",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Row(
                      children: [
                        Text(
                          "Exp ",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          "09/24",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                //borderRadius: BorderRadius.circular(25),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: AssetImage("assets/bg2.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
