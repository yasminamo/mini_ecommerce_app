import 'dart:convert';

import 'package:miniecommerce_app/Models/product_model.dart';
import 'package:http/http.dart' as http;

class GetAllProducts {
  Future<List<ProductModel>> getallproducts() async {
    http.Response response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    List<dynamic> data = jsonDecode(response.body);

    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }
    return productList;
  }
}
