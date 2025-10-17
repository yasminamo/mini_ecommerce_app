import 'package:flutter/material.dart';
import 'package:miniecommerce_app/Models/cart_model.dart';
import 'package:miniecommerce_app/providers/cart_providers.dart';
import 'package:provider/provider.dart';

class CustomeCard extends StatelessWidget {
  const CustomeCard(
      {super.key,
      required this.title,
      required this.price,
      required this.imageUrl,
      required this.rating,
      required this.category,
      required this.id});
  final String title;
  final int id;
  final String price;
  final String imageUrl;
  final String rating;
  final String category;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenHeight * 0.015)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(screenHeight * 0.008),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(screenHeight * 0.01)),
                  child: Image.network(
                    imageUrl,
                    height: screenHeight * 0.18,
                    width: screenWidth * 0.4,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenHeight * 0.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(fontSize: screenHeight * 0.02),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: screenHeight * 0.018,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: screenWidth * 0.02),
                      child: Text(rating),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$$price',
                      style: TextStyle(
                        fontSize: screenHeight * 0.017,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        final cart =
                            Provider.of<CartProviders>(context, listen: false);
                        cart.addToCart(
                          CartModel(
                              id: id,
                              title: title,
                              price: double.parse(price),
                              image: imageUrl,
                              category: category),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Added to cart ')),
                        );
                      },
                      icon: Icon(
                        Icons.add_shopping_cart,
                        size: screenHeight * 0.022,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
