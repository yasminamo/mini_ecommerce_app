import 'package:flutter/material.dart';
import 'package:miniecommerce_app/widgets/Banner.dart';
import 'package:miniecommerce_app/widgets/categories.dart';
import 'package:miniecommerce_app/widgets/custom_appbar.dart';
import 'package:miniecommerce_app/widgets/products_card.dart';
import 'package:miniecommerce_app/widgets/location_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          CustomeAppbar(),
          LocationBar(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          BannerSection(),
          CategoriesSection(),
          ProductsCard()
        ],
      ),
    ));
  }
}
