import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_practice_21_oct_2022/Widgets/art_projects_list.dart';
import 'package:ui_practice_21_oct_2022/Widgets/explore_title.dart';
import 'package:ui_practice_21_oct_2022/Widgets/search_bar.dart';
import 'package:ui_practice_21_oct_2022/Widgets/single_tab.dart';
import 'package:ui_practice_21_oct_2022/Widgets/sliding_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController? controllerr;
  List<bool> _isDisabled = [true, false, false, false, false, false, false];
  AnimationController? _controller;
  Animation<Offset>? _animation;

  onTap() {
    if (_isDisabled[controllerr!.index]) {
      int index = controllerr!.previousIndex;
      setState(() {
        controllerr!.index = index;
      });
    }
  }

  ScrollController? _scrollController;
  bool lastStatus = true;
  double height = 280;

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
    controllerr = TabController(length: 7, vsync: this, initialIndex: 1);
    controllerr!.addListener(onTap);
    _scrollController = ScrollController()..addListener(_scrollListener);

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: const Offset(-0.5, 0.0),
      end: const Offset(0.5, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInCubic,
    ));
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
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: SliverOverlapAbsorberHandle(),
              sliver: SliverSafeArea(
                top: false,
                sliver: SliverAppBar(
                  foregroundColor: Colors.black,
                  leadingWidth: 80,
                  toolbarHeight: 100,
                  

                  //bottom: PreferredSize(
                  //  preferredSize: Size.fromHeight(50),
                  //  child: Text(''),
                  //),

                  //collapsedHeight: 70,

                  leading: AnimatedSwitcher(
                    duration: Duration(milliseconds: 200),
                    transitionBuilder: ((child, animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    }),
                    child: _isShrink
                        ? Container(
                            padding: const EdgeInsets.only(left: 30),
                            child: Container(
                              height: 33,
                              width: 33,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/avatar2.jpeg",
                                  ),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          )
                        : null,
                  ),
                  elevation: 0,
                  backgroundColor: _isShrink ? Colors.white : Colors.purple,
                  pinned: true,
                  stretch: false,
                  expandedHeight: heightMain * .4,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    title: null,
                    background: SafeArea(
                      child: SlidingBanner(),
                    ),
                  ),
                  actions:  [
                          AnimatedSwitcher(
                            duration: Duration(milliseconds: 200),
                            transitionBuilder: ((child, animation) {
                              return  ScaleTransition(
                                scale: animation,
                                child: child,
                              );
                            }),
                            child: _isShrink
                                ? SvgPicture.asset(
                                    "assets/menu-icon.svg",
                                    color: Colors.black.withOpacity(.5),
                                    height: 22,
                                    width: 22,
                                    fit: BoxFit.scaleDown,
                                  )
                                : null,
                          ),
                          SizedBox(
                            width: 40,
                          )
                        ],
                ),
              ),
            ),
          ];
        },
        body: SafeArea(
          top: false,
          bottom: false,
          child: Container(
            height: heightMain,
            width: widthMain,
            child: Column(
              children: [
                //SlidingBanner(),
                //_isShrink ?SearchBar():Container(),
                AnimatedSwitcher(
                  duration: Duration(
                    milliseconds: 1000,
                  ),
                  switchOutCurve: Curves.elasticOut,
                  switchInCurve: Curves.elasticIn,
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: child,
                    );
                  },
                  child: _isShrink
                      ? Container()
                      : Container(
                          height: 20,
                        ),
                ),
                SearchBar(),
                ExploreTitle(),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 40,
                  width: widthMain,
                  child: TabBar(
                    controller: controllerr,
                    isScrollable: true,
                    //padding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.symmetric(horizontal: 5),
                    //indicatorPadding: EdgeInsets.zero,
                    onTap: (value) {
                      print(value);
                      print(controllerr!.index);
                      setState(() {});
                    },

                    indicator: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      SizedBox(
                        width: 25,
                      ),
                      SingleTab(
                        icon: "assets/color-palette-icon.png",
                        title: "Art",
                        isSelected: controllerr!.index == 1,
                      ),
                      SingleTab(
                        icon: "assets/edu-icon.png",
                        title: "Education",
                        isSelected: controllerr!.index == 2,
                      ),
                      SingleTab(
                        icon: "assets/film-icon.png",
                        title: "Film",
                        isSelected: controllerr!.index == 3,
                      ),
                      SingleTab(
                        icon: "assets/health-icon.png",
                        title: "Health",
                        isSelected: controllerr!.index == 4,
                      ),
                      SingleTab(
                        icon: "assets/color-palette-icon.png",
                        title: "Art",
                        isSelected: controllerr!.index == 5,
                      ),
                      SingleTab(
                        icon: "assets/edu-icon.png",
                        title: "Education",
                        isSelected: controllerr!.index == 6,
                      ),
                    ],
                  ),
                ),

                //=====

                Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: controllerr,
                    children: [
                      Container(
                        child: Text(
                          "${controllerr!.index}",
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ArtProjectList(),
                      ArtProjectList(),
                      ArtProjectList(),
                      ArtProjectList(),
                      ArtProjectList(),
                      ArtProjectList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
