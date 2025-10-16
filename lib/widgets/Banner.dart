import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class BannerSection extends StatefulWidget {
  const BannerSection({super.key});

  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  final PageController pageController = PageController();
  int currentPage = 0;

  final List<String> bannerImages = [
    'assets/images/banner1.jpg',
    'assets/images/banner4.webp',
    'assets/images/banner5.jpg'
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: screenHeight * 0.25,
          width: screenWidth,
          child: PageView.builder(
            controller: pageController,
            itemCount: bannerImages.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    bannerImages[index],
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: screenHeight * 0.015),
        DotsIndicator(
          dotsCount: bannerImages.length,
          position: currentPage.toDouble(),
          decorator: DotsDecorator(
            activeColor: Colors.black,
            color: Colors.grey,
            size: Size(screenWidth * 0.02, screenWidth * 0.02),
            activeSize: Size(screenWidth * 0.04, screenWidth * 0.02),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        ),
      ],
    );
  }
}
