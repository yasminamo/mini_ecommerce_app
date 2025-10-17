import 'package:flutter/material.dart';
import 'package:miniecommerce_app/providers/cart_providers.dart';
import 'package:miniecommerce_app/widgets/shipping.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProviders = Provider.of<CartProviders>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(12),
              itemCount: cartProviders.items.length,
              itemBuilder: (context, index) {
                final item = cartProviders.items[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Image.network(
                            item.image,
                            width: screenWidth * 0.3,
                            height: screenWidth * 0.3,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.category!,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13),
                              ),
                              SizedBox(
                                height: screenHeight * 0.005,
                              ),
                              Text(
                                item.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.015,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: Color(0xff1F1F1F14),
                                          width: 1.5),
                                    ),
                                    child: IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          if (item.quantity > 1) {
                                            item.quantity--;
                                          } else {
                                            cartProviders
                                                .removeFromCart(item.id);
                                          }
                                          cartProviders.notifyListeners();
                                        },
                                        icon: Icon(
                                          Icons.remove,
                                          size: 22,
                                        )),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.06,
                                  ),
                                  Text(
                                    '${item.quantity}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.06,
                                  ),
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: Color(0xff1F1F1F14),
                                          width: 1.5),
                                    ),
                                    child: IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          item.quantity++;
                                          cartProviders.notifyListeners();
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          size: 22,
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: screenHeight * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon:
                                          Icon(Icons.favorite_border_outlined)),
                                  Text('\$${item.price.toString()}'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
          ShippingInformation(),
        ],
      ),
    );
  }
}
