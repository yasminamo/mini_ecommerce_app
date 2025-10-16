import 'package:flutter/material.dart';

class LocationBar extends StatelessWidget {
  const LocationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.08,
      width: screenWidth * 0.95,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xff1F1F1F14), width: 1.6),
        borderRadius: BorderRadius.all(Radius.circular(screenHeight * 0.09)),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenHeight * 0.006),
        child: Row(
          children: [
            Container(
              height: screenHeight * 0.065,
              width: screenHeight * 0.065,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xff1F1F1F0A)),
              child: Icon(
                Icons.location_on_outlined,
                color: Color(0xff002538),
                size: screenHeight * 0.038,
              ),
            ),
            SizedBox(
              width: screenWidth * 0.02,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Send to ',
                  style: TextStyle(
                      color: Colors.grey, fontSize: screenHeight * 0.016),
                ),
                SizedBox(
                  height: screenHeight * 0.005,
                ),
                Text(
                  ' Brisbane, Queeensland ',
                  style: TextStyle(
                      color: Color(0xff1F1F1F), fontSize: screenHeight * 0.021),
                ),
              ],
            )),
            SizedBox(
              height: screenHeight * 0.07,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff015B8A),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenHeight * 0.032),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Change',
                    style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: screenHeight * 0.021),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
