import 'package:flutter/material.dart';
import 'package:miniecommerce_app/Models/product_model.dart';
import 'package:miniecommerce_app/Services/Get_All_products.dart';

class ProductProvider extends ChangeNotifier {
  final GetAllProducts productservice = GetAllProducts();
  List<ProductModel> products = [];
  bool isLoading = false;
  String? error;

  List<ProductModel> get Products => products;
  bool get isloading => isLoading;
  String? get Error => error;

  Future<void> fetchProducts() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      products = await productservice.getallproducts();
    } catch (e) {
      error = 'Failed to load products: $e';
    }

    isLoading = false;
    notifyListeners();
  }
}
