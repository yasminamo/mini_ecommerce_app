import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:miniecommerce_app/providers/cart_providers.dart';

class ShippingInformation extends StatelessWidget {
  const ShippingInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final cartProviders = Provider.of<CartProviders>(context);
    final total = cartProviders.totalPrice;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.025, vertical: screenHeight * 0.01),
      child: Column(
        children: [
          Divider(
            thickness: 3,
            color: Colors.grey[300],
            height: screenHeight * 0.015,
          ),
          SizedBox(
            height: screenHeight * 0.013,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Shipping Information',
              style: TextStyle(fontSize: screenHeight * 0.023),
            ),
          ),
          SizedBox(height: screenHeight * 0.025),
          Container(
            padding: const EdgeInsets.all(14),
            height: screenHeight * 0.08,
            width: screenWidth * 0.95,
            decoration: BoxDecoration(
              color: Color(0xff1D1D1D0A),
              borderRadius: BorderRadius.circular(screenHeight * 0.015),
            ),
            child: Row(
              children: [
                Image.asset('assets/images/card.png'),
                SizedBox(
                  width: screenWidth * 0.04,
                ),
                Expanded(child: Text('**** ' '**** ' '**** ' '5124')),
                SizedBox(
                  width: screenWidth * 0.1,
                ),
                Icon(Icons.keyboard_arrow_down_outlined),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.025),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(fontSize: screenHeight * 0.021),
              ),
              Text('\$${total}'),
            ],
          ),
          SizedBox(height: screenHeight * 0.013),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shipping Fee',
                style: TextStyle(fontSize: screenHeight * 0.021),
              ),
              Text('\$${'0.00'}'),
            ],
          ),
          SizedBox(height: screenHeight * 0.013),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Taxes',
                style: TextStyle(fontSize: screenHeight * 0.021),
              ),
              Text('\$${'0.00'}'),
            ],
          ),
          SizedBox(
            height: screenHeight * 0.025,
          ),
          Divider(
            thickness: 3,
            color: Colors.grey[300],
            height: screenHeight * 0.015,
          ),
          SizedBox(
            height: screenHeight * 0.025,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Total',
              style: TextStyle(fontSize: screenHeight * 0.021),
            ),
            SizedBox(
              width: screenWidth * 0.03,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff015B8A),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenHeight * 0.032),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                ),
                onPressed: () {},
                child: Text(
                  'Checkout',
                  style: TextStyle(
                      color: Color(0xffFFFFFF), fontSize: screenHeight * 0.021),
                )),
          ]),
          Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "\$${total}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight * 0.028),
              ))
        ],
      ),
    );
  }
}
