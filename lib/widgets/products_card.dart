import 'package:flutter/material.dart';
import 'package:miniecommerce_app/widgets/grid_view.dart';

class ProductsCard extends StatelessWidget {
  const ProductsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Flash Sale',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff1F1F1F),
              fontWeight: FontWeight.w400,
              fontFamily: 'Manrope',
            ),
          ),
          Gridviewcard(),
        ],
      ),
    );
  }
}
