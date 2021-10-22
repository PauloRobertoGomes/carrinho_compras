import 'package:carrinho_compras/app/shared/models/category/category_model.dart';

class ProductModel {
  CategoryModel category;
  int id;
  String title;
  int value;
  int amount;
  String image;

  ProductModel({
    this.category,
    this.id,
    this.title,
    this.value,
    this.amount,
    this.image,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? new CategoryModel.fromJson(json['category'])
        : null;
    id = json['id'];
    title = json['title'];
    value = json['value'];
    amount = json['amount'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    data['id'] = this.id;
    data['title'] = this.title;
    data['value'] = this.value;
    data['amount'] = this.amount;
    data['image'] = this.image;
    return data;
  }
}
