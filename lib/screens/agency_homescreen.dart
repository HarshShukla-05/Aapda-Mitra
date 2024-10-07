import 'dart:async';

import 'package:aapda_mitra/app_theme.dart';
import 'package:aapda_mitra/core/constants/constants.dart';
import 'package:flutter/material.dart';

class AgencyHomeScreen extends StatefulWidget {
  const AgencyHomeScreen({super.key});

  @override
  State<AgencyHomeScreen> createState() => _AgencyHomeScreenState();
}

class _AgencyHomeScreenState extends State<AgencyHomeScreen> {
  // ignore: prefer_final_fields
  int _activePage = 0;
  Timer? _timer;
  final PageController _pageController = PageController(initialPage: 0);
  final List<String> imagePaths = [
    Constants.newsImage,
    Constants.newsImage,
    Constants.newsImage,
    Constants.newsImage,
  ];
  final Map<String, String> agenciesImagePaths = {
    "NDRF": Constants.ndrfImage,
    "SDRF": Constants.sdrfImage,
    "NAVY": Constants.navyImage,
    "NDRF-SDRF": Constants.navyImage,
  };

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.page == imagePaths.length - 1) {
        //Checks if it's on last page
        _pageController.animateToPage(0,
            duration: const Duration(milliseconds: 1), curve: Curves.easeInOut);
      } else {
        _pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        centerTitle: true,
        title: const Text(
          "Aapda Mitra",
          style: TextStyle(
              fontFamily: AppTheme.defaultFont,
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: AppTheme.boldTextColor),
        ),
        leading: _buildAppBarIcon(),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              width: 21,
              Constants.settingsIcon,
              color: AppTheme.primaryColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              border: BorderDirectional(
                  top: BorderSide(color: AppTheme.primaryDividerColor))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 25),
                  Baseline(
                    baseline: 35.0,
                    baselineType: TextBaseline.alphabetic,
                    child: SizedBox(
                      width: 24,
                      child: Image.asset(
                        Constants.targettIcon,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Flexible(
                    child: Baseline(
                      baseline: 24.0, // Same baseline for the text
                      baselineType: TextBaseline.alphabetic,
                      child: Text(
                        "Thakur College of Engineering and Technology",
                        style: TextStyle(
                          fontFamily: AppTheme.defaultFont,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF4F4F4F),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              _buildNewsCarousel(screenSize),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFF687684),
                  ),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Center(
                        child: Text(
                          "Current Zone",
                          style: TextStyle(
                            fontFamily: AppTheme.defaultFont,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF4F4F4F),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 21,
                      height: 21,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF80C904),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFF687684),
                  ),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Center(
                        child: Text(
                          "Dial 112 for Emergency",
                          style: TextStyle(
                            fontFamily: AppTheme.defaultFont,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF4F4F4F),
                          ),
                        ),
                      ),
                    ),
                    Image.asset(
                      Constants.callIcon,
                      width: 21,
                      color: const Color(0xFFEB4C56),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFF687684),
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      children: [
                        Text(
                          "Recent Incidents",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: AppTheme.secondaryFont,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Color(0xFF4F4F4F),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: [
                            Text(
                              "3.8\nmagnitude",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: AppTheme.secondaryFont,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Color(0xFF4F4F4F),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(
                                children: [
                                  Text(
                                    "DELHI",
                                    style: TextStyle(
                                      fontFamily: AppTheme.secondaryFont,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: Color(0xFF4F4F4F),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Wrap(
                                children: [
                                  Text(
                                    "SUN SEP 10 09:31:17 IST 2023",
                                    style: TextStyle(
                                      fontFamily: AppTheme.secondaryFont,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: Color(0xFF687684),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: const Row(
                  children: [
                    Text(
                      "Agencies & Forces",
                      style: TextStyle(
                          fontFamily: AppTheme.secondaryFont,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: AppTheme.primaryColor),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Divider(
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                children: _buildAgencyCards(),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Container(
          decoration: const BoxDecoration(
              color: AppTheme.primaryColor, shape: BoxShape.circle),
          child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                Constants.locationIcon,
                color: Colors.white,
                width: 25,
                height: 25,
              )),
        ),
      ),
      bottomNavigationBar:
          BottomNavigationBar(type: BottomNavigationBarType.fixed, items: [
        BottomNavigationBarItem(
            label: "",
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                Constants.homeIcon,
                color: AppTheme.primaryColor,
                width: 20,
              ),
            )),
        BottomNavigationBarItem(
            label: "",
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                Constants.messageIcon,
                color: const Color(0xFF687684),
                width: 20,
              ),
            )),
        BottomNavigationBarItem(
            label: "",
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                Constants.statusIcon,
                color: const Color(0xFF687684),
                width: 20,
              ),
            )),
        BottomNavigationBarItem(
            label: "",
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                Constants.newsIcon,
                color: const Color(0xFF687684),
                width: 20,
              ),
            )),
        BottomNavigationBarItem(
            label: "",
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                Constants.userIcon,
                color: const Color(0xFF687684),
                width: 20,
              ),
            )),
      ]),
    );
  }

  List<Container> _buildAgencyCards() {
    List<Container> agenciesCards = [];
    for (var item in agenciesImagePaths.entries) {
      agenciesCards.add(Container(
        height: 100,
        width: 110,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  item.value,
                  width: 40,
                  height: 40,
                ),
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                item.key,
                style: const TextStyle(
                    fontFamily: AppTheme.defaultFont,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 10),
              ),
            ),
          ],
        ),
      ));
    }
    return agenciesCards;
  }

  Widget _buildNewsCarousel(Size screenSize) {
    return Column(
      children: [
        SizedBox(
          width: screenSize.width - 10,
          height: 160,
          child: PageView.builder(
            padEnds: false,
            scrollDirection: Axis.horizontal,
            itemCount: imagePaths.length,
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                _activePage = value;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: 344,
                  height: 156,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          imagePaths[index],
                        )),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 2,
                      color: const Color(0xFF687684),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
                imagePaths.length,
                (index) => Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: InkWell(
                        onTap: () {
                          _pageController.animateTo(index as double,
                              duration: const Duration(microseconds: 300),
                              curve: Curves.easeInOut);
                        },
                        child: CircleAvatar(
                          radius: 4,
                          backgroundColor: _activePage == index
                              ? AppTheme.primaryColor
                              : const Color(0xFFC4C4C4),
                        ),
                      ),
                    )),
          ),
        )
      ],
    );
  }

  Widget _buildAppBarIcon() {
    return Stack(
      children: [
        Center(
          child: SizedBox(
            width: 60,
            height: 60,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: CircularClipper(),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(73, 174, 192, 1),
                            Color.fromRGBO(53, 138, 159, 1)
                          ],
                        ),
                        shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Center(
                        child: Image.asset(
                          Constants.appLogo,
                          width: 22,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 11.2,
                  right: 9,
                  child: Container(
                    width: 7.1,
                    height: 7.1,
                    decoration: const BoxDecoration(
                        color: Colors.blue, shape: BoxShape.circle),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Custom Clipper for the Main Circular

class CircularClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    path.lineTo(((size.width) / 2) + 11.5, 0);

    path.quadraticBezierTo(((size.width) / 2) + 7.5, 12.5, (size.width),
        ((size.height) / 2) - 11.5);
    path.quadraticBezierTo(
        size.width + 8, size.height + 8, (size.width) / 2, (size.height));
    path.quadraticBezierTo(0, (size.height), 0, (size.height) / 2);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
