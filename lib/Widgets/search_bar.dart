import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var heightMain = MediaQuery.of(context).size.height;
    var widthMain = MediaQuery.of(context).size.width;
    var heightTop = MediaQuery.of(context).viewPadding.top;
    return Container(
              height: 60,
              //color: Colors.amber,
              width: widthMain,
              padding:const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(
                
                bottom: 30,
                left: 40,
                right: 40,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.black.withOpacity(.05),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/search-icon.svg",
                    height: 22,
                    width: 22,
                    fit: BoxFit.scaleDown,
                    color: Colors.black.withOpacity(.5),
                  ),
                  Expanded(
                    child: TextField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          hintText: "Search for projects etc",
                          hintStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(.5),
                          )),
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/settings-sliders-icon.svg",
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