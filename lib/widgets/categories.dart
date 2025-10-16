import 'package:flutter/material.dart';
import 'package:miniecommerce_app/Services/Get_All_Categories.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriesapi = AllCategories();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final Map<String, String> CategoriesImages = {
      "women's clothing": 'assets/images/woman-dress-.webp',
      "men's clothing": 'assets/images/man.webp',
      "jewelery": 'assets/images/jewellery.png',
      "electronics": 'assets/images/electronics.png'
    };

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.06, vertical: screenHeight * 0.012),
      child: Column(
        children: [
          FutureBuilder<List<dynamic>>(
              future: categoriesapi.getallcategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error : ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No Categories Found');
                } else {
                  final categories = snapshot.data!;

                  return SizedBox(
                    height: screenHeight * 0.14,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => SizedBox(
                        width: screenWidth * 0.04,
                      ),
                      itemCount: CategoriesImages.length,
                      itemBuilder: (context, index) {
                        final Category = categories[index];
                        final imagepath = CategoriesImages[Category] ??
                            'assets/images/default.png';
                        return Column(
                          children: [
                            Container(
                              width: screenWidth * 0.18,
                              height: screenWidth * 0.18,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(imagepath),
                                    fit: BoxFit.contain),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.008),
                            SizedBox(
                              width: screenWidth * 0.22,
                              child: Text(
                                Category.toString().toUpperCase(),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.032,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }
}
