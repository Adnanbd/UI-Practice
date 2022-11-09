import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:ui_practice_21_oct_2022/Widgets/single_project_preview_tile.dart';
import 'package:ui_practice_21_oct_2022/project_details_screen.dart';

class ArtProjectList extends StatelessWidget {
  const ArtProjectList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var heightMain = MediaQuery.of(context).size.height;
    var widthMain = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 30,
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  //builder: (BuildContext context) => CreateProfileScreen(),
                  builder: (BuildContext context) => ProjectDetailsScreen(),
                ),
              );
            },
            child: const SingleProjectPreviewTile(),
          );
        },
      ),
    );
  }
}
