import 'package:flutter/material.dart';
import 'package:miniecommerce_app/providers/cart_providers.dart';
import 'package:miniecommerce_app/widgets/cart_item.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProviders = Provider.of<CartProviders>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border_outlined),
            iconSize: screenWidth * 0.06,
          )
        ],
        title: Text(
          'Cart',
          style: TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.06,
              color: Color(0xff1F1F1F)),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          color: Colors.blueGrey,
          iconSize: screenWidth * 0.05,
        ),
      ),
      body: SafeArea(
        child: cartProviders.items.isEmpty
            ? Center(
                child: Text(
                  'Your cart is empty',
                  style: TextStyle(fontSize: screenWidth * 0.045),
                ),
              )
            : SingleChildScrollView(
                child: Padding(padding: EdgeInsets.all(12), child: CartItem()),
              ),
      ),
    );
  }
}
