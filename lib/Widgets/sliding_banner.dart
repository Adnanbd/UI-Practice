import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SlidingBanner extends StatefulWidget {
  SlidingBanner({Key? key}) : super(key: key);

  @override
  State<SlidingBanner> createState() => _SlidingBannerState();
}

final List<String> imgList = [
  'assets/bg.jpeg',
  'assets/bg1.jpeg',
  'assets/bg3.png',
];

class _SlidingBannerState extends State<SlidingBanner> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    var heightMain = MediaQuery.of(context).size.height;
    var widthMain = MediaQuery.of(context).size.width;
    var heightTop = MediaQuery.of(context).viewPadding.top;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: heightMain * .4,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/bg.jpeg",
                ),
                fit: BoxFit.fitWidth),
          ),
        ),
        Container(
          height: heightMain * .4,
          width: widthMain,
          color: Colors.black.withOpacity(.2),
        ),
        Container(
          height: heightMain * .4,
          child: CarouselSlider(
            items:
                ['Bring a\ncreative\nproject to life', 'Discover\nplay\nnew world', 'Be Confident\nand\nshow the world'].map((e) {
              return Container(
                width: widthMain,
                height: heightMain * .4,
                padding: EdgeInsets.symmetric(
                  vertical: 70,
                  horizontal: 40,
                ),
                alignment: Alignment.bottomLeft,
                child: Text(
                  "$e",
                  style: GoogleFonts.poppins(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    height: 1.2
                  ),
                ),
              );
            }).toList(),
            //items: imgList
            //    .map((item) => Container(
            //          child: Image.asset(
            //            item,
            //            fit: BoxFit.cover,
            //            width: widthMain,
            //          ),
            //        ))
            //    .toList(),
            carouselController: _controller,
            options: CarouselOptions(
                viewportFraction: 1.0,
                autoPlay: false,
                enlargeCenterPage: false,
                height: heightMain * .4,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          height: heightMain * .4,
          child: Column(
            children: [
              SizedBox(
                height: heightTop,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Container(
                  //  height: 55,
                  //  width: 55,
                  //  decoration: const BoxDecoration(
                  //    shape: BoxShape.circle,
                  //    image: DecorationImage(
                  //      image: AssetImage(
                  //        "assets/avatar.png",
                  //      ),
                  //      fit: BoxFit.fitWidth,
                  //    ),
                  //  ),
                  //),
                  //SvgPicture.asset(
                  //  "assets/menu-icon.svg",
                  //  color: Colors.white,
                  //  height: 22,
                  //  width: 22,
                  //  fit: BoxFit.scaleDown,
                  //),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 35.0,
                  height: 4.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 6.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: _current == entry.key
                              ? Colors.white
                              : Colors.transparent,
                          blurRadius: 6.0,
                          spreadRadius: 1.0,
                          offset: Offset(
                            0.0,
                            0.0,
                          ),
                        ),
                      ],
                      color: Colors.white
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
