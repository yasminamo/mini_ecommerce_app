import 'package:flutter/material.dart';
import 'package:miniecommerce_app/providers/product_provider.dart';
import 'package:miniecommerce_app/widgets/custome_card.dart';
import 'package:provider/provider.dart';

class Gridviewcard extends StatefulWidget {
  const Gridviewcard({super.key});

  @override
  State<Gridviewcard> createState() => _GridviewcardState();
}

class _GridviewcardState extends State<Gridviewcard> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: false).fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);

    return provider.isloading
        ? const Center(child: CircularProgressIndicator())
        : provider.Error != null
            ? Center(child: Text(provider.Error!))
            : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.7,
                ),
                itemCount: provider.products.length,
                itemBuilder: (context, index) {
                  final product = provider.products[index];
                  return CustomeCard(
                    id: product.id,
                    title: product.title,
                    price: product.price.toString(),
                    imageUrl: product.image,
                    rating: product.rating.rate.toString(),
                    category: product.category!,
                  );
                },
              );
  }
}
