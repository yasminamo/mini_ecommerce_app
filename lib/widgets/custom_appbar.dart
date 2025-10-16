import 'package:flutter/material.dart';

class CustomeAppbar extends StatelessWidget {
  const CustomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.045, vertical: screenHeight * 0.037),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/Logo Container@2x.png',
            height: screenHeight * 0.04,
            width: screenWidth * 0.3,
          ),
          Row(
            children: [
              Container(
                height: screenHeight * 0.06,
                width: screenHeight * 0.06,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Color(0xff1F1F1F14), width: 1.6),
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      size: screenHeight * 0.038,
                      color: Color(0xff002538),
                    )),
              ),
              SizedBox(
                width: screenWidth * 0.02,
              ),
              Stack(children: [
                Container(
                    height: screenHeight * 0.06,
                    width: screenHeight * 0.06,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border:
                          Border.all(color: Color(0xff1F1F1F14), width: 1.6),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(screenHeight * 0.01),
                      child: Image.asset(
                        'assets/images/ShoppingBag@2x.png',
                      ),
                    )),
                Positioned(
                  right: screenWidth * 0.025,
                  top: screenHeight * 0.014,
                  child: Container(
                    width: screenHeight * 0.010,
                    height: screenHeight * 0.010,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ),
                )
              ]),
            ],
          )
        ],
      ),
    );
  }
}
