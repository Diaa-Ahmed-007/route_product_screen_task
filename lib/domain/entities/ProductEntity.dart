class ProductEntity {
  ProductEntity({
      this.title, 
      this.description, 
      this.price, 
      this.discountPercentage, 
      this.rating, 
      this.images,});

  ProductEntity.fromJson(dynamic json) {
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
  }
  String? title;
  String? description;
  num? price;
  num? discountPercentage;
  num? rating;
  List<String>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    map['price'] = price;
    map['discountPercentage'] = discountPercentage;
    map['rating'] = rating;
    map['images'] = images;
    return map;
  }

}