class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final RatingModel rating;
  final String? category;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
    required this.category,
  });

  factory ProductModel.fromJson(JsonData) {
    return ProductModel(
        id: JsonData['id'],
        title: JsonData['title'],
        price: (JsonData['price'] as num).toDouble(),
        description: JsonData['description'],
        image: JsonData['image'],
        category: JsonData['category'],
        rating: RatingModel.fromjson(JsonData['rating']));
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({
    required this.rate,
    required this.count,
  });

  factory RatingModel.fromjson(JsonData) {
    return RatingModel(
        rate: (JsonData['rate'] as num).toDouble(), count: JsonData['count']);
  }
}
