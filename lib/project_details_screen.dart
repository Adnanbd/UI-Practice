import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:readmore/readmore.dart';
import 'package:ui_practice_21_oct_2022/Widgets/art_projects_list.dart';
import 'package:ui_practice_21_oct_2022/Widgets/details_banner.dart';
import 'package:ui_practice_21_oct_2022/Widgets/explore_title.dart';
import 'package:ui_practice_21_oct_2022/Widgets/search_bar.dart';
import 'package:ui_practice_21_oct_2022/Widgets/single_tab.dart';
import 'package:ui_practice_21_oct_2022/Widgets/sliding_banner.dart';
import 'package:ui_practice_21_oct_2022/global.dart';
import 'package:ui_practice_21_oct_2022/payment_screen.dart';

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen>
    with TickerProviderStateMixin {
  ScrollController? _scrollController;
  bool lastStatus = true;
  double height = 111;

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  bool get _isShrink {
    return _scrollController != null &&
        _scrollController!.hasClients &&
        _scrollController!.offset > (height - kToolbarHeight);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollListener);
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var heightMain = MediaQuery.of(context).size.height;
    var widthMain = MediaQuery.of(context).size.width;
    var heightTop = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DetailsBanner(),
            Container(
              color: Colors.black.withOpacity(.05),
              height: 160,
              margin: EdgeInsets.zero,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Budget",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.black.withOpacity(.5),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Target",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.black.withOpacity(.5),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$100,000",
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "\$220,000",
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
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
                    backgroundColor: Colors.black.withOpacity(.2),
                    padding: EdgeInsets.zero,
                    percent: .7,
                    lineHeight: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/users-icon.svg",
                              height: 16,
                              width: 16,
                              color: Colors.black.withOpacity(.5),
                              fit: BoxFit.scaleDown,
                            ),
                            Text(
                              "  4,765 ",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Backers",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.black.withOpacity(.5),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 30,
                          width: 1,
                          color: Colors.black.withOpacity(.4),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/clock-icon.svg",
                              height: 16,
                              width: 16,
                              color: Colors.black.withOpacity(.5),
                              fit: BoxFit.scaleDown,
                            ),
                            Text(
                              "  19 ",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Days Left",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.black.withOpacity(.5),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product Info",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  ReadMoreText(
                    longText,
                    trimLines: 3,
                    colorClickableText: Colors.purple,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Read more',
                    trimExpandedText: 'Read less',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(.6)),
                    moreStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.purple),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: 90,
                    alignment: Alignment.center,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 15,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 90,
                          width: 90,
                          margin: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/bg.jpeg",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  MaterialButton(
                    height: 60,
                    minWidth: widthMain,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          //builder: (BuildContext context) => CreateProfileScreen(),
                          builder: (BuildContext context) =>
                              PaymentScreen(),
                        ),
                      );
                    },
                    elevation: 0,
                    color: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Back this project",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
